function MakeCheckbox()
	Local ret as integer
	ret=DrawGadget(3,-1)
endfunction API.Gadget[ret].ID

function SetCheckBoxState(ID,State)
		ID=getID(ID)
	if API.Gadget.Length >= ID
		API.Gadget[ID].state=State
		DrawGadget(3,ID)
	Endif
endfunction

function SetCheckBoxBorderWidth(ID,Width)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].BorderWidth=Width
		DrawGadget(3,ID)
	Endif
endfunction

function SetCheckBoxBorderColor(ID,Color)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].Bordercolor =color
		DrawGadget(3,ID)
	Endif
endfunction

function SetCheckBoxPaddingWidth(ID,Width)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].PadWidth=Width
		DrawGadget(3,ID)
	Endif
endfunction


function SetCheckBoxColor(ID,col)
	ID=getID(ID)`return array index
	if GetCheckBoxExists(ID)=1
		API.Gadget[ID].SpriteColor=col
	Endif
endfunction

Function SetCheckBoxPosition(ID,x,y)
	ID=getID(ID)`return array index
	if GetCheckBoxExists(ID)= 1
		API.Gadget[ID].PositionX =x
		API.Gadget[ID].PositionY =y
		SetSpriteposition(API.Gadget[ID].SpriteID,x,y)
	Endif
endfunction

Function SetCheckBoxWidth(ID,Width)
	ID=getID(ID)`return array index
	if GetCheckBoxExists(ID)= 1
		API.Gadget[ID].Width=Width
		DrawGadget(3,ID)
	Endif
endfunction

Function SetCheckBoxHeight(ID,Height)
	ID=getID(ID)`return array index
	if GetCheckBoxExists(ID)= 1
		API.Gadget[ID].Width=Height
		DrawGadget(3,ID)
	Endif
endfunction

Function SetCheckBoxSize(ID,x,y)
	ID=getID(ID)`return array index
	if GetCheckBoxExists(ID)= 1
		API.Gadget[ID].Width=x
		API.Gadget[ID].Height=y
		SetSpriteSize(API.Gadget[ID].SpriteID,x,y)
		DrawGadget(3,ID)
	Endif
endfunction

Function SetCheckBoxBgImage(ID,image)
	ID=getID(ID)`return array index
		if API.Gadget.Length >= ID
			API.Gadget[ID].BgImageID=Image
			DrawGadget(3,ID)
		Endif
endfunction

function getCheckBoxExists(ID)
	Local Ret as Integer
	if API.Gadget.Length >= ID
		if API.Gadget[ID].kind=3
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret

