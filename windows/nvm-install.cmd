@echo off
set /P NVM_PATH="Enter the absolute path where the nvm-windows zip file is extracted/copied to: "
set NVM_HOME=%NVM_PATH%
set NVM_SYMLINK=D:\apps\nodejs
setx NVM_HOME "%NVM_HOME%"
setx NVM_SYMLINK "%NVM_SYMLINK%"

(echo PATH=%PATH%) > %NVM_HOME%\PATH.txt

setlocal EnableExtensions DisableDelayedExpansion
set "UserPath="
for /F "skip=2 tokens=1,2*" %%G in ('%SystemRoot%\System32\reg.exe query "HKCU\Environment" /v "Path" 2^>nul') do if /I "%%G" == "Path" (
    if /I "%%H" == "REG_EXPAND_SZ" (call set "UserPath=%%I") else if /I "%%H" == "REG_SZ" set "UserPath=%%I"
    if defined UserPath goto SetMyPath
)
echo User PATH is not defined or has no string value.
goto EndBatch

:SetMyPath
setx PATH "%UserPath%;%%NVM_HOME%%;%%NVM_SYMLINK%%"
endlocal

:EndBatch
if exist "%SYSTEMDRIVE%\Program Files (x86)\" (
set SYS_ARCH=64
) else (
set SYS_ARCH=32
)
(echo root: %NVM_HOME% && echo path: %NVM_SYMLINK% && echo arch: %SYS_ARCH% && echo proxy: none) > %NVM_HOME%\settings.txt

notepad %NVM_HOME%\settings.txt
@echo on
