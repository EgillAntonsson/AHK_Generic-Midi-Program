;Last edited 12/19/2018 9:28 AM by genmce
/* 
;*************************************************
;*             GENERIC MIDI APP V.0.7 
;*************************************************

THIS IS THE PROGRAM TO RUN! 
EDIT THE OTHER FILES 
#Include MidiRules.ahk              ; this file contains: Rules for transforming midi input.
#Include hotkeyTOmidi_1.ahk         ; this file contains: examples of HOTKEY generated midi messages to be output - the easy way!
#Include hotkeyTOmidi_2.ahk         ; this file contains: examples of HOTKEY generated midi messages to be output - the BEST way!

Midi messages: Here is a good reference https://stackoverflow.com/questions/29481090/explanation-of-midi-messages
Example message: 10010011 00011011 0111111
Where the first byte is the status byte, 2nd byte is the data1 byte, and 3rd byte is the data 2 byte
status    data1    data2
10010011 00011011 0111111
Status is the type of message (note on/off, CC, program change... etc + the midi channel)
Data 1 - midi note# (for note messages), cc# (for CC messages)
Data 2 - midi note Velocity (for note on/off messages, CC value (for CC messages)

*/
#Persistent
#SingleInstance , force         	                                                    ; Only run one instance
SendMode Input                              	                                ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%       	                                ; Ensures a consistent starting directory.
if A_OSVersion in WIN_NT4,WIN_95,WIN_98,WIN_ME  ; If not Windows XP or greater, quit program
{   
   MsgBox This script requires Windows 2000/XP or later.
    ExitApp
}
;*************************************************
version = Generic_Midi_App_0.71  ; Version name and number
;*************************************************
readini()                                            ; Load values from the ini file, via the readini function - see Midi_In_Out_Lib.ahk file
gosub, MidiPortRefresh                  ; used to refresh the input and output port lists - see Midi_In_Out_Lib.ahk file
port_test(numports,numports2)   ; test the ports - check for valid ports? - see Midi_In_Out_Lib.ahk file
gosub, midiin_go                            ; opens the midi input port listening routine see Midi_In_Out_Lib.ahk file
gosub, midiout                               ; opens the midi out port see Midi_In_Out_Lib.ahk file 
gosub, midiMon                             ; see below - a monitor gui - see Midi_In_Out_Lib.ahk file  COMMENT THIS OUT IF YOU DON'T WANT DISPLAY

;*************************************************
;*              INCLUDE FILES -
;*  these files need to be in the same folder
;*************************************************
#Include MidiRules.ahk              ; this file contains: Rules for manipulating midi input then sending modified midi output.
#Include mio2.ahk