LWIN & LButton::
SetTitleMatchMode, 2

w = 1920
h = 1080

WinGet Style, Style, A
if(Style & 0xC40000) {
  WinGetPos, X, Y, Width, Height, A
  WinSet, Style, -0xC40000, A
  WinMove,A,,0,0,w,h
} else {
  WinSet, Style, +0xC40000, A
  WinMove,A,,%X%,%Y%,%Width%,%Height%
}
return
;