// File: toolbar.agc
// Created: 20-02-10
function MakeToolBar()
gosub LoadVariables
endfunction
LoadVariables:
Type MainParentType
	x_offSet as integer
	localoffSet as integer
	parent_string as string
	Parent_Width as string 
	parent_Height as string 
	OffSet as integer
	Child as MainParentChild[15]
	SpriteID as integer
	ImageID as integer
	Hover as integer
	ChildSpriteID as integer
	ChildimageID as integer
	entrys as integer
endtype
	global Main as mainparenttype [ParentNums]
	
Type MainParentChild
	Data as string
	Action as string
endtype



BuilddropdownHighlighter()
BuildDropDownMenu() 
return
remstart
function resolution()
	screen_Height=GetWindowHeight()
	screen_Width=GetWindowWidth()
	if screen_Height <>oldHeight or screen_Width<>oldWidth
		oldHeight=screen_Height=GetWindowHeight()
		oldWidth=screen_Width=GetWindowWidth()
		SetVirtualResolution(screen_Width,screen_Height)
		DrawToolbarBackground()
	Endif
endfunction
remend



function BuildDropDownMenu()
	#constant parentnums=7
API.MainMenu.oldHeight=API.WinHeight
API.MainMenu.oldWidth=API.WinWidth
API.MainMenu.FontSize=18
API.MainMenu.Size=1
main[1].x_offSet=10

main[1].parent_string="File"
main[2].parent_string="Play/Test"
main[3].parent_string="Export"
main[4].parent_string="Options"
main[5].parent_string="Entities"
main[6].parent_string="ToolBars"
main[7].parent_string="Help"


main[1].Child[1].Data="Open"
main[1].Child[2].Data="Import"
main[1].Child[3].Data="New"
main[1].Child[4].Data="Save as"
main[1].Child[5].Data="Exit"

main[2].Child[1].Data="Edit Mode"
main[2].Child[2].Data="Test Mode"

main[3].Child[1].Data="To Json"
main[3].Child[2].Data="To Agk Code"
main[3].Child[3].Data="Reference Links"

main[4].Child[1].Data="Ancient"
main[4].Child[2].Data="Basic"
main[4].Child[3].Data="Bubbles"
main[4].Child[5].Data="Curves"
main[4].Child[4].Data="SciFy 1"
main[4].Child[5].Data="SciFy 2"

main[5].Child[1].Data="Demon Blood"
main[5].Child[2].Data="Dracula"
main[5].Child[3].Data="Earth"
main[5].Child[4].Data="Evening"
main[5].Child[5].Data="Forest"
main[5].Child[6].Data="Powerfuff"
main[5].Child[7].Data="Pro Light"
main[5].Child[8].Data="Pro Dark"
main[5].Child[9].Data="Pro Blue"
main[5].Child[10].Data="Tech Gray"
main[5].Child[11].Data="Tech Green"
main[5].Child[12].Data="TRON"
main[5].Child[13].Data="Sky"

main[6].Child[1].Data="Lights"
main[6].Child[2].Data="Objects"
main[6].Child[3].Data="Steam API"


main[7].Child[1].Data="About"
main[7].Child[2].Data="Commands"
main[7].Child[3].Data="Contact"
main[7].Child[4].Data="User GuIDe"

Text=toolbar_parents()
DrawToolbarBackground()
buildChildren(Text)

//fill children entrys
For i = 1 to parentnums
	For b= 1 to 10
		if len(main[i].child[b].data)>=1
			main[i].entrys=main[i].entrys+1
		Endif
	next
next
endfunction
	
