#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
#IfWinActive, Credentials.json generator
MsgBox, 0, Attention!, If you do not know one of the API keys asked, just leave it blank.
Gui, Default
Gui, Add, Text,, Token
Gui, Add, Edit, vToken W250
Gui, Add, Text,, Client ID
Gui, Add, Edit, vCID W250
Gui, Add, Text,, Owner ID
Gui, Add, Edit, vOID W250
Gui, Add, Text,, Google API Key
Gui, Add, Edit, vGAK W250
Gui, Add, Text,, Sound Cloud Client ID
Gui, Add, Edit, vSCCI W250
Gui, Add, Text,, Mashape Key
Gui, Add, Edit, vMK W250
Gui, Add, Text,, Leauge Of Legends API Key
Gui, Add, Edit, vLOL W250
Gui, Add, Text,, Trello API Key
Gui, Add, Edit, vTAK W250
Gui, Add, Text,, Carbon API Key
Gui, Add, Edit, vCK W250
Gui, Add, Text,, Osu! API Key
Gui, Add, Edit, vOAK W250
Gui, Add, Button, +center, Submit
Gui, Show, W270 H495, Credentials.json generator
Hotkey, Enter, ButtonSubmit, ON
return
GuiClose:
	ExitApp
ButtonSubmit:
	Gui Submit
Hotkey, Enter, Off
Final = 
(
{
  "Token": "%token%",
  "ClientId": "%CID%",
  "BotId": %CID%,
  "OwnerIds": [
    %OID%,
  ],
  "GoogleAPIKey": "%GAK%",
  "SoundCloudClientID": "%SCCI%",
  "MashapeKey": "%MK%",
  "LOLAPIKey": "%LOL%",
  "TrelloAppKey": "%TAK%",
  "CarbonKey": "%CK%",
  "OsuAPIKey": "%OAK%"
}
)
if FileExist("credentials.json")
	MsgBox, 4, Attention!, Another copy of "credentials.json" has been found in this folder, do you wish to overwrite this?
	IfMsgBox Yes
	{
		FileDelete, %A_ScriptDir%\credentials.json
	}
	IfMsgBox No
	{
		MsgBox, 0, SoonTM, The program will now quit,3
		ExitApp
	}
FileAppend, %Final%, %A_ScriptDir%\credentials.json
MsgBox, 0, Completed, The file was succesfully created.,5