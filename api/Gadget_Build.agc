
Type GadgetType
	`self as integer[]
	ID as integer
	scrollID as integer
	ScrollID2 as integer
	ScrollBarH as integer[]
	ScrollBarV as integer[]
	LegacyID as integer
	`BranchID as integer
	Kind as integer
	Name as string
	SpriteID as integer
	SecondSpriteID as integer
	ImageID as integer
	SecondImageID as integer
	ImageName as string
	SecondImageName as string
	SpriteColor as integer
	Directory as string
	`Bg
	BgImageID as integer
	BgImageName as string
	`border
	BorderImageID as integer
	BorderImageName as string
	`Poperties
	rangeLow as integer
	RangeHigh as integer
	NowRange as integer
	State as integer
	editMode as integer
	ScrollHorBool as integer
	ScrollVertBool as integer
	MinSize as integer
	checkedBool as integer
	ColorRamp as integer
	Depth as integer
	PositionX as integer
	PositionY as integer
	PadWIDth as  integer
	Padcolor as integer
	BorderWIDth as integer
	Bordercolor as integer
	ScrollSlIDercolor as integer
	alpha as integer
	TextAlpha as integer
	BgAlpha as integer
	borderAlpha as integer
	PadAlpha as integer
	Bgcolor as integer
	Fontcolor as integer
	TextStr as string []
	IntStr as integer []
	Bold as integer 
	TextSize as integer
	Textfont as string
	Textx as integer
	TextY as integer
	TextLeft as integer
	`relations
	hasScrollbBar as integer
	Parent as integer
	Children as integer []
	`behavior
	AutoScroll as integer
	VerticalOffSet as integer`scroller
	HorizontalOffSet as integer`scroller
	ScrollBool as integer
	ActiveBool as integer
	ToolTip as string
	DragBool as integer
	ReSizeBool as integer
	MinimizeBool as integer
	MaximizeBool as integer
	CloseBool as integer
	TooltipBool as integer
	Custom1 as integer []
	Relative as relativeType
	BuiltInStrParam as String []
	BuiltInIntParam as integer []`For indevIDual custom params
	BuiltInStrParam2 as String []
	BuiltInIntParam2 as integer []
	BuiltInStrParam3 as String []
	BuiltInIntParam3 as integer [] `Image IDs IDeally
	FileSource as dirtype []
	Custom2 as String []
	WIDth as integer
	Height as integer
	BgImage as integer
	BorderImage as integer
	`Text as string
	TlCornerImage as integer
	TRCornerImage as integer
	BLCornerImage as integer
	BRCornerImage as integer
	HoverBool as integer
	HighlightBool as integer
	camIndex as integer
endtype

type RelativeType
	InsideOutside as Integer
	target as integer
	L as RelDirectionType
	T as RelDirectionType
	R as RelDirectionType
	B as RelDirectionType
endtype

type RelDirectionType
	Bool as integer	
	resize as integer `mode scale based on relation or move
	distance as integer `distance from edge
endtype

