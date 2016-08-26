#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Gui, Default
Gui, Add, Text,, Trigger
Gui, Add, Edit, vTrigger W250
Gui, Add, Text,, Response
Gui, Add, Edit, vResponse W250
Gui, Add, Button, +center, Submit
Gui, Show, W270 H125, Add Custom Reaction
return

ButtonSubmit:
Gui Submit
send, %Trigger%
send, %Response%
if (%Trigger% !=) {
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
		ExitApp
}
	else
	{
		MsgBox,, Error, Something went wrong, please try again.
		ExitApp
	}