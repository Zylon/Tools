#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2
#IfWinActive, 7-Zip self-extracting archive
DetectHiddenWindows, On
DetectHiddenText, On
MsgBox, 4, Confirmation, Are you sure you want do install NadekoBot here?
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
Run, %A_ScriptDir%\updater.exe, Hide
SplashTextOn, 200, 35, Installer, Busy extracting the updater.
WinWait, 7-Zip self-extracting archive,, 3
ControlSend, Extract, {space}, 7-Zip self-extracting archive
WinWait, Extracting
WinHide, Extracting
sleep, 1500
If FileExist("NadekoUpdater.bat")
{
	SplashTextOff
	MsgBox,, Completed, Succesfully extracted the files.
		IfMsgBox OK
			ExitApp
}