function AddGadget(Kind)`calls config.agc
		If kind=1 then BuildDefaultButton()
		If kind=2 then BuildDefaultWindow()
		If kind=3 then BuildDefaultCheckbox()
		If kind=4 then BuildDefaultScrollBar()
		If kind=5 then BuildDefaultTextBox()
		If kind=6 then BuildDefaultLabel()
		If kind=7 then BuildDefaultDivider()
		If kind=8 then BuildDefaultSlider()
		If kind=9 then BuildDefaultBrowser()
		If kind=10 then BuildDefaultScrollBar2()
		If kind=11 then BuildDefaultViewport()
endfunction


Function DrawGadget(kind,Remake)`remkake=array
	Local ID as Integer
	clearscreen()
	If remake >-1
		ID=remake
		If getSpriteexists(API.Gadget[ID].SpriteID) //If exists delete its Image
			SpriteID=API.Gadget[ID].SpriteID
			deleteImage(API.Gadget[ID].ImageID)
		Endif
	else 
		AddGadget(kind)//Buttonkind=1
		ID=API.Gadget.Length
	Endif
	
	depth=API.Gadget[ID].Depth
	pw=API.Gadget[ID].PadWIDth
	Bw=API.Gadget[ID].BorderWIDth
	SizeX=API.Gadget[ID].WIDth
	SizeY=API.Gadget[ID].Height
	BorderColor=API.Gadget[ID].Bordercolor
	Padcolor=API.Gadget[ID].Padcolor
	Spritealpha=API.Gadget[ID].BgAlpha
	BgColorR=GetColorRed(API.Gadget[ID].BgColor)
	BgColorG=GetColorGreen(API.Gadget[ID].BgColor)
	BgColorB=GetColorBlue(API.Gadget[ID].BgColor)
	`BgColorA=255`getcoloralpha(API.Gadget[ID].Bgcolor)
	BgColorA=GetColoralpha(API.Gadget[ID].BgColor)
	BgColor=makecolor(BgColorR,BgColorg,BgColorb,BgColora)
	`BgColor2=makecolor(255,255,255,255)`BgColorR-BgColorb/5,BgColorg-BgColorb/5,BgColorb-BgColorb/5,BgColora)
	
	col=Bordercolor
	col2=Padcolor
	

	If API.Gadget[ID].BgImageID >=0 //load Bg Image
		RenderViewPort(ID)
		BgSpriteID=createSprite(API.Gadget[ID].BgImageID)
	Endif
	
	If API.Gadget[ID].BgImageID < 0 //load Bg Image
		drawbox(0,0,SizeX-bw-pw,SizeY-bw-pw,Bgcolor,Bgcolor,Bgcolor,Bgcolor,1)//Bg
		update(0)
		DeleteBgImage=getImage(0,0,SizeX-bw-pw,SizeY-bw-pw+SlIDeroffSet)
		BgSpriteID=createSprite(DeleteBgImage)`do i need to delete? check back later 
	Endif




	
	
	SetSpriteSize(BgSpriteID,SizeX-(bw+bw)-(pw+pw),SizeY-(bw+bw)-(pw+pw))
	
	if api.gadget[id].kind=8 
		SetSpriteSize(BgSpriteID, SizeX-(bw+bw)-(pw+pw),SizeY/2)
		
		 Slideroffset= round((api.gadget[id].Height/4))
	endif
	
	SetSpriteposition(BgSpriteID,pw+bw,bw+pw+slideroffset)
	SetSpriteTransparency(BgSpriteID,1)
	SetSpriteColorAlpha(BgSpriteID,bgcolora)

	drawSprite(BgSpriteID)
	deleteSprite(BgSpriteID)
	If GetImageExists(DeleteBgImage)=1 then DeleteImage(DeleteBgImage)
	buildSlider(ID)
	update(0)

	DrawGadgetText(ID)

			
	If  API.Gadget[ID].reSizeBool=1//cornerDrags
		`Drawbox(0,0,6,bw-1,Bordercolor,			Bordercolor,Bordercolor,Bordercolor,1)//topborder
		`Drawbox(0,0,bw,6,Bordercolor,				Bordercolor,Bordercolor,Bordercolor,1)//leftborder
		`Drawbox(SizeX-6,0,SizeX,bw-1,				Bordercolor,Bordercolor,Bordercolor,Bordercolor,1)//topborder
		`Drawbox(SizeX-bw,0,SizeX,6,				Bordercolor,Bordercolor,Bordercolor,Bordercolor,1)//rightborder
		`Drawbox(0,SizeY-6,bw,SizeY,				Bordercolor,Bordercolor,Bordercolor,Bordercolor,1)//bottomborder
		`Drawbox(0,SizeY-bw+1,6,SizeY,				Bordercolor,Bordercolor,Bordercolor,Bordercolor,1)//leftborder
		`Drawbox(SizeX-bw,SizeY-6,SizeX,SizeY,		Bordercolor,Bordercolor,Bordercolor,Bordercolor,1)//bottomborder
		`Drawbox(SizeX-6,SizeY-bw+1,SizeX,SizeY,	Bordercolor,Bordercolor,Bordercolor,Bordercolor,1)//bottomborder
	Endif

	For Pad= 1 to pw
		DrawLine( Pad-1+bw,0,Pad-1+bw,SizeY,col2,col2)//leftPad
		Drawline(0,Pad-1+bw,SizeX,Pad-1+bw,col2,col2)//topPad
		Drawline(SizeX-Pad-bw,0,SizeX-Pad-bw,SizeY,col2,col2) //rightPad
		Drawline(0,SizeY-Pad-bw,SizeX,SizeY-Pad- bw,col2,col2) //BottomPad
	Next

	//leftBorderder
	For Border= 1 to bw
		drawline(Border-1,0,Border-1,SizeY,col,col)
		drawline(0,Border-1,SizeX,Border-1,col,col)
		drawline(SizeX-Border,0,SizeX-Border,SizeY,col,col)
		drawline(0,SizeY-Border,SizeX,SizeY-Border,col,col)
	Next
		
	IfScrollBarH(ID)
	IfScrollBarV(ID)
	`If API.Gadget[ID].BgImageID < 1
	`drawbox(bw+pw,bw+pw,SizeX-bw-pw,SizeY-bw-pw,Bgcolor,Bgcolor,Bgcolor,Bgcolor,1)//Bg
	`Endif
	`update(0)
	
	API.Gadget[ID].ImageID=getImage(0,0,SizeX,SizeY)
	ClearScreen()
	If SpriteID <=0
		SpriteID=CreateSprite(API.Gadget[ID].ImageID)
		SetSpriteDepth(SpriteID,100)
		API.Gadget[ID].SpriteID=SpriteID
	Endif
	SetSpriteImage(API.Gadget[ID].SpriteID,API.Gadget[ID].ImageID)
	SetSpriteSize(SpriteID,SizeX,SizeY+1)
	`SetSpriteTransparency(API.Gadget[ID].SpriteID,1)
	SetSpritePosition(API.Gadget[ID].SpriteID,API.Gadget[ID].PositionX,API.Gadget[ID].PositionY)

