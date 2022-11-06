#SingleInstance force
global game_path =
global screenshot =
global screenshot_key =
global game_pic_path =
IniRead, screenshot, setting.ini, gal, screenshot
IniRead, screenshot_key, setting.ini, gal, screenshot_key
IniRead, game_path, setting.ini, gal, game_path
IniRead, game_pic_path, setting.ini, gal, game_pic_path

; 必须全局添加
SplitPath, game_path, game_exe
GroupAdd, galgame, ahk_exe %game_exe%

Hotkey,%screenshot_key%,ScreenshotKey
return

#IfWinActive ahk_group galgame
ScreenshotKey:
WinGetTitle, Title, A
WinGetClass, class, A
SplitPath, game_path, game_exe
target := RegExReplace(game_exe, "\.exe$", "")
pic_folder = %game_pic_path%\%target%
if !FileExist(pic_folder)
    FileCreateDir, %pic_folder%
Run, %screenshot% -w "%Title%" -c "%class%" -n "%target%", %game_pic_path%\%target%, hide, npPid
;clipboard = %screenshot% -w "%Title%" -c "%class%" -n "%target%"
return
