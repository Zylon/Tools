MsgBox, 0, Attention!, If you do not know one of the API keys asked, just leave it blank.
{InputBox, Token, Token, Please enter your bots Token here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %Token%
}
{InputBox, ClientID, Client ID, Please enter the Client ID of the Bot here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %ClientID%
}
{InputBox, OwnerID, Owner ID, Please enter your own ID here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %OwnerID%
}
{InputBox, GAK, Google API Key, Please enter your Google API Key here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %GAK%
}
{InputBox, SCCI, SoundCloud Client ID, Please enter your SoundCloud Client ID here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %SCCI%
}
{InputBox, MK, Mashape API Key, Please enter your Mashape API Key here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %MK%
}
{InputBox, LOL, LOL API Key, Please enter your Leauge Of Legends API Key here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %LOL%
}
{InputBox, TAK, Trello API Key, Please enter your Trello Key here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %TAK%
}
{InputBox, CK, Carbon API Key, Please enter your Carbon Key here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %CK%
}
{InputBox, OAK, Osu! API Key, Please enter your Osu! API Key here.
if ErrorLevel
{
	MsgBox, Something went wrong, please try again.
	ExitApp
}
;else
;	MsgBox, Returned value: %OAK%
}
Final = 
(
{
  "Token": "%token%",
  "ClientId": "%ClientID%",
  "BotId": %ClientID%,
  "OwnerIds": [
    %OwnerID%,
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
		FileAppend, %Final%, %A_ScriptDir%\credentials.json
	}
	IfMsgBox No
	{
		MsgBox, 0, SoonTM, The program will now quit,3
		ExitApp
	}