endfunction ID

 
 
function RenderViewPort(ID)
	If API.gadget[ID].kind=11

		//getwhere it was
		Local OX as Float
		Local OY as Float
		Local OZ as Float
		Local OAx as Float
		Local OAY as Float
		Local OAZ as Float
		OX=getcameraworldx(1)
		OY=getcameraworldy(1)
		OZ=getcameraworldz(1)
		OAx=GetCameraAngleX(1)
		Oay=GetCameraAngleY(1)
		OAZ=GetCameraAnglez(1)
		If GetImageExists(API.Gadget[ID].BgImageID) > 0
			deleteimage(API.Gadget[ID].BgImageID)
		Endif
		
		renderer=CreateRenderImage (API.Gadget[ID].wIDth,API.Gadget[ID].Height,0,0)
		Setcameraposition(1,api.cam[API.Gadget[ID].camIndex].PosX,api.cam[API.Gadget[ID].camIndex].PosY,api.cam[API.Gadget[ID].camIndex].PosZ)
		SetCameraRotation(1,api.cam[API.Gadget[ID].camIndex].RotX, api.cam[API.Gadget[ID].camIndex].RotY, api.cam[API.Gadget[ID].camIndex].RotZ)
		SetRenderToImage(renderer,0)
		API.Gadget[ID].BgImageID=renderer
		clearscreen()
		`For ca = 1 to 30
			`If getobjectexists(ca)
				`drawobject(ca)
			`Endif
		`Next
		render3d()
		Setcameraposition(1,OX,OY,OZ)
		SetCameraRotation(1,OAX,OAY,OAZ)	
		SetRenderToScreen()
	Endif
endfunction
 
 
 
 function DrawGadgetText(ID)
 	If API.Gadget[ID].kind=5
 		`dIff build Settings
 	Endif
 	
 	If API.Gadget[ID].Textstr.Length > -1
	 	For i = 0 to API.Gadget[ID].Textstr.Length
		 	TempText=createText(API.Gadget[ID].Textstr[i])
		 	`SetTextTransparency(TempText,2 ) 
		 	`SetTextFont(TempText,API.Gadget[ID].Textfont)
			SetTextSize(TempText,API.Gadget[ID].TextSize)
			r=getColorred(API.Gadget[ID].fontcolor)
			g=getColorgreen(API.Gadget[ID].fontcolor)
			b=getColorblue(API.Gadget[ID].fontcolor)
			a=getColoralpha(API.Gadget[ID].fontcolor)
			SetTextColor(TempText,r,g,b,a)//add rgb back in
			If API.Gadget[ID].bold=1 then SetTextBold(TempText,1)
			//check alignment
			x=0`centerText("x" ,ID,0)
			y=0`centerText("y" ,ID,0)
			`If API.gadget[ID].kind=9 then X=0 and y=0
			`If API.Gadget[ID].TextLeft=1 //add set text l t r b to all gadget
				`x=API.Gadget[ID].PadWIDth+API.Gadget[ID].BorderWIDth
			`Endif
			
			BlinkCursor()
			`API.Gadget[ID].Textx=x +2
			
			SetTextposition(TempText,x+2,i*GetTextSize(temptext))
			drawText(TempText)
			deleteText(TempText)
		Next
		update(3)
	Endif
 endfunction

 function IfScrollBarH(ID)
 	col=API.Gadget[ID].ScrollSlIDercolor
	If API.Gadget[ID].kind=4
		parent=getID(API.Gadget[ID].parent)
		If parent >-1
			xpos=API.Gadget[parent].ScrollBarH[3]
			Size=API.Gadget[parent].ScrollBarH[2]
			If GetSpriteExists(API.Gadget[ID].SpriteID)=1
				Pad=API.Gadget[ID].PadWIDth+API.Gadget[ID].BorderWIDth
				Height=getSpriteHeight(API.Gadget[ID].SpriteID)
				`drawbox(xpos,Pad,xpos+Size,Height-Pad,col,col,col,col,1)
				createSprite(1,API.gui.slIDebar)
				`SetSpriteimage(1,API.gui.Button )
				SetSpritesize(1,size,height-pad-pad)
				SetSpriteposition(1,xpos,pad)
				SetSpriteTransparency(1,1)
				DrawSprite(1)
				deleteSprite(1)
			Endif
		Endif
	Endif
 endfunction
 
 function IfScrollBarV(ID)
 	col=API.Gadget[ID].ScrollSlIDercolor
	If API.Gadget[ID].kind=10
		parent=getID(API.Gadget[ID].parent)
		If parent >-1
			Ypos=API.Gadget[parent].ScrollBarV[3]
			Size=API.Gadget[parent].ScrollBarV[2]
			If GetSpriteExists(API.Gadget[ID].SpriteID)=1
				Pad=API.Gadget[ID].PadWIDth+API.Gadget[ID].BorderWIDth
				WIDth=getSpriteWIDth(API.Gadget[ID].SpriteID)
				drawbox(Pad,ypos,WIDth-Pad,Ypos+Size,col,col,col,col,1)
			Endif
		Endif
	Endif
 endfunction

function centerText(xORy as string, ID,flag as integer)
	`flag For future multiple line selectino aka string num
	TextSize=API.Gadget[ID].TextSize
	strings$=API.Gadget[ID].TextStr[flag]
	delme=createText(Strings$)
	SetTextSize(delme,TextSize)
	SetTextDepth(delme,0)
	SetTextColor(delme,255,0,0,255)
	If lower(xory)="x"
		StrSize=GetTextTotalWIDth(delme)/2
		ObjectSize=API.Gadget[ID].WIDth
	Endif
	If lower(xory)="y"
		StrSize=GetTextTotalHeight(delme)/2
		ObjectSize=API.Gadget[ID].Height
	Endif
	deleteText(delme)
	x as integer
	x=((ObjectSize/2) - strSize)
