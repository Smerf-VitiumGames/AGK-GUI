// File: run_window.agc
// Created: 22-03-21

function MakeWindow()
	Local Ret as Integer
	ret=DrawGadget(2,-1)
endfunction API.Gadget[ret].ID


function setWindowTextSize(ID,value)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].TextSize=value
	Endif
endfunction


function SetWindowResize(ID,bool)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].ResizeBool=bool
	Endif
endfunction


function SetWindowMove(ID,bool)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].dragbool=bool
	Endif
endfunction


Function setWindowText(ID,textString as string)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].TextStr[0]=TextString
	Endif
endfunction


function SetWindowColor(ID,col)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].SpriteColor=col
	Endif
endfunction


function SetWindowBgColor(ID,col)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].bgColor=col
		Drawgadget(2,ID)`send arrayID to rebuild
	Endif
endfunction


Function SetWindowPositionXY(ID,x,y)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].PositionX =x
		API.Gadget[ID].PositionY =y
		setSpriteposition(API.Gadget[ID].SpriteID,x,y)
	Endif
endfunction


Function setWindowWIDth(ID,wIDth)

	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].WIDth=wIDth
		Drawgadget(2,ID)`send arrayID to rebuild
	Endif
endfunction

Function setWindowHeight(ID,Height)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].height=Height
		Drawgadget(2,ID)
	Endif
endfunction

function SetWindowBgImageOff(ID)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].BgImageID=-1
		Drawgadget(2,ID)`send arrayID to rebuild
	Endif
endfunction


Function setWindowSizeXY(ID,x,y)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].height=y
		API.Gadget[ID].wIDth=x
		Drawgadget(2,ID)
	Endif
endfunction


function getWindowExists(ID)`ID=array
	Local Ret as Integer
	if API.Gadget.length >= ID
		if API.Gadget[ID].kind=2 
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret


function getID(ID)
	Local Ret as Integer
	ret=-1
	For i=0 to API.Gadget.length
		if API.Gadget[i].ID=ID
			ret=i
			exit
		Endif
	next
endfunction ret