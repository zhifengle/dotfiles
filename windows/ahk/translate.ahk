#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

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
    clearAndPaste(429, 138)
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
        clearAndPaste(925,327)
        return
    }
    ; chrome 第一个 tab
    Send, ^1
    WinWaitActive, %title%, , 2
    if ErrorLevel
    {
        return
    }
    clearAndPaste(925,327)
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
        Send,{PgUp}
        Sleep, 100
        inputSearchBtn(782, 322)
        return
    }
    ; chrome 第一个 tab
    Send, ^2
    WinWaitActive, %title%, , 2
    if ErrorLevel
    {
        return
    }
    Send,{PgUp}
    Sleep, 100
    inputSearchBtn(782, 322)
}

#IfWinActive ahk_exe DeepL.exe
1::
    clearAndPaste(429, 138)
return

;复制
2::
    clickBtn(403, 566)
    Sleep, 200
    clipboard := Trim(clipboard, "`n`r`t ")
return

3::
    clickBtn(429, 138)
return

#IfWinActive ahk_exe EBWin.exe
1::
    Send, ^f
    Sleep, 50
    Send, {BS}
    Send, ^v{Enter}
return

#IfWinActive Google 翻译 - Google Chrome
1::
    clearAndPaste(925,327)
return

2::
    clickBtn(1470,489)
    Sleep, 100
    clipboard := Trim(clipboard, "`n`r`t ")
return

3::
    clickBtn(925,327)
return

#IfWinActive ahk_exe gvim.exe
F1::
    queryDeepL()
return
F2::
    queryGoogle()
return
F4::
    queryHj()
return


#IfWinActive
F3::
    queryEBwin()
return
