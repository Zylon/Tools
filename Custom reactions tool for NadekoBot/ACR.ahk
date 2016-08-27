#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
#IfWinActive, Add Custom Reaction
if FileExist("config.json")
{
	Gui, Default
	Gui, Add, Text,, Trigger
	Gui, Add, Edit, vTrigger W250
	Gui, Add, Text,, Response
	Gui, Add, Edit, vResponse W250
	Gui, Add, Button, +center, Submit
	Gui, Show, W270 H125, Add Custom Reaction
	Hotkey, Enter, ButtonSubmit, ON
	return
	GuiClose:
		ExitApp
	ButtonSubmit:
		Gui Submit
	Hotkey, Enter, Off
Final = 
(
"CustomReactions": {
    "%Trigger%": [
      "%Response%"
    ],
)
	FileRead, CRF, config.json
	StringReplace, Var1, CRF, "CustomReactions": {, %Final%
	FileDelete, config.json
	FileAppend, %Var1%, config.json
	MsgBox,, Attention!, The Custom Reaction was added succesfully. (Be sure to restart the bot after adding Custom Reactions)
		IfMsgBox OK
			Reload
}
	else
{
	MsgBox, 0, Attention!, Could not find the file "config.json", please place this program in the data folder and try again.
		IfMsgBox OK
			ExitApp
}