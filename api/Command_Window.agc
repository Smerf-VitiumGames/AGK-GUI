// File: run_window.agc
// Created: 22-03-21

function MakeWindow()
	Local Ret as Integer
	ret=DrawGadget(2,-1)
endfunction API.Gadget[ret].ID


function SetWindowTextSize(ID,value)
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


Function SetWindowText(ID,textString as string)
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
		oldx=API.Gadget[ID].Positionx
		oldy=API.Gadget[ID].Positiony
		API.Gadget[ID].PositionX=x
		API.Gadget[ID].Positiony=y
		setspriteposition(API.Gadget[ID].SpriteID,x,y)
		neg=-1
		
		
		movex=oldx-x
		movey=oldy-y
		

	
			
		For c = 0 to API.Gadget[ID].Children.length
			child=getid(api.gadget[id].Children[c])
			cx=api.gadget[child].PositionX
			cy=api.gadget[child].PositionY
			

			api.gadget[child].PositionX=api.gadget[child].PositionX-movex
			api.gadget[child].Positiony=api.gadget[child].PositionY-movey
			SetSpritePosition(api.gadget[child].spriteid,api.gadget[child].PositionX,api.gadget[child].Positiony)
			`sub children
			
			
			
			For sub = 0 to API.Gadget[child].Children.length
				subchild=getid(api.gadget[child].Children[sub])
				subx=api.gadget[subchild].PositionX
				suby=api.gadget[subchild].PositionY
				
				api.gadget[subchild].PositionX=api.gadget[subchild].PositionX-movex
				api.gadget[subchild].Positiony=api.gadget[subchild].PositionY-movey
				SetSpritePosition(api.gadget[subchild].spriteid,api.gadget[subchild].PositionX,api.gadget[subchild].Positiony)
			next
			
			
		next
		
		
		
		
		
		
		
		
		
		endif
		
		

	
	
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


Function SetWindowSizeXY(ID,x,y)
	ID=getID(ID)`return array index
	if GetWindowExists(ID)=1
		API.Gadget[ID].height=y
		API.Gadget[ID].wIDth=x
		Drawgadget(2,ID)
	Endif
endfunction


function GetWindowExists(ID)`ID=array
	Local Ret as Integer
	if API.Gadget.length >= ID
		if API.Gadget[ID].kind=2 
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret

Function GetWindowSizeX(ID)
	Local Ret as Integer
	if API.Gadget.length >= ID
		ret=API.Gadget[ID].WIDth 
	Endif
endfunction


Function GetWindowSizeY(ID)
	Local Ret as Integer
	if API.Gadget.length >= ID
		ret=API.Gadget[ID].Height 
	Endif
endfunction

Function GetWindowX(ID)
	Local Ret as Integer
	if API.Gadget.length >= ID
		ret=API.Gadget[ID].positionX 
	Endif
endfunction


Function GetWindowY(ID)
	Local Ret as Integer
	if API.Gadget.length >= ID
		ret=API.Gadget[ID].PositionY 
	Endif
endfunction


function SetWindowRelative(id,left_Top_Right_Bottom$,on_off,distanceToTarget,targetID_zeroForWindow,insideOrOutide,resizeBool)//do not call this in a loop used for setup noly
	id=getid(id)
	if id >-1 and on_off >-1 and on_off < 2
		t$=left_Top_Right_Bottom$
		If lower(t$)="left"  
			API.gadget[id].Relative.l.bool=on_off
			api.gadget[id].Relative.l.distance=distanceToTarget
			api.gadget[id].relative.l.resize =resizeBool
		endif
		If lower(t$)="top" 
			API.gadget[id].Relative.T.bool=on_off
			api.gadget[id].Relative.t.distance=distanceToTarget
			api.gadget[id].relative.t.resize =resizeBool
		endif
		If lower(t$)="right" 
			API.gadget[id].Relative.R.Bool=on_off
			api.gadget[id].Relative.r.distance=distanceToTarget
			api.gadget[id].relative.r.resize =resizeBool
		endif
		If lower(t$)="bottom" 
			API.gadget[id].Relative.B.Bool=on_off
			api.gadget[id].Relative.b.distance=distanceToTarget
			api.gadget[id].relative.b.resize =resizeBool
		endif
		api.gadget[id].Relative.Target=targetID_zeroForWindow
		
	endif
endfunction



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