#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2

GroupAdd, dict, ahk_exe DeepL.exe
GroupAdd, dict, ahk_exe EBWin4.exe
GroupAdd, dict, ahk_exe EBWin.exe
GroupAdd, dict, ahk_exe chrome.exe
GroupAdd, dict, ahk_exe gvim.exe

global googleTranslateSearchX := 910
global googleTranslateSearchY := 490
global googleTranslateCopyX := 1632
global googleTranslateCopyY := 709

global deepLSearchX := 751
global deepLSearchY := 205
global deepLCopyX := 1435
global deepLCopyY := 883

clickBtn(x, y) {
    MouseGetPos, xpos, ypos
    MouseClick, left, x, y
    MouseMove, xpos, ypos
}

; 输入框搜索的，支持 Enter 搜索
inputSearchBtn(x, y) {
    MouseClick, left, x, y
    Sleep, 50
    Send, ^a{BS}^v
    Sleep, 100
    Send, {Enter}
}


; 输入框搜索 vim，支持 Enter 搜索
inputSearchBtnVim() {
    Send, {Esc}
    Sleep, 100
    Send, gi
    Sleep, 200
    Send, ^a{BS}^v
    Sleep, 100
    Send, {Enter}
}


clearAndPaste(x, y) {
    clickBtn(x, y)
    Sleep, 100
    Send, ^v
}

queryDeepL() {
    WinActivate, ahk_exe DeepL.exe
    WinWaitActive, ahk_exe DeepL.exe, , 2
    if ErrorLevel
    {
        return
    }
    clearAndPaste(deepLSearchX, deepLSearchY)
}

; 第一个标签
queryGoogle() {
    SetTitleMatchMode 2
    title = Google 翻译 ahk_exe chrome.exe
    WinActivate, ahk_exe chrome.exe
    WinWaitActive, ahk_exe chrome.exe, , 2
    if ErrorLevel
    {
        return
    }
    IfWinActive, %title%
    {
        ; 我的电脑里面的坐标
        clearAndPaste(googleTranslateSearchX,googleTranslateSearchY)
        return
    }
    ; chrome 第一个 tab
    Send, ^1
    WinWaitActive, %title%, , 2
    if ErrorLevel
    {
        return
    }
    clearAndPaste(googleTranslateSearchX,googleTranslateSearchY)
    ;MsgBox, Google 翻译 Ok!
}
queryEBwin() {
    WinActivate, ahk_exe EBWin.exe
    WinWaitActive, ahk_exe EBWin.exe, , 2
    if ErrorLevel
    {
        return
    }
    Send, ^f
    Sleep, 50
    Send, {BS}
    Send, ^v{Enter}
}
queryEBwin4() {
    WinActivate, ahk_exe EBWin4.exe
    WinWaitActive, ahk_exe EBWin4.exe, , 2
    if ErrorLevel
    {
        return
    }
    ControlSetText, Edit1, %clipboard%, ahk_exe EBWin4.exe
    ControlSend, Edit1, {Enter}, ahk_exe EBWin4.exe
}
;chrome 第二个标签，打开沪江小D
queryHj() {
    SetTitleMatchMode 2
    title = 沪江小D ahk_exe chrome.exe
    WinActivate, ahk_exe chrome.exe
    WinWaitActive, ahk_exe chrome.exe, , 2
    if ErrorLevel
    {
        return
    }
    IfWinActive, %title%
    {
        inputSearchBtnVim()
        return
    }
    ; chrome 第一个 tab
    Send, ^2
    WinWaitActive, %title%, , 2
    if ErrorLevel
    {
        return
    }
    inputSearchBtnVim()
}
writeWordsText() {
    title = words.txt ahk_exe notepad++.exe
    IfWinExist, %title%
    {
        ControlSend, Scintilla1, ^v{Enter}, %title%
        return
    }
    ControlSend, Scintilla1, ^{Numpad1}, ahk_exe notepad++.exe
    Sleep, 400
    ControlSend, Scintilla1, ^v{Enter}, %title%
}

#IfWinActive ahk_exe DeepL.exe
1::
    clearAndPaste(deepLSearchX, deepLSearchY)
return

;复制
2::
    clickBtn(deepLCopyX, deepLCopyY)
    Sleep, 200
    clipboard := Trim(clipboard, "`n`r`t ")
return

3::
    clickBtn(deepLSearchX, deepLSearchY)
return

#IfWinActive ahk_exe EBWin.exe
1::
    Send, ^f
    Sleep, 50
    Send, {BS}
    Send, ^v{Enter}
return
#IfWinActive ahk_exe EBWin4.exe
1::
    ControlSetText, Edit1, %clipboard%, ahk_exe EBWin4.exe
    ControlSend, Edit1, {Enter}, ahk_exe EBWin4.exe
return

#IfWinActive Google 翻译 - Google Chrome
1::
    clearAndPaste(googleTranslateSearchX,googleTranslateSearchY)
return

2::
    clickBtn(googleTranslateCopyX,googleTranslateCopyY)
    Sleep, 100
    clipboard := Trim(clipboard, "`n`r`t ")
return

3::
    clearAndPaste(googleTranslateSearchX,googleTranslateSearchY)
return

#IfWinActive 沪江小D ahk_exe chrome.exe
1::
    inputSearchBtnVim()
return

#IfWinActive ahk_group dict
F1::
    queryDeepL()
return
F2::
    queryGoogle()
return
F3::
    queryEBwin4()
return
F4::
    queryHj()
return
; 写入一些记录
F5::
    writeWordsText()
return
