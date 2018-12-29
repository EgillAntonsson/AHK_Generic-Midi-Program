; Define your 'midi input to actions to execute' mapping below.
; Global variables 'stb', 'data1' and others are defined and assigned in mio2.ahk

MidiRules:

GroupAdd, ps_group, ahk_exe powershell.exe
GroupAdd, code_group, ahk_exe code.exe
GroupAdd, chrome_group, ahk_exe chrome.exe
GroupAdd, vivaldi_group, ahk_exe vivaldi.exe

if (stb = "CC")
{
	if (data1 = "22")
	{
		if WinExist("ahk_exe powershell.exe")
			GroupActivate, ps_group
		else
			Run, powershell
	}
	else if (data1 = "24")
	{
		if WinExist("ahk_exe chrome.exe")
			GroupActivate chrome_group
		else
			Run, chrome
	}
	else if (data1 = "25")
	{
		if WinExist("ahk_exe vivaldi.exe")
			GroupActivate vivaldi_group
		else
			Run, vivaldi
	}
	else if (data1 = "26")
	{
		if WinExist("ahk_exe code.exe")
			GroupActivate code_group
		else 
			Run, code.exe
	}
}