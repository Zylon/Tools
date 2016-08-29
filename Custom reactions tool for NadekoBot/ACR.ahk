#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
#IfWinActive, Add Custom Reaction
	Gui, Default
	Gui, Add, Text,, Trigger
	Gui, Add, Edit, vTrigger W250
	Gui, Add, Text,, Response
	Gui, Add, Edit, vResponse W250
	Gui, Add, Text,, Response 2 (optional)
	Gui, Add, Edit, VResponse2 W250
	Gui, Add, Button, +center, Submit
	Gui, Show, W270 H175, Add Custom Reaction
	Hotkey, Enter, ButtonSubmit, ON
	return
	GuiClose:
		ExitApp
	ButtonSubmit:
		Gui Submit
	Hotkey, Enter, Off
	if (Trigger = "") or (Response = "")
{
		MsgBox,, Error, This won't work, you need a "Trigger" and a "Response".
		IfMsgBox, OK
			Reload
			Exit
}
if (Response2 = "")
{
Final =
(
"CustomReactions": {
    "%Trigger%": [
      "%Response%"
    ],
)
}
	else
{
Final = 
(
"CustomReactions": {
    "%Trigger%": [
      "%Response%",
      "%Response2%"
    ],
)
}
if FileExist("config.json")
{
	FileRead, CRF, config.json
	StringReplace, Var1, CRF, "CustomReactions": {, %Final%
	FileDelete, config.json
	FileAppend, %Var1%, config.json
	MsgBox,, Attention!, The Custom Reaction was added succesfully. (Be sure to restart the bot after adding Custom Reactions)
		IfMsgBox, OK
			Reload
			Exit
}
	else
	find_config:
	{
	MsgBox, 0, Attention!, Could not find the file "config.json", please select the data folder.
		IfMsgBox, OK
			FileSelectFolder, CFF, *%A_ScriptDir%, 1, Select Folder - Data
				if Errorlevel
					ExitApp
			CDR = %CFF%\config.json
;			MsgBox,, DEBUG, you selected the folder %CFF% and CDR is %CDR%
			if FileExist(CDR)
			{
				FileRead, CRF, %CDR%
				StringReplace, Var1, CRF, "CustomReactions": {, %Final%
				FileDelete, %CDR%
				FileAppend, %Var1%, %CDR%
				MsgBox,, Attention!, The Custom Reaction was added succesfully. (Be sure to restart the bot after adding Custom Reactions)
				{
					IfMsgBox, OK
						Reload
						Exit
				}
			}
			else
			{
				goto, find_config
			}
	}