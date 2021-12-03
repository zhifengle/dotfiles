#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; ComSpec
Run cmd.exe /k ".\.venv\Scripts\activate.bat"
WinWaitActive, ahk_exe cmd.exe, , 2
if ErrorLevel
{
    MsgBox, 打开 cmd 失败
    return
}
Send, python t.py
Send, {Enter}
