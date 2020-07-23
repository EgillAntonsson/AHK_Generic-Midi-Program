; Translates midi messages from my piano to keyboard input

; Global variables 'stb', 'data1' and others are defined and assigned in mio2.ahk

; for debugging --- start ---
; to view VK and SC of keystrokes
; KeyHistory
; #InstallKeybdHook

; MsgBox, ["For debugging"]
; for debugging --- end ---

MidiRules:

global minVelForHardPush := 54

leftPedalNumber := 67
middlePedalNumber := 66
rightPedalNumber := 64

global isLeftPedalDown
global isMiddlePedalDown ; not used at the moment

global isCtrlDown
global isAltDown
global isWinDown
global isShiftDown

global key

SendMode Input

PressLetter(k, note, velocity) {
	key := k
	if (velocity < minVelForHardPush) {
		Send {%k%}
	} else {
		Send +{%k%}
	}
}

PressSoftHard(soft, hard, note, velocity, softWithShift := 0, hardWithShift := 0) {
	if (velocity < minVelForHardPush) {
		key := soft
		if (softWithShift = 1) {
			Send +{%soft%}
		} else {
			Send {%soft%}
		}
	} else {
		key := hard
		if (hardWithShift = 1) {
			Send +{%hard%}
		} else {
			Send {%hard%}
		}
	}
}

Press(k) {
	key := k
	Send {%k%}
}

