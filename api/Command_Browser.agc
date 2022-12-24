// File: cmd_fileBrowser.agc
// Created: 22-07-08


`populate with findFiles (ID)
`else populate with SetbrowserImageSource(ID,array)
`BuiltInstrParam2[2=string source,  BuiltInstrParam2[3]=dir source

function MakeBrowser()Local Ret as Integer
		ret=DrawGadget(9,-1)
		API.Active=ret`to refresh might rethink refresh method later could interfere with a current selected item maybe run clip function
endfunction API.Gadget[ret].ID


function GetBrowserString(BrowseID)` will return the Image or model filename
	Local IDT as integer
	IDT=getID(BrowseID)
	ButtonID=-1`getID(GetButtonClicked())
	if ButtonID > -1
		if API.Gadget[ButtonID].BuiltInStrParam.Length >-1
			if API.Gadget[ButtonID].Parent=BrowseID then ret$=API.Gadget[ButtonID].BuiltInStrParam[0]
		Endif
	Endif
endfunction ret$


function SetBrowserTextSource(ID,Text_Array as integer[])
	Local IDT as integer
	IDT=getID(ID)
	if getBrowserExists(IDt)=1
		`add stuff here :P
	Endif 
		UpdateBrowser(ID)
endfunction


function SetBrowserSize(ID,wIDth,Height)
	Local IDT as integer
	IDt=ID
	ID=getID(ID)
	API.Gadget[ID].wIDth=wIDth
	API.Gadget[ID].height=height
	DrawGadget(9,ID)
endfunction


function SetBrowserImageSource(ID,Image_Array as integer[])
	Local IDT as integer
	IDt=getID(ID)
	if getBrowserExists(IDt)=1
		if Image_Array.Length >-1
			API.Gadget[IDt].BuiltInIntParam2=Image_Array
			API.Gadget[IDt].BuiltInStrParam3.Length=-1
		Endif
	Endif
	UpdateBrowser(ID)
endfunction
 
 
Function SetBrowserTiles(ID,Number)`stagger method
endfunction


function SetBrowserBgColor(ID,Color)
	ID=getID(ID)
	if getBrowserExists(ID)=1
		API.Gadget[ID].ImageID=-1
		API.Gadget[ID].Bgcolor=color
	Endif
endfunction


function SetBrowsertextColor(ID,color)
	ID=getID(ID)
	if getBrowserExists(ID)=1
		API.Gadget[ID].fontcolor=color
	Endif
endfunction


function SetBrowserPosition(ID,x,y)
	local xx as integer
	local yy as integer
	ID=getID(ID)
	API.active=ID
	xx=API.gadget[ID].positionx*-1
	yy=API.gadget[ID].positiony*-1
	dragbody(1,xx,yy)
	API.Dragbody=0
	API.Mouse.Drag=0
	API.DragEdge=0
	dragbody(1,x,y)
	API.Dragbody=0
	API.Mouse.Drag=0
	API.DragEdge=0
endfunction


function SetBrowserModeText(ID)
	ID=getID(ID)
	if  getBrowserExists(ID)=1
		API.Gadget[ID].BuiltInIntParam[0]=0
	Endif
	`UpdateBrowser(ID)
endfunction


function SetBrowserModeIcon(ID)
	ID=getID(ID)
endfunction


function SetBrowserModePreview(ID)
	ID=getID(ID)
	if  getBrowserExists(ID)=1
	`build a demp and reSet here /update
		API.Gadget[ID].BuiltInIntParam[0]=1
	Endif
endfunction


