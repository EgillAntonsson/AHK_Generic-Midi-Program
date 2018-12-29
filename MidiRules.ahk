; Map midi input to actions to execute.
; Global variables 'stb', 'data1' and others are defined and assigned in mio2.ahk

MidiRules:

if (stb = "CC")
{
  if (data1 = "22") {
    if WinExist("ahk_exe powershell.exe")
        WinActivate, ahk_exe powershell.exe
    else
        Run, powershell.exe
  } else if (data1 = "31") {
      if WinExist("ahk_exe vivaldi.exe")
        WinActivate, ahk_exe vivaldi.exe
    else
        Run, vivaldi.exe
  } else if (data1 = "26") {
    if WinExist("ahk_exe code.exe")
        WinActivate, ahk_exe code.exe
    else 
        Run, code.exe
  }
}