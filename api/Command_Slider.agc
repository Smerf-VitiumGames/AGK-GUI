function MakeSlider()
	Local Ret as Integer
	ret=DrawGadget(8,-1)
endfunction API.Gadget[ret].id


function SetSliderText(id,Title as string)
	id=getID(id)
	if API.gadget.length >= id
		API.Gadget[id].TextStr[0]=Title
		DrawGadget(8,id)
	Endif
endfunction


function SetSliderBorderColor(id,col)
	id=getID(id)`return array index
	if API.gadget.length >= id
		API.Gadget[id].Bordercolor=col
	Endif
endfunction


function SetSliderBorderWidth(id,width)
	id=getID(id)`return array index
	if API.gadget.length >= id
		API.Gadget[id].BorderWIDth=Width
		DrawGadget(8,id)
	Endif
endfunction


function setSliderTextSize(id,value)
	id=getID(id)
	if API.gadget.length >= id then API.Gadget[id].TextSize=value
endfunction


function SetSliderPosition(ID,x,y)
	id=getid(id)
	if API.gadget.length >= id
		API.Gadget[id].PositionX=x
		API.Gadget[id].Positiony=y
		SetSpritePosition(API.Gadget[id].SpriteID,x,y)
	Endif
endfunction

function GetSliderValue(ID)
	local ret as float
	id=getid(id)
	if API.gadget.length >= id
		ret=api.gadget[id].NowRange
	endif
endfunction ret


function SetSliderValue(ID,Value as float)
	id=getid(id)
	if API.gadget.length >= id
		api.gadget[id].NowRange=Value
		DrawGadget(8,id)
	endif
endfunction 

function SetSliderRange(ID,Low as float,High as float)
	id=getid(id)
	if API.gadget.length >= id
		api.gadget[id].rangeLow   =Low
		api.gadget[id].RangeHigh  =High
		DrawGadget(8,id)
	endif
endfunction 




function SetSliderSize(ID,Width,Height)
	id=getid(id)
	if API.gadget.length >= id
		API.Gadget[id].Width=Width
		API.Gadget[id].Height=Height
		DrawGadget(8,id)
	Endif
endfunction
