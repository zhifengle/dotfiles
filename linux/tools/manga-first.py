# 2020-02-17

import rarfile
import os, zipfile, shutil
from os import path
from os.path import join
from pathlib import PureWindowsPath
from fnmatch import fnmatch

workDir = r"J:\manga\【全汉化】单行本可以吃吗？【多纯爱向】（201-300）"
# coverDir = r'e:\comic\check\cover\301-400'

# Set to full path of unrar.exe if it is not in PATH
rarfile.UNRAR_TOOL = "D:\\Program Files\\WinRAR\\UnRAR.exe"

# Set to '\\' to be more compatible with old rarfile
rarfile.PATH_SEP = '\\'


files = [f for f in os.listdir(workDir)]
zipFiles = filter(lambda name : fnmatch(name, "*.zip"), files)
rarFiles = filter(lambda name : fnmatch(name, "*.rar"), files)


def moveFile(basePath, filename, rarName):
    shutil.move(join(basePath, filename), join(basePath, path.splitext(rarName)[0] + path.splitext(filename)[1]))


# zipfile 处理中文乱码
# for f in zipFiles:
#     with zipfile.ZipFile(path.join(workDir, f), 'r') as zf:
#         namelist = zf.namelist();
#         targetZip = namelist[0]
#         if fnmatch(targetZip, '*\\'):
#             targetZip = namelist[1]
#         # try:
#         #     name = targetZip.encode('cp437').decode('gbk')
#         # except:
#         #     name = targetZip.encode('cp437').decode('shift-jis')
#         # print(targetZip)
#         rightPath = path.join(workDir, path.splitext(f)[0]+path.splitext(targetZip)[1])

def writeFile(outputPath, originFile):
    with open(outputPath, 'wb') as outputFile:
        shutil.copyfileobj(originFile, outputFile)

def extractFirstFile(basePath, rarName, filetype='rar'):
    compressFile = rarfile.RarFile
    if filetype == 'zip':
        compressFile = zipfile.ZipFile
    file1 = path.join(basePath, rarName)
    with compressFile(file1) as rf:
        rf.setpassword('天照大御神')
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
