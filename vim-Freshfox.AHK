FirefoxDev := "Firefox Developer Edition"

HWND := WinExist("A")

Winexist(FirefoxDev)
WinActivate

Send "{F5}"

WinExist("ahk_id" HWND)
WinActivate