if (stb = "NoteOn") {
	if (data1 = 41) {
		Send {vkE2sc056} ; combi key
	}
	if (data1 = 42) {
		Press("$")
	}
	if (data1 = 43) {
		PressSoftHard("?", "@", data1, data2)
	}
	if (data1 = 44) {
		PressLetter(";", data1, data2)
	}
	if (data1 = 45) {
		PressSoftHard("#", "#", data1, data2, 1)
	}
	if (data1 = 46) {
		PressSoftHard(",", ".", data1, data2)
	}
	if (data1 = 47) {
		PressLetter("'", data1, data2)
	}
	if (data1 = 48) {
		if (isLeftPedalDown = 1) {
			Press("F12")
		} else {
			PressLetter("q", data1, data2)
		}
	}
	if (data1 = 49) {
		if (isLeftPedalDown = 1) {
			Press("F11")
		} else {
			PressLetter("a", data1, data2)
		}
	}
	if (data1 = 50) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("1", "F1", data1, data2)
		} else {
			PressLetter("j", data1, data2)
		}
	}
	if (data1 = 51) {
		if (isLeftPedalDown = 1) {
			Press("<")
		} else {
			PressLetter("o", data1, data2)
		}
	}
	if (data1 = 52) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("2", "F2", data1, data2)
		} else {
			PressLetter("k", data1, data2)
		}
	}
	if (data1 = 53) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("3", "F3", data1, data2)
		} else {
			PressLetter("x", data1, data2)
		}
	}
	if (data1 = 54) {
		if (isLeftPedalDown = 1) {
			Press("[")
		} else {
			PressLetter("e", data1, data2)
		}
	}
	if (data1 = 55) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("4", "F4", data1, data2)
		} else {
			PressLetter("p", data1, data2)
		}
	}
	if (data1 = 56) {
		if (isLeftPedalDown = 1) {
			Press("{")
		} else {
			PressLetter("u", data1, data2)
		}
	}
	if (data1 = 57) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("5", "F5", data1, data2)
		} else {
			PressLetter("y", data1, data2)
		}
	}
	if (data1 = 58) {
		if (isLeftPedalDown = 1) {
			Press("(")
		} else {
			PressLetter("i", data1, data2)
		}
	}
	if (data1 = 59) {
		Send {Ctrl down}
		isCtrlDown := 1
	}
	if (data1 = 60) {
		Send {Alt down}
		isAltDown := 1
	}
	if (data1 = 61) {
		Send {LWin down}
		isWinDown := 1
	}
	if (data1 = 62) {  ; middle 'd' on the piano keybard
		PressSoftHard("Space", "Tab", data1, data2)
	}
	if (data1 = 63) {
		Send {Shift down}
		isShiftDown := 1
	}
	if (data1 = 64) {
		PressSoftHard("Del", "Esc", data1, data2)
	}
	if (data1 = 65) {
		PressSoftHard("BS", "Enter", data1, data2)
	}
	if (data1 = 66) {
		if (isLeftPedalDown = 1) {
			Press(")")
		} else {
			PressLetter("d", data1, data2)
		}
	}
	if (data1 = 67) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("6", "F6", data1, data2)
		} else {
			PressLetter("f", data1, data2)
		}
	}
	if (data1 = 68) {
		if (isLeftPedalDown = 1) {
			Press("}")
		} else {
			PressLetter("h", data1, data2)
		}
	}
	if (data1 = 69) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("7", "F7", data1, data2)
		} else {
			PressLetter("g", data1, data2)
		}
	}
	if (data1 = 70) {
		if (isLeftPedalDown = 1) {
			Press("]")
		} else {
			PressLetter("t", data1, data2)
		}
	}
	if (data1 = 71) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("8", "F8", data1, data2)
		} else {
			PressLetter("c", data1, data2)
		}
	}
	if (data1 = 72) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("9", "F9", data1, data2)
		} else {
			PressLetter("r", data1, data2)
		}
	}
	if (data1 = 73) {
		if (isLeftPedalDown = 1) {
			Press(">")
		} else {
			PressLetter("n", data1, data2)
		}
	}
	if (data1 = 74) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("0", "F10", data1, data2)
		} else {
			PressLetter("l", data1, data2)
		}
	}
	if (data1 = 75) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("=", "!", data1, data2)
		} else {
			PressLetter("s", data1, data2)
		}
	}
	if (data1 = 76) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("*", "^", data1, data2)
		} else {
			PressLetter("b", data1, data2)
		}
	}
	if (data1 = 77) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("+", "~", data1, data2)
		} else {
			PressLetter("m", data1, data2)
		}
	}
	if (data1 = 78) {
		PressLetter("-", data1, data2)
	}
	if (data1 = 79) {
		if (isLeftPedalDown = 1) {
			Press("&")
		} else {
			PressLetter("w", data1, data2)
		}
	}
	if (data1 = 80) {
		PressSoftHard("/", "%", data1, data2)
	}
	if (data1 = 81) {
		if (isLeftPedalDown = 1) {
			PressSoftHard("|", "\", data1, data2)
		} else {
			PressLetter("v", data1, data2)
		}
	}
	if (data1 = 82) {
		count := (data2 < minVelForHardPush) ? 1 : 4
		Loop, %count% {
			Send {Left}
		}
	}
	if (data1 = 83) {
		PressLetter("z", data1, data2)
	}
	if (data1 = 84) {
		if (data2 < minVelForHardPush) {
			Send ^{Left}
		} else {
			Send {Home}
		}
	}
	if (data1 = 85) {
		count := (data2 < minVelForHardPush) ? 1 : 5
		Loop, %count% {
			Send {Up}
		}
	}
	if (data1 = 86) {
		if (data2 < minVelForHardPush) {
			Loop, 15 {
				Send {Up}
			}
		} else {
			Send {PgUp}
		}
	}
	if (data1 = 87) {
		count := (data2 < minVelForHardPush) ? 1 : 5
		Loop, %count% {
			Send {Down}
		}
	}
	if (data1 = 88) {
		if (data2 < minVelForHardPush) {
			Loop, 15 {
				Send {Down}
			}
		} else {
			Send {PgDn}
		}
	}
	if (data1 = 90) {
		count := (data2 < minVelForHardPush) ? 1 : 4
		Loop, %count% {
			Send {Right}
		}
	}
	if (data1 = 91) {
		if (data2 < minVelForHardPush) {
			Send ^{Right}
		} else {
			Send {End}
		}
	}
}

if (stb = "CC")	{
	if (data1 = leftPedalNumber)	{
		 if (data2 = 127)	{
			 isLeftPedalDown := 1
		 } else {
			 isLeftPedalDown := 0
		 }
	}
	if (data1 = middlePedalNumber) {
		if (data2 = 127)	{
			isMiddlePedalDown := 1
		 } else {
			 isMiddlePedalDown := 0
		 }
	}
	if (data1 = rightPedalNumber) {
		if (key)	{
			Send {%key%}
		}
	}
}

if (stb = "NoteOff") {
	if (key)
	{
		key := ""
	}
	if (isCtrlDown = 1 and data1 = 59) {
		Send {Ctrl up}
		isCtrlDown := 0
	}
	if (isAltDown = 1 and data1 = 60) {
		Send {Alt up}
		isAltDown := 0
	}
	if (isWinDown = 1 and data1 = 61) {
		Send {LWin up}
		isWinDown := 0
	}
	if (isShiftDown = 1 and data1 = 63) {
		Send {Shift up}
		isShiftDown := 0
	}
}