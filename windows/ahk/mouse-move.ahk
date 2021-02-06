#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^!w::MouseMove,0,-1,0,R ;Moves the mouse cursor 1 pixel down from its current position.

^!a::MouseMove,-1,0,0,R ;Moves the mouse cursor 1 pixel left from its current position.

^!s::MouseMove,0,1,0,R ;Moves the mouse cursor 1 pixel up from its current position.

^!d::MouseMove,1,0,0,R ;Moves the mouse cursor 1 pixel right from its current position.
