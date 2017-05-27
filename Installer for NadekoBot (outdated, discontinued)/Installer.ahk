#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
#IfWinActive, 7-Zip self-extracting archive
DetectHiddenWindows, On
DetectHiddenText, On
OU := RegExReplace(A_ScriptDir, "\\[^\\]+$")
SIL = %OU%\NadekoBot
IL = %OU%\NadekoBot\credentials.json
MsgBox, 4, Confirmation, Are you sure you want to install NadekoBot in:"%SIL%"?
	IfMsgBox Yes
	{
		SplashTextOn, 200, 35, Downloading, Busy downloading 7304KB.
		URLDownloadToFile, https://www.dropbox.com/s/aulc1wnksplcc8a/updater.exe?dl=1, updater.exe
		SplashTextOff
	}
	IfMsgBox No
	{
		ExitApp
	}
Run, %A_ScriptDir%\updater.exe,, Hide
SplashTextOn, 200, 35, Installer, Busy extracting the updater...
WinWait, 7-Zip self-extracting archive
ControlSend, Extract, {space}, 7-Zip self-extracting archive
WinWait, Extracting
WinHide, Extracting
WinWaitClose, Extracting
SplashTextOff
FileDelete %A_ScriptDir%\updater.exe
SetKeyDelay, 10, 10
Run, %A_ScriptDir%\NadekoUpdater.bat,, Hide
SplashTextOn, 200, 35, Installer, Busy installing Nadeko...
WinWait, ahk_exe cmd.exe
sleep, 1000
ControlSend,, 2{enter}, ahk_exe cmd.exe
sleep, 1000
ControlSend,, y{enter}, ahk_exe cmd.exe
sleep, 25000
WinClose, ahk_exe cmd.exe
SplashTextOff
MsgBox,, Installer, Succesfully installed NadekoBot
#IfWinActive, Credentials.json generator
MsgBox, 0, Attention!, If you do not know one of the API keys asked, just leave it blank.
Gui, Default
Gui, Add, Text,, Token
Gui, Add, Edit, vTOK W250
Gui, Add, Text,, Client ID
Gui, Add, Edit, vCID W250
Gui, Add, Text,, Owner ID
Gui, Add, Edit, vOID W250
Gui, Add, Text,, Google API Key
Gui, Add, Edit, vGAK W250
Gui, Add, Text,, Sound Cloud Client ID
Gui, Add, Edit, vSCCI W250
Gui, Add, Text,, Mashape API Key
Gui, Add, Edit, vMAK W250
Gui, Add, Text,, Leauge Of Legends API Key
Gui, Add, Edit, vLOL W250
Gui, Add, Text,, Trello API Key
Gui, Add, Edit, vTAK W250
Gui, Add, Text,, Carbon API Key
Gui, Add, Edit, vCAK W250
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
  "Token": "%TOK%",
  "ClientId": "%CID%",
  "BotId": %CID%,
  "OwnerIds": [
    %OID%,
  ],
  "GoogleAPIKey": "%GAK%",
  "SoundCloudClientID": "%SCCI%",
  "MashapeKey": "%MAK%",
  "LOLAPIKey": "%LOL%",
  "TrelloAppKey": "%TAK%",
  "CarbonKey": "%CAK%",
  "OsuAPIKey": "%OAK%"
}
)
MsgBox, 4, debug, are you sure you want to save the file: %IL%
IfMsgBox, Yes
{
	FileDelete, %IL%
	FileAppend, %Final%, %IL%
	ExitApp
}
IfMsgBox, No
{
	ExitApp
}