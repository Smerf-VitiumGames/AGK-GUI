// File: cmd_TextBox.agc
// Created: 22-06-19
function MakeTextBox()
	Local Ret as Integer
	ret=DrawGadget(5,-1)
endfunction API.Gadget[ret].id

function setTextBoxTextSize(id,value)
	id=getID(id)
	if API.Gadget.length >= id then API.Gadget[id].TextSize=value
endfunction

function SetTextBoxPosition(ID,x,y)
	id=getid(id)
	if API.Gadget[id].parent < 0
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


function SetTextBoxString(id, text as string)
	id=getid(id)
	if API.Gadget.length >= id and id <> -1
		API.Gadget[id].TextStr[0]=text
		DrawGadget(5,id)
	Endif
endfunction

function SetTextBoxSize(ID,Width,Height)
	id=getid(id)
	if API.Gadget.length >= id
		API.Gadget[id].Width=Width
		API.Gadget[id].Height=Height
		DrawGadget(5,id)
	Endif
endfunction


function SetTextBoxName(id,name as string)
	id=getid(id)
	if API.Gadget.length >= id
		API.Gadget[id].name=name
	endif
endfunction

function SetTextBoxTextBold(id,Bool)
	id=getid(id)
	if API.Gadget.length >= id
		API.Gadget[id].bold=Bool
		DrawGadget(5,id)
	Endif
endfunction