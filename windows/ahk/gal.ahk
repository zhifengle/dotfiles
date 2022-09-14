#SingleInstance force
global file =
global counter =
global game_path =
global new_pid =
global txt_path =
global shortcut_key =
global empty_line_key =
global empty_line_key =
global screenshot =
global screenshot_key =
global game_pic_path =
OnExit("exit_function")
IniRead, game_path, setting.ini, gal, game_path
IniRead, shortcut_key, setting.ini, gal, shortcut_key
IniRead, empty_line_key, setting.ini, gal, empty_line_key
IniRead, screenshot_key, setting.ini, gal, screenshot_key
IniRead, game_pic_path, setting.ini, gal, game_pic_path
IniRead, screenshot, setting.ini, gal, screenshot
IniRead, txt_path, setting.ini, gal, txt_path
IniRead, enable_tool, setting.ini, gal, enable_tool
IniRead, enable_txt, setting.ini, gal, enable_txt

clipboard := repalce_path_quote(clipboard)
ifExist, %clipboard%
{
    ; 如果剪切板里面有 exe 路径写入配置文件
	pos := RegExMatch(clipboard, "\.exe|\.EXE$")
    if (pos != 0)
    {
		StringReplace, clipboard, clipboard, `", , All
		game_path = %clipboard%
		MsgBox, 将路径写入配置`r%clipboard%
        IniWrite, %clipboard%, setting.ini, gal, game_path
    }
    else
    {
		MsgBox, 无效的路径`r%clipboard%
		exit_function()
    }		
}

; 必须全局添加
SplitPath, game_path, game_exe
GroupAdd, galgame, ahk_exe %game_exe%
; ebwin group
IniRead, ebwin, setting.ini, gal, ebwin
SplitPath, ebwin, exe
GroupAdd, ebwin, ahk_exe %exe%
GroupAdd, galgame, ahk_exe %exe%
; ithvnr group
IniRead, ithvnr, setting.ini, gal, ithvnr
SplitPath, ithvnr, ithvnr_exe
GroupAdd, ithvnr, ahk_exe %ithvnr_exe%
GroupAdd, galgame, ahk_exe %ithvnr_exe%
; Magpie group
IniRead, magpie, setting.ini, gal, magpie
SplitPath, magpie, exe
GroupAdd, magpie, ahk_exe %exe%


Hotkey, IfWinActive, ahk_group galgame
Hotkey,%shortcut_key%,SaveKeyExe
Hotkey,%empty_line_key%,EmptyLineKey
Hotkey,%screenshot_key%,ScreenshotKey
;Hotkey, IfWinActive, ahk_group ebwin
;Hotkey,%shortcut_key%,SaveKeyEBWin

if (enable_tool = 1)
	start_tools()
if (enable_txt = 1)
	init_write_file()
Sleep 100
start_game()
return

exit_function()
{
	if IsObject(file)
	{
		file.Close()
	}	
}

init_write_file()
{
	counter := 0
	SplitPath, game_path, game_exe
	target := RegExReplace(game_exe, "\.exe$", "")
	target = %txt_path%\%target%.txt
	if IsObject(file)
		file.Close()
	file := FileOpen(target, "a", "UTF-8")
}

start_tools()
{
	IfWinNotExist, ahk_group ebwin
	{
		IniRead, ebwin, setting.ini, gal, ebwin
		ebwin := repalce_path_quote(ebwin)
		run_exe_file(ebwin)
	}
	Sleep 100
	IfWinNotExist, ahk_group ithvnr
	{
		IniRead, ithvnr, setting.ini, gal, ithvnr
		ithvnr := repalce_path_quote(ithvnr)
		run_exe_file(ithvnr)
	}
	run_tool("magpie")
	
}
run_tool(name)
{
	IniRead, exe_path, setting.ini, gal, %name%
	exe_path := repalce_path_quote(exe_path)
	SplitPath, exe_path, exe_name
	IfWinNotExist, ahk_exe %exe_name%
	{
		run_exe_file(exe_path)
	}
}

start_game()
{
	IfWinNotExist, ahk_group galgame
	{
		IniRead, leproc, setting.ini, gal, leproc
		IniRead, disable_le, setting.ini, gal, disable_le
		if (disable_le = 1)
			Run, %game_path%,,, new_pid
		else
			Run, %leproc% %game_path%,,, new_pid
	}
}
repalce_path_quote(target_path)
{
	StringReplace, target_path, target_path,`",,All
	return target_path
}
run_exe_file(exe_path)
{
	ifExist, %exe_path%
		Run, %exe_path%
	else
		MsgBox, 无效的路径`r`r%exe_path%
}
append_txt()
{
	if !IsObject(file)
	{
		MsgBox, txt 文件不存在
		counter := 0
	}
	else
	{
		text1 = %clipboard%`r
		file.WriteLine(text1)
		counter += 1
	}
	if counter > 50
		init_write_file()
}
append_line_txt()
{
    if !IsObject(file)
    {
        MsgBox, txt 文件不存在
        counter := 0
    }
    else
    {
        text1 = `r
        file.WriteLine(text1)
    }
}

append_txt_old()
{
	SplitPath, game_path, game_exe
	target := RegExReplace(game_exe, "\.exe$", "")
	target = %txt_path%\%target%.txt
	
	file := FileOpen(target, "a", "UTF-8")
	file.WriteLine(clipboard)
	file.Close()
}

!1::Reload
#IfWinActive ahk_group galgame
SaveKeyExe:
append_txt()
return
EmptyLineKey:
append_line_txt()
return
ScreenshotKey:
WinGetTitle, Title, A
SplitPath, game_path, game_exe
target := RegExReplace(game_exe, "\.exe$", "")
Run, %screenshot% -w "%Title%" -n "%target%", %game_pic_path%\%target%, hide, npPid
return


#IfWinActive ahk_group ebwin
#include auto_copy.ahk
MButton::
; 输入单词
ControlSetText, Edit1, %clipboard%, ahk_group ebwin
ControlSend, Edit1, {Enter}, ahk_group ebwin
return


#IfWinActive ahk_group ithvnr
MButton::
;MouseGetPos, xpos, ypos
WinActivate, ahk_group ebwin
; 输入单词
ControlSetText, Edit1, %clipboard%, ahk_group ebwin
ControlSend, Edit1, {Enter}, ahk_group ebwin
return