Function UpdateBrowser(ID)`run after an array update
	Local Delete as Integer
	Local TempImage as Integer
	Local TempRealID as Integer
	Local TempButton as integer
	Local Alpha as Integer
	Local HScale as Integer
	Local VScale as Integer
	oldID=ID
	ID=getID(ID)
	if getBrowserExists(ID)=1` Length of styr datyaSet/array
		remstart
		`if icon mode
		if API.Gadget[ID].BuiltInIntParam[0]=1
			end
			For tile= 0 to  API.Gadget[ID].BuiltInStrParam2.Length
				TempText=MakeLabel( API.Gadget[ID].BuiltInStrParam2[tile] )
				SetLabelSize(TempText,GetLabelTextWIDth(TempText),GetLabelTextHeight(TempText))
				SetLabelborderWIDth(TempText,0)
				SetLabelBgColor(TempText,makecolor(155,155,155))
				API.Gadget[getID(TempText)].BgAlpha=220
				TempTextRealID=getID(TempText)
				`add relative here
				API.Gadget[TempTextRealID].PositionX= API.Gadget[ID].PositionX+ API.Gadget[ID].HorizontalOffSet
				API.Gadget[TempTextRealID].PositionY= API.Gadget[ID].Positiony+ (GetSpriteHeight(API.Gadget[TempTextRealID].SpriteID)*(tile)+(5*tile))     +    API.Gadget[ID].VerticalOffSet
				DrawGadget(9,TempTextRealID)
				SetSpriteposition(API.Gadget[TempTextrealID].SpriteID,API.Gadget[TempTextRealID].Positionx,API.Gadget[TempTextRealID].PositionY)
				addChild(TempText,oldID)
			next
		Endif
		`clip(0)
		remend
			
			`cleanup
			For delete= 0 to API.Gadget[ID].BuiltInIntParam2.Length
				if GetImageExists(API.Gadget[ID].BuiltInIntParam2[delete])
					deleteImage(API.Gadget[ID].BuiltInIntParam2[delete])
					API.Gadget[ID].BuiltInStrParam2.Length=-1
					API.Gadget[ID].BuiltInStrParam3.Length=-1
				Endif
			next
			
			For i=0 to API.gadget[ID].Children.length
				deleteGadget(getID(API.gadget[ID].Children[i]))
				API.gadget[ID].Children.length=-1
			next
			
		`""PREVIEW MODE with Text""  uiltInIntParam= mode 1=preview 0=Text 2=icon
		if API.Gadget[ID].BuiltInIntParam[0]=1  and API.Gadget[ID].BuiltInStrParam2.Length >-1
			For preview=0 to API.Gadget[ID].BuiltInStrParam2.Length
				TempImage=loadImage(API.Gadget[ID].BuiltInStrParam3[preview]+API.Gadget[ID].BuiltInStrParam2[preview])
				`create preview of the Image so they can be deleted when destroyed
				wScale=getImageWIDth(TempImage)
				hScale=GetImageHeight(TempImage)
				if not wscale  >= 100 :wscale=1:else: wScale=wscale/100:Endif
				if not hscale  >= 100 :hscale=1:else: hScale=hscale/100:Endif
					
				if wscale >0 or hscale >0`reSize to save memory
					ReSizeImage(TempImage,getImageWIDth(TempImage)/wScale,GetImageHeight(TempImage)/hScale)
				Endif
				`store Image to delete later delete if it has a state change
				API.Gadget[ID].BuiltInIntParam2.insert(TempImage)
				Temp=MakeButton():TempLabel=MakeLabel(API.Gadget[ID].BuiltInStrParam2[preview])`2=name 3=directory
				SetButtonBgImage(Temp,TempImage):SetLabelBorderWIDth(TempLabel,0):transparent=makecolor(255,255,255,10)
				SetButtonSize(Temp,40,40):SetLabelBgColor(TempLabel,transparent)
				setbuttontextcolor(Temp,API.color.red)
				SetButtonText(Temp,""):SetLabelSize(Templabel,GetLabelTextWIDth(Templabel),GetLabelTextHeight(Templabel)+6)
				SetButtonborderWIDth(Temp,2)
				TempRealID=getID(Temp)
				`label
				API.Gadget[getID(TempLabel)].PositionX= API.Gadget[ID].PositionX+ API.Gadget[ID].HorizontalOffSet
				API.Gadget[getID(TempLABEL)].PositionY= API.Gadget[ID].Positiony+((GetSpriteHeight(API.Gadget[TemprealID].SpriteID)+GetLabelTextHeight(Templabel)+20)*(preview))     + GetSpriteHeight(API.Gadget[TempRealID].SpriteID) +  API.Gadget[ID].VerticalOffSet
				SetSpriteposition(API.Gadget[getID(Templabel)].SpriteID,API.Gadget[getID(Templabel)].Positionx,API.Gadget[getID(Templabel)].PositionY)
				addChild(Templabel,oldID)
				`Button
				API.Gadget[TempRealID].BuiltInStrParam.Length=-1 `reSet to store new value
				API.Gadget[TempRealID].BuiltInStrParam.insert(API.Gadget[ID].BuiltInStrParam3[preview]+API.Gadget[ID].BuiltInStrParam2[preview])
				API.Gadget[TempRealID].PositionX= API.Gadget[ID].PositionX+ API.Gadget[ID].HorizontalOffSet
				API.Gadget[TempRealID].PositionY= API.Gadget[ID].Positiony+((GetSpriteHeight(API.Gadget[TempRealID].SpriteID)+GetLabelTextHeight(Templabel)+20)*(preview))     +    API.Gadget[ID].VerticalOffSet
				DrawGadget(9,TempRealID)
				SetSpriteposition(API.Gadget[TemprealID].SpriteID,API.Gadget[TempRealID].Positionx,API.Gadget[TempRealID].PositionY)
				addChild(Temp,oldID)
			next
			clip(0)
		Endif	
	Endif
	
	
	`Text
		if API.Gadget[ID].BuiltInIntParam[0]=0  and API.Gadget[ID].BuiltInStrParam2.Length >-1
			For preview=0 to API.Gadget[ID].BuiltInStrParam2.Length
				TempButton=MAKEButton()
				SetButtonText(TempButton,API.Gadget[ID].BuiltInStrParam2[preview] ) `2=name 3=directory
				SetButtonBgImage(TempButton,-1)
				alpha=makecolor(255,255,255,0)
				SetButtonBgColor(TempButton,alpha)
				SetButtonBorderWIDth(TempButton,0)
				SetButtonSize(TempButton,GetButtonTextWIDth(TempButton),GetButtonTextHeight(TempButton))
				setbuttontextcolor(TempButton,API.color.black)
				SetButtonMove(TempButton,0)
				SetButtonResize(TempButton,0)
				Button=getID(TempButton)
				API.Gadget[Button].PositionX= API.Gadget[Button].PositionX+ API.Gadget[Button].HorizontalOffSet+4
				API.Gadget[Button].PositionY= API.Gadget[Button].Positiony+((GetSpriteHeight(API.Gadget[Button].SpriteID)+4)*(preview)) ` +  API.Gadget[ID].VerticalOffSet
				DrawGadget(9,TempRealID)
				SetSpriteposition(API.Gadget[Button].SpriteID,API.Gadget[Button].Positionx,API.Gadget[Button].PositionY)
				addChild(TempButton,oldID)
			next
			clip(0)
		Endif	
endfunction



`important compare old to new  dont rebuild existing if doesnt exists run delete on existing Image or Text, and create new
`function SetBrowserRefresh(ID,1)
`endfunction

function getBrowserExists(ID)`ID=array
	Local Ret as integer
	if API.Gadget.Length >= ID and API.Gadget.Length > -1
		if API.Gadget[ID].kind=9
			ret=1
		else
			ret=0
		Endif
	Endif
endfunction ret