function DrawToolbarBackground()
	clearscreen()
	Size=26
	drawbox(0,0,API.WinWidth-1,Size+1,API.Color.black,API.Color.black,API.Color.black,API.Color.black,1)
	drawbox(0+1,0+1,API.WinWidth-2,Size/2,API.Color.darkGray,API.Color.darkGray,API.Color.Gray,API.Color.Gray,1)//splitbox top
	drawbox(0+1,(Size/2)+1,API.winWidth-2,Size,API.Color.Gray,API.Color.Gray,API.Color.darkGray,API.Color.darkGray,1)//splitbox top
	`render()
	if backgroundSID>0
		deleteSprite(BackgroundSID)
		deleteimage(BackgroundIID)
	Endif
	image=GetImage(0,0,API.WinWidth-1,28):BackgroundIID=image
	Sprite=createSprite(image):backgroundSID=Sprite
	SetSpritedepth(Sprite,10)
endfunction	
	
	
function toolbar_parents()
Local Text as Integer
`SetClearcolor(145,145,145)
Text=createText("")
SetTextvisible(Text,0)
SetTextSize(Text,API.MainMenu.FontSize)
SetTextstring(Text,"a")
API.MainMenu.TextHeight=getTexttotalHeight(Text)
API.MainMenu.TextWidth=getTexttotalWidth(Text)
SetTextstring(Text,"")
clearscreen()
	#constant ToolBarBackgroundID=GetImage(0,0,MaxWidth,42)
	#constant ToolBarSpriteID=createSprite(ToolBarBackgroundID)
	
	For i = 1 to ParentNums
		if len(main[i].parent_string)> 0
		SetTextvisible(Text,1)
		SetTextstring(Text,main[i].parent_string)
		Width=GetTextTotalWidth(Text)+20
		API.MainMenu.Size=26//even number only
		drawbox(0,2,Width,API.MainMenu.Size/2,API.Color.darkgray ,API.Color.darkGray,API.Color.Gray,API.Color.Gray,1)//splitbox top
		drawbox(0,(API.MainMenu.Size/2)+1,Width,API.MainMenu.Size-1,API.Color.Gray,API.Color.Gray,API.Color.darkGray,API.Color.darkGray,1)//splitbox top
		SetTextposition(Text,10,API.MainMenu.Size/2-API.MainMenu.FontSize/2)
		render()
		drawText(Text)
		SetTextstring(Text,"")
		SetTextvisible(Text,0)
		image=getimage(0,0,Width,API.MainMenu.Size)
		Sprite=createSprite(image)
		main[i].SpriteID=Sprite
		main[i].ImageID=image
		SetSpritedepth(Sprite,2)
		xoffSet=main[1].x_offSet
		SetSpriteposition(Sprite,xoffSet,0)
		main[i].localoffSet=xoffSet
		main[1].x_offSet=main[1].x_offSet+Width+10
		clearscreen()
		Endif
	next
endfunction Text


function buildChildren(Text)
	Local Parent as integer
	Local I as integer
	Local Child as integer =0
	Local Paddin as integer
	Local Rows as integer
	For parent=1 to ParentNums	
		For i=1 to 10 //get data of children determin longest Length
			if len(main[Parent].child[i].data)>=1
				inc child,1
			Endif
			SetTextstring(Text,main[Parent].child[i].Data)
			Length1=GetTextTotalWidth(Text)
			if Length < Length1
				Length= Length1
			Endif
			SetTextstring(Text,"")
		next
		Padding=8
		rows=child*API.MainMenu.TextHeight
		drawbox(0,0,Length+60,rows+1,API.Color.black,API.Color.black,API.Color.black,API.Color.black,1)
		drawbox(0+1,0+1,Length+60-1,rows,API.Color.darkGray,API.Color.darkGray,API.Color.Gray,API.Color.Gray,1)//splitbox top
		drawline(20,3,20,rows-2,128,128,128)
		drawline(21,3,21,rows-2,140,140,140)
		For i= 1 to child
			drawline(23,((i-1)*API.MainMenu.TextHeight)+Padding-(API.MainMenu.TextHeight/2),Length+50,((i-1)*API.MainMenu.TextHeight)+Padding-(API.MainMenu.TextHeight/2),110,110,110)
		next
		render()
		SetTextvisible(Text,1)
		For i= 1 to child
			SetTextPosition(Text,25,((i-1)*API.MainMenu.TextHeight)+Padding-(API.MainMenu.TextHeight/2) )
			SetTextstring(Text,main[Parent].child[i].Data)
			DrawText(Text)
		next
		child=0	
	SetTextvisible(Text,0)
	image=getimage(0,0,Length+60,rows+2)
	main[Parent].ChildImageID=image
	clearscreen()
	next
endfunction

Function RunMenu()
	resolution(0)
	HitID=getSpritehit(getrawMousex(),getrawMousey())
	For i = 1 to Parentnums //get the number For array not ID
		if main[i].SpriteID=HitID
			Highlightparent(i,HitID)
		Endif
		if main[i].SpriteID<>HitID 
			UnHighlightParent(i,HitID)
		Endif
	next
	MouseClick()
	DeleteChild()
	RunChildren()
	SelectSubroutine()
Endfunction
	
function MouseClick()
	if API.MainMenu.Clicked=0 
		if GetRawMouseLeftPressed()=1
			For i = 1 to ParentNums
				if main[i].hover=1 
					CreateChild(i)
					API.MainMenu.Clicked=1
				Endif
			next
		Endif
	Endif
	if API.MainMenu.Clicked=1 and GetRawMouseLeftPressed()=0
		API.MainMenu.Clicked=0
	Endif		
endfunction 
	
function highlightparent(parent,HitID)
	
		if  main[parent].Hover=0
			parentID=main[parent].SpriteID
			if parentid>0
			SetSpritecolor(ParentID,355,355,355,355)
			main[parent].Hover=1
			Endif
		Endif
