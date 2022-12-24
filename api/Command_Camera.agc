

//CAMERA
function MakeCamera(ID,Title as string)
	Local Ret as Integer
	if CheckForValidCamera(ID)=-1 then exitfunction -1
	if api.cam[id].GadgetID > 0
		 Exception("Camera"+str(ID)+"Already Exists")
		 exitfunction -1
	endif
	ret=DrawGadget(11,-1)
	api.cam[ID].GadgetID=ret
	api.gadget[ret].camIndex=ID
	API.gadget[ret].BgImageID= CreateRenderImage(100,100,0,1)
	SetLabelText(API.Gadget[ret].ID,Title)
	DrawGadget(11,ret)
endfunction API.Gadget[ret].ID


function SetCameraRotationX(ID,RotX as float) 
	if CheckForValidCamera(ID)=-1 then exitfunction
	api.cam[ID].RotX=RotX
endfunction


function SetCameraRotationY(ID,RotY as float) 	
	if CheckForValidCamera(ID)=-1 then exitfunction
	api.cam[ID].RotY=RotY
endfunction


function SetCameraRotationZ(ID,RotZ as float) 	
	if CheckForValidCamera(ID)=-1 then exitfunction
	api.cam[ID].RotZ=RotZ
endfunction


function GetCameraRotationX(ID)
	local ret as float
	if CheckForValidCamera(ID)=-1 then exitfunction-1
	ret=api.cam[id].RotX
endfunction ret


function GetCameraRotationY(ID)
	local ret as float
	if CheckForValidCamera(ID)=-1 then exitfunction -1
	ret=api.cam[id].RotY
endfunction ret


function GetCameraRotationZ(ID)
	local ret as float
	if CheckForValidCamera(ID)=-1 then exitfunction-1
	ret=api.cam[id].RotZ
endfunction ret

function GetViewportCamera(ID)
		local ret as integer
		if CheckForValidCamera(ID)=-1 then exitfunction -1
		ret=Api.gadget[GetID(id)].camIndex
endfunction ret

Function GetCameraViewport(id)
	local ret as integer
	if CheckForValidCamera(ID)=-1 then exitfunction -1
	ret=Api.Cam[ID].GadgetID
endfunction ret

function UpdateCameraView(ID)
	ID=api.cam[id].GadgetID
	if GetViewportExists(ID)=1
		DrawGadget(11,ID)
	Endif
endfunction

function CheckForValidCamera(ID)
	local ret as integer
	ret=1
	 if id < 0 or ID >3
		 Exception("Invalid Range, expected 1-4")
		ret= -1
	endif
	if ret=1
	if API.cam[ID].GadgetID < 0
		exception("Camera "+str(ID)+"Does not exist")	
		ret= -1
	endif
	endif
endfunction ret


function SetCameraViewPositionY(ID,PosY)
	ID=api.cam[id].GadgetID
	if GetViewportExists(ID)=1
		api.Gadget[Api.cam[ID].GadgetID].PositionY=Posy
	Endif
endfunction


function SetCameraViewPositionX(ID,PosX)
	ID=getID(ID)
	if GetViewportExists(ID)=1
		api.Gadget[Api.cam[ID].GadgetID].PositionX=PosX
	Endif
endfunction


function SetViewportTextSize(ID,value)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].TextSize=value
	Endif
endfunction


Function SetViewportText(ID,textString as string)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].TextStr[0]=TextString
	Endif
endfunction


Function SetViewportPositionXY(ID,x,y)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].PositionX =x
		API.Gadget[ID].PositionY =y
		setSpriteposition(API.Gadget[ID].SpriteID,x,y)
	Endif
endfunction


Function SetViewportWidth(ID,Width)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].Width=Width
		Drawgadget(11,ID)`send arrayID to rebuild
	Endif
endfunction


Function SetViewportHeight(ID,Height)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].height=Height
		Drawgadget(11,ID)
	Endif
endfunction

function SetViewPortBorderWidth(ID,Width)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].BorderWidth=Width
		DrawGadget(11,ID)
	Endif
endfunction

function SetViewPortBorderColor(ID,Color)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].Bordercolor =color
		DrawGadget(11,ID)
	Endif
endfunction

function SetViewPortPaddingWidth(ID,Width)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].PadWidth=Width
		DrawGadget(11,ID)
	Endif
endfunction

function SetViewPortPaddingColor(ID,Color)
	ID=getID(ID)`return array index
	if GetViewportExists(ID)=1
		API.Gadget[ID].PadColor =color
		DrawGadget(11,ID)
	Endif
endfunction


function getViewPortExists(ID)`ID=array
	id=api.cam[id].GadgetID
	if API.Gadget.length >= ID
		if API.Gadget[ID].kind=11
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret

