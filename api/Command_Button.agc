
function GetButtonPress()
	if Api.ButtonPressed >-1 and Api.ButtonPressed <= api.gadget.length
		ret=api.gadget[Api.ButtonPressed].id
	endif
endfunction ret


function MakeButton()
	Local ret as integer
	ret=DrawGadget(1,-1)
endfunction API.Gadget[ret].ID

function SetButtonTextSize(ID,value)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)=1
		API.Gadget[ID].TextSize=value
	Endif
endfunction

function SetButtonName(ID,name as string)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)=1
		API.Gadget[ID].Name=name
	Endif
endfunction



function SetButtonResize(ID,Bool)	
	ID=getID(ID)`return array index
	if GetButtonExists(ID)= 1
		API.Gadget[ID].ReSizeBool =0
	Endif	
endfunction

function SetButtonMove(ID,Bool)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)=1
		API.Gadget[ID].dragbool=0
	Endif	
endfunction

Function SetButtonText(ID,TextString as string)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)=1
		API.Gadget[ID].TextStr[0]=TextString
		DrawGadget(1,ID)
	Endif
endfunction


function SetButtonBgColor(ID,Col as integer)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].Bgcolor=col
		DrawGadget(1,ID)
	Endif
endfunction


function SetButtonBorderWidth(ID,Width)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].BorderWidth=Width
		DrawGadget(1,ID)
	Endif
endfunction

function SetButtonBorderColor(ID,Color)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].Bordercolor =color
		DrawGadget(1,ID)
	Endif
endfunction

function SetButtonPaddingWidth(ID,Width)
	ID=getID(ID)`return array index
	if API.Gadget.Length >= ID 
		API.Gadget[ID].PadWidth=Width
		DrawGadget(1,ID)
	Endif
endfunction

function SetButtonColor(ID,col)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)= 1
		API.Gadget[ID].SpriteColor=col
	Endif
endfunction

Function SetButtonPosition(ID,x,y)	
	ID=getID(ID)`return array index
	if API.gadget[id].Parent < 0
		if GetButtonExists(ID)= 1
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

Function SetButtonWidth(ID,Width)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)= 1
		API.Gadget[ID].Width=Width
		DrawGadget(1,ID)
	Endif
endfunction

Function SetButtonHeight(ID,Height)
	ID=getID(ID)`return array index
	if GetButtonExists(ID)= 1
		API.Gadget[ID].Width=Height
		DrawGadget(1,ID)
	Endif
endfunction

function setbuttonTextColor(ID,col)	
	ID=getID(ID)`return array index
	if GetButtonExists(ID)= 1
		API.Gadget[ID].Fontcolor=col
		DrawGadget(1,ID)
	Endif
endfunction

Function SetButtonSize(ID,x,y)
	
	ID=getID(ID)`return array index
	if GetButtonExists(ID)= 1
		API.Gadget[ID].Width= x
		API.Gadget[ID].Height= y
		SetSpriteSize(API.Gadget[ID].SpriteID,x,y)
		DrawGadget(1,ID)
	Endif
endfunction

Function SetButtonBgImage(ID,Image)
	ID=getID(ID)`return array index
		if API.Gadget.Length >= ID
			API.Gadget[ID].BgImageID= Image
			DrawGadget(1,ID)
		Endif
endfunction

Function SetButtonHighlight(ID,bool)
	
	ID=getID(ID)`return array index
		if API.Gadget.Length >= ID
			API.Gadget[ID].HighlightBool=bool
			DrawGadget(1,ID)
		Endif
endfunction


function getButtonExists(ID)
	if API.Gadget.Length >= ID
		if API.Gadget[ID].kind= 1
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret


Function GetButtonTextWidth(id)
	Local Ret as Integer
	id=getid(id)
	a=createtext("a")
	SetTextSize(a,API.Gadget[id].TextSize)
	w=GetTextTotalWidth(a)
	deletetext(a)
	ret= w *len(API.Gadget[id].textStr[0])
endfunction ret

Function GetButtonTextHeight(id)	
	Local Ret as Integer
	id=getid(id)
	a=createtext("A")
	SetTextSize(a,API.Gadget[id].TextSize)
	h=GetTextTotalHeight(a)
	deletetext(a)
	ret= h
endfunction ret
