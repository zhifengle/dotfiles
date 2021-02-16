#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global ceTitle := "Cheat Engine 7.2"
global applyBtnTxt := "Apply"
global speedhackBtnTxt := "Enable Speedhack"

clickSpeedHackBtn() {
    ControlGet, hasApplyBtn, Visible, , %applyBtnTxt%, %ceTitle%
    if (hasApplyBtn == 0) {
        ControlClick, %speedhackBtnTxt%, %ceTitle%
        Sleep 500
        ControlClick, %applyBtnTxt%, %ceTitle%
    } else {
        ControlClick, %applyBtnTxt%, %ceTitle%
    }
}
cancelSpeedHack() {
    ControlGet, speedhackBtnChecked, Checked, , %speedhackBtnTxt%, %ceTitle%
    if (speedhackBtnChecked == 1) {
        ControlClick, %speedhackBtnTxt%, %ceTitle%
    }
    return
}
#IfWinActive ahk_exe SG7.exe
1::
clickSpeedHackBtn()
return
2::
cancelSpeedHack()
return
#IfWinActive