endfunction x

function editBoxText()
endfunction


function BuildSlider(ID)
	local low as float
	local high as float
	local now as float
	local height2 as float
	local spritewidth# as float
	local bw as Integer 
	local pw as integer
	If API.Gadget[ID].kind=8
		low#=API.Gadget[ID].rangeLow
		High#=API.Gadget[ID].RangeHigh
		Now#=API.Gadget[ID].NowRange

		Height2=API.Gadget[ID].BuiltInIntParam[1]
		Height1=api.gadget[id].height
		range#=abs(high#-low#)
		SpriteWIDth#=API.Gadget[ID].WIDth
		percent#=(now#*SpriteWIDth#)/100
		Temp=createSprite(api.gadget[id].SecondImageID)
		pw=API.Gadget[ID].PadWIDth
		Bw=API.Gadget[ID].BorderWIDth

		SetSpriteSize(Temp,  height1-(bw+bw)-(pw+pw)/2  -  (height2/2),  (height1-(bw+bw)-(pw+pw)/2  -  (height2/2)    ))
		`even scaling enable
		size=GetSpriteHeight(temp)
		SetSpriteposition(Temp,percent#-GetSpriteWIDth(Temp)/2, (height1/2)+bw+pw -(size/2) )
		SetSpriteTransparency(Temp,1)
		drawSprite(Temp)
		deleteSprite(Temp)
	Endif
endfunction






