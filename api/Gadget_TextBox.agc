// File: Run_TextBox.agc
// Created: 22-06-27


Function RunTextBox()
	For i = 0 to API.gadget.Length
		if API.Gadget[i].Kind=5
			if i=API.Active and API.Gadget[i].editMode=0
				GetInput(i)
				
				`
				`
				`
				`
				`
				`
				`
			Endif
		Endif
	next
endfunction


function GetInput(i)
	findEditLine(i)
	`BlinkCursor()
	`if androID
	`Endif
	if GetRawKeyState(62)=1
			end
		Endif
	`if pc
	global raw
	raw=GetRawLastKey()
	if getrawkeypressed(raw)=1 then API.KeyPress=raw `store current key down
	if API.KeyPress >0 and getrawkeypressed(API.KeyPress)=0 `key was down now is up
		`reSetkey
		char=API.keypress
		
		if char<>8
			char=findascii(char)
		Endif
		if char=8 `shift chars
			API.Gadget[i].TextStr[0]= left( API.Gadget[i].TextStr[0],  len(API.Gadget[i].Textstr[0])    -1)
		Endif

		IF CHAR <> 8
			
			API.Gadget[i].TextStr[0]=API.Gadget[i].Textstr[0]+ chr(char)
		Endif
		API.KeyPress=0
		DrawGadget(5,i)
	Endif
	`8 backspace
	`tab 9
	`shift 16
	`lctrl 17
endfunction

function findAscii(char)
	agk as integer[40]
	shift as integer [40]
	keys as integer[40]
	agk=  [96 ,49,50,51,52,53,54,55,56,57,48,189,187,65,66,67, 68, 69, 70, 71, 72,73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83,84, 85, 86, 87, 88, 89,90,219, 221,220,186,222,13,188,190,191,192]     
	shift=[126,33,64,35,36,37,94,38,42,40,41, 95, 43,65,66,67, 68, 69, 70, 71, 72, 73,74, 75, 76, 77, 78, 79, 80, 81,82, 83, 84, 85, 86, 87, 88, 89,90, 123,125,124, 58, 34,13, 60, 62, 63,126]
	keys= [96 ,49,50,51,52,53,54,55,56,57,48, 45, 61,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122, 91, 93, 92, 59, 39,13, 44, 46, 47,96]	
	For i = 0 to keys.Length
		if agk[i]=Char AND GetRawKeyState(16)=0
			char=keys[i]
		Endif
		if agk[i]=Char AND GetRawKeyState(16)=1 
			char=shift[i]
		Endif
	next
endfunction char

function findEditLine(id)
	startX=API.gadget[id].Textx
	startY=API.gadget[id].Texty
	size=API.gadget[id].TextSize
	temp=createtext("s")
	SetTextSize(temp,size)
	Height=GetTextTotalHeight(temp)
	deletetext(temp)

	if API.mouse.y -API.gadget[API.active].PositionY -starty
		Print (    ((API.mouse.y -API.gadget[API.active].PositionY -starty))/height       )
	Endif
endfunction




function SetTextBoxFormat()
endfunction

function SetTextBoxToInteger()
endfunction


function SetTextBoxToStrings()
endfunction
function Markup() `called from  gadget_build
endfunction