endfunction

function UnhighlightParent(i,HitID)
	if main[i].hover=1 and main[i].SpriteID<>HitID
		if HitID<>main[i].SpriteID
			main[i].hover=0
			SetSpritecolor(main[i].SpriteID,255,255,255,255)
		Endif
	Endif
endfunction
	
Function createChild(i)
		if main[i].ChildSpriteID=0
			Sprite=CreateSprite(main[i].ChildimageID)
			SetSpritedepth(Sprite,0)
			SetSpriteposition(Sprite,main[i].localoffSet,27)
			main[i].ChildSpriteID=Sprite
			API.MainMenu.ActiveChild=i
		Endif
endfunction
	
function DeleteChild()
	For b = 1 to parentnums
	Target=getSpritehit(getrawMousex(),getrawMousey())
		if main[b].SpriteID<>Target and main[b].ChildSpriteID<>Target and Target<>API.MainMenu.HighlighterSID
			if GetSpriteExists(main[b].ChildSpriteID)=1
				DeleteSprite(main[b].ChildSpriteID)
				main[b].ChildSpriteID=0
				deleteSprite(API.MainMenu.HighlighterSID)
				API.MainMenu.HighlighterSID=0
				API.MainMenu.ActiveChild=0
			Endif
		Endif 
	next
Endfunction

function RunChildren()
	if API.MainMenu.ActiveChild>0
		If API.MainMenu.HighlighterSID <1
			Sprite=createSprite(API.MainMenu.HighlighterIID) //keep from looping
			SetSpriteDepth(Sprite,0)
			API.MainMenu.HighlighterSID=Sprite
		Endif
		if getSpriteexists(main[API.MainMenu.ActiveChild].ChildSpriteID)>0
			x=getSpritex(main[API.MainMenu.ActiveChild].ChildSpriteID)
			y=getSpritey(main[API.MainMenu.ActiveChild].ChildSpriteID)
			Mousey=ceil(getrawMousey())
			API.MainMenu.Size= (Mousey-y+API.MainMenu.TextHeight)/API.MainMenu.TextHeight
			if API.MainMenu.Size> main[API.MainMenu.ActiveChild].entrys
				API.MainMenu.Size=main[API.MainMenu.ActiveChild].entrys
			Endif
			if API.MainMenu.Size<1
				SetSpritevisible(API.MainMenu.HighlighterSID,0)
			Endif
			if API.MainMenu.Size>0
				SetSpritevisible(API.MainMenu.HighlighterSID,1)
			Endif
			boarderoffSet=22
			SetSpritePosition(API.MainMenu.HighlighterSID,main[API.MainMenu.ActiveChild].localoffSet+boarderoffSet+2,API.MainMenu.Size*API.MainMenu.TextHeight+10)
			Text=createText(main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data)
			SetTextSize(Text,API.MainMenu.FontSize)
			Width=getTexttotalWidth(Text)+4
			deleteText(Text)
			SetSpriteSize(API.MainMenu.HighlighterSID,Width,API.MainMenu.TextHeight-3)
		Endif
	Endif
endfunction
	
		
		
function BuildDropDownHighlighter()
	blah$="label1"
	clearscreen()
	gray=makecolor(200,200,200,128)
	drawbox(0,0,1,1,gray,gray,gray,gray,1)
	render()
	API.MainMenu.HighlighterIID=getimage(0,0,1,1)
endfunction


//below are examples For launching functions whith a Click
function SelectSubroutine()
	if API.MainMenu.ActiveChild>0 and API.MainMenu.Clicked=0
		if getrawMouseleftpressed()=1  and len(main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data)>1
			
			if main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data="Open"
				File()
			Endif
			
			selection$  =main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data 
			
			if selection$="SciFy 1" then end
			if main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data="Open Recent"
				File()
			Endif
			if main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data="New"
				`New()
			Endif
			if main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data="Save"
				`File()
			Endif
			if main[API.MainMenu.ActiveChild].child[API.MainMenu.Size].Data="Exit"
				`File()
			Endif
			//cleanup
			For b= 1 to parentnums
				`if GetSpriteExists(main[b].ChildSpriteID)=1
					`DeleteSprite(main[b].ChildSpriteID)
					`main[b].ChildSpriteID=0
					`deleteSprite(API.MainMenu.HighlighterSID)
					`API.MainMenu.HighlighterSID=0
					`API.MainMenu.ActiveChild=0
				`Endif
			next
		Endif
	Endif
	
	
endfunction
//////////////////////////FUNCTION EXAMPLE
function File()
	file$=ChooseRawFile("*.lls" )
endfunction


	


	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	