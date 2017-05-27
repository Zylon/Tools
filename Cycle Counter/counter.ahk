#NoEnv
SendMode Input
SetBatchLines, -1
StartTime := A_TickCount
Loop
{
	ElapsedTime := A_TickCount - StartTime
	SemiElapsedTime := ElapsedTime / 1000
	RealElapsedTime := Round(SemiElapsedTime)
	SplashTextOn, % 250, 50, 1000.000.000, Iteration: %A_Index% `n Time spend: %RealElapsedTime% seconds
	if A_Index = 1000000000
	{
		MsgBox,, DONE, 1000000000 loops done in %RealElapsedTime% Seconds
		{
			IfMsgBox OK
			{
				ExitApp
			}
		}
	}
}