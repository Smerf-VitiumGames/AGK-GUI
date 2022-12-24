// File: cmd_Label.agc
// Created: 22-06-17


function MakeLabel(Title as string)
	Local Ret as Integer
	ret=DrawGadget(6,-1)
	SetLabelText(API.Gadget[ret].id,Title)
endfunction API.Gadget[ret].id

function SetLabelText(id,Title as string)
	id=getID(id)
	if API.Gadget.length >= id
		API.Gadget[id].TextStr[0]=Title
		DrawGadget(6,id)
	Endif
endfunction

function SetLabelTextLeft(id,bool)
	id=getid(id)
	if API.Gadget.length >= id
		API.Gadget[id].textLeft=bool
		DrawGadget(6,id)
	Endif
endfunction
function SetLabelBorderColor(id,col)
	id=getID(id)`return array index
	if API.Gadget.length >= id
		API.Gadget[id].Bordercolor=col
	Endif
endfunction


function SetLabelBorderWidth(id,width)
	id=getID(id)`return array index
	if API.Gadget.length >= id 
		API.Gadget[id].BorderWIDth=Width
	Endif
endfunction

function SetLabelTextSize(id,value)
	id=getID(id)
	if API.Gadget.length >= id then API.Gadget[id].TextSize=value
endfunction

function SetLabelPosition(ID,x,y)
	id=getid(id)
	if API.Gadget[id].parent <0
		if API.Gadget.length >= id
			API.Gadget[id].PositionX=x
			API.Gadget[id].Positiony=y
			SetSpritePosition(API.Gadget[id].SpriteID,x,y)
		Endif
	Endif
	
	if API.Gadget[id].parent > -1
		parent= getid(API.gadget[id].parent)
		API.Gadget[ID].PositionX =API.Gadget[parent].PositionX+x
		API.Gadget[ID].PositionY =API.Gadget[parent].positiony+y
		SetSpriteposition(API.Gadget[ID].SpriteID,API.Gadget[ID].PositionX ,API.Gadget[ID].Positiony)
	Endif
endfunction

function SetLabelSize(ID,Width,Height)
	id=getid(id)
	if API.Gadget.length >= id
		API.Gadget[id].Width=Width
		API.Gadget[id].Height=Height
		DrawGadget(6,id)
	Endif
endfunction

function SetLabelTextBold(id,Bool)
	id=getid(id)
	if API.Gadget.length >= id
		API.Gadget[id].bold=Bool
		DrawGadget(6,id)
	Endif
endfunction

Function GetLabelHeight(id)
	Local Ret as Integer
	id=getid(id)
	ret= API.Gadget[id].Height
endfunction ret
Function GetLabelWidth(id)
	Local Ret as Integer
	id=getid(id)
	ret= API.Gadget[id].Width
endfunction ret

Function GetLabelTextHeight(id)
	Local Ret as Integer
	id=getid(id)
	a=createtext("A")
	SetTextSize(a,API.Gadget[id].TextSize)
	h=GetTextTotalHeight(a)
	deletetext(a)
	ret= h
endfunction ret
Function GetLabelTextWidth(id)
	Local Ret as Integer
	id=getid(id)
	a=createtext("a")
	SetTextSize(a,API.Gadget[id].TextSize)
	w=GetTextTotalWidth(a)
	deletetext(a)
	ret= w *len(API.Gadget[id].textStr[0])
endfunction ret

function SetLabelBgColor(id,col)
	id=getID(id)`return array index
	`if GetLabelExists(id)=1
		API.Gadget[id].bgColor=col
		DrawGadget(6,id)`send arrayid to rebuild
	`Endif
endfunction


function SetLabelMove(ID,Bool)
	ID=getID(ID)`return array index
	if GetLabelExists(ID)=1
		API.Gadget[ID].dragbool=0
	Endif	
endfunction


function getLabelExists(ID)
	if API.Gadget.Length >= ID
		if API.Gadget[ID].kind=6
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret



