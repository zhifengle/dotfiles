# 提取漫画首页的

import rarfile
import os, zipfile, shutil
from os import path
from os.path import join
from pathlib import PureWindowsPath
from fnmatch import fnmatch

# 这里设置漫画的路径
workDir = r"e:\comic\test"

# 设置 unrar.exe 路径
rarfile.UNRAR_TOOL = r"D:\Program Files\WinRAR\UnRAR.exe"

# Set to '\\' to be more compatible with old rarfile
rarfile.PATH_SEP = '\\'


files = [f for f in os.listdir(workDir)]
zipFiles = filter(lambda name : fnmatch(name, "*.zip"), files)
rarFiles = filter(lambda name : fnmatch(name, "*.rar"), files)


def moveFile(basePath, filename, rarName):
    shutil.move(join(basePath, filename), join(basePath, path.splitext(rarName)[0] + path.splitext(filename)[1]))


def writeFile(outputPath, originFile):
    with open(outputPath, 'wb') as outputFile:
        shutil.copyfileobj(originFile, outputFile)

def extractFirstFile(basePath, rarName, filetype='rar'):
    compressFile = rarfile.RarFile
    if filetype == 'zip':
        compressFile = zipfile.ZipFile
    file1 = path.join(basePath, rarName)
    with compressFile(file1) as rf:
        # 如果需要设置解压密码在这里设置
        # rf.setpassword('pw')
        lst = rf.namelist()
        idx = 0
        firstFile = lst[idx]
        while not PureWindowsPath(firstFile).suffix and idx < len(lst):
            idx += 1
            firstFile = lst[idx]
        if not PureWindowsPath(firstFile).suffix:
            return
        with rf.open(firstFile, 'r') as originFile:
            writeFile(path.join(basePath, path.splitext(rarName)[0]+path.splitext(firstFile)[1]), originFile)

for f in zipFiles:
    extractFirstFile(workDir, f, 'zip')
for f in rarFiles:
    extractFirstFile(workDir, f, 'rar')
