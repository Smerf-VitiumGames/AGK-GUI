
function MakeDivider()
	Localret as integer
	ret=DrawGadget(1,-1)
endfunction API.Gadget[ret].ID


function SetDividerTextSize(ID,value)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].TextSize=value
	Endif
endfunction


function SetDividerResize(ID,Bool)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].ReSizeBool =0
	Endif	
endfunction


function SetDividerMove(ID,Bool)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].dragbool=0
	Endif	
endfunction


Function SetDividerText(ID,TextString as string)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].TextStr[0]=TextString
		DrawGadget(7,ID)
	Endif
endfunction


function SetDividerBgColor(ID,Col as integer)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].Bgcolor=col
		DrawGadget(7,ID)
	Endif
endfunction


function SetDividerBorderWidth(ID,Width)	
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].BorderWidth=Width
		DrawGadget(7,ID)
	Endif
endfunction


function SetDividerBorderColor(ID,Color)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].Bordercolor =color
		DrawGadget(7,ID)
	Endif
endfunction


function SetDividerPaddingWidth(ID,Width)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].PadWidth=Width
		DrawGadget(7,ID)
	Endif
endfunction


function SetDividerColor(ID,col)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].SpriteColor=col
	Endif
endfunction


Function SetDividerPosition(ID,x,y)
	ID=getID(ID)`return array index
	if API.gadget[id].Parent < 0
		if GetDividerExists(ID)=1
			API.Gadget[ID].PositionX =x
			API.Gadget[ID].PositionY =y
			SetSpriteposition(API.Gadget[ID].SpriteID,x,y)
		Endif
	Endif
	if API.Gadget[id].parent > -1
		parent= getid(API.gadget[id].parent)
		API.Gadget[ID].PositionX =API.Gadget[parent].PositionX+x
		API.Gadget[ID].PositionY =API.Gadget[parent].positiony+y
		SetSpriteposition(API.Gadget[ID].SpriteID,API.Gadget[ID].PositionX ,API.Gadget[ID].Positiony)
	Endif
endfunction


Function SetDividerWidth(ID,Width
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].Width=Width
		DrawGadget(7,ID)
	Endif
endfunction


Function SetDividerHeight(ID,Height)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].Width=Height
		DrawGadget(7,ID)
	Endif
endfunction


function setDividerTextColor(ID,col
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].Fontcolor=col
		DrawGadget(7,ID)
	Endif
endfunction


Function SetDividerSize(ID,x,y)
	ID=getID(ID)`return array index
	if GetDividerExists(ID)=1
		API.Gadget[ID].Width=x
		API.Gadget[ID].Height=y
		SetSpriteSize(API.Gadget[ID].SpriteID,x,y)
		DrawGadget(7,ID)
	Endif
endfunction


Function SetDividerBgImage(ID,Image)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID
		API.Gadget[ID].BgImageID=Image
		DrawGadget(7,ID)
	Endif
endfunction


Function SetDividerHighlight(ID,bool)
	ID=getID(ID)`return array index
		if API.Gadget.Length >= ID
			API.Gadget[ID].HighlightBool=bool
			DrawGadget(7,ID)
		Endif
endfunction


function getDividerExists(ID)
	Local ret as integer
	if API.Gadget.Length >= ID
		if API.Gadget[ID].kind=1
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret


Function GetDividerTextWidth(id)
	Local Ret as Integer
	id=getid(id)
	a=createtext("a")
	SetTextSize(a,API.Gadget[id].TextSize)
	w=GetTextTotalWidth(a)
	deletetext(a)
	ret= w *len(API.Gadget[id].textStr[0])
endfunction ret


Function GetDividerTextHeight(id)
	Local Ret as Integer
	id=getid(id)
	a=createtext("A")
	SetTextSize(a,API.Gadget[id].TextSize)
	h=GetTextTotalHeight(a)
	deletetext(a)
	ret= h
endfunction ret


