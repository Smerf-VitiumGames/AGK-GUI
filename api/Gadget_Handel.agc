function runGadgets()
	If API.Active > -1 and API.Gadget.Length >-1
		`optomize
		if API.active >-1 
			parent=getid(API.gadget[API.active].parent)
			if parent  >-1
			  parent= API.gadget[parent].kind
			Endif
			`if  parent <> 9 `prevens browser from running alternat future solution  run drag check For parent coords if true and a 
				`child is active set parent to active because drag  is within its coords
			
			if api.DragEdge>0 
				 DrawGadget(1,API.active)
			Endif
		Endif
		if api.disable.DragEdge=0 	then DragEdge()
		if api.disable.DragBody=0 	then DragBody(0,0,0)
		if api.disable.DragDrop=0 	then DragOnDrop()
		if api.disable.Clipping=0 	then Clip(0)
		if api.disable.Relative=0 	then RelativePosition()
		RunTextBox()
	Endif
	

endfunction


function RelativePosition() // not set yet set to run on drag only
	for i = 0 to api.gadget.length
		screenwidth=0
		targetIDz=api.gadget[i].RelativeTarget
		x=api.gadget[i].PositionX
		y=api.gadget[i].PositionY
		width=api.gadget[i].width
		height=api.gadget[i].height
		if TargetIDz > 0
			TargetID=getid(targetidz) 
			if targetid <=api.gadget.length// has target
				targetx=Api.gadget[targetid].PositionX
				targety=Api.gadget[targetid].PositionY
				targetWidth=Api.gadget[targetid].width
				targetHeight=Api.gadget[targetid].Height
				InOrOutside=Api.gadget[targetid].RelativeInsideOutside

				if InOrOutside=1 and targetidz<>0 then distance=(distance+width)*-1
				if InOrOutside=0 and targetidz<>-1 then distance=api.gadget[i].RelativeDistance
				if api.gadget[i].RelativeLeft=1
					futurewidth=   targetx-api.gadget[i].positionx -distance
					if futurewidth >5 and API.gadget[targetid].relativeResizeBool=1
						api.gadget[i].width=futurewidth -distance
						DrawGadget(i,api.gadget[i].kind)
					else
						api.gadget[i].positionx= targetx-distance-width
						setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionX,api.gadget[i].PositionY)
					endif
				endif
				if api.gadget[i].RelativeRight=1 
					futurewidth=   api.gadget[i].positionx-(targetx+targetwidth+distance) 
					if futurewidth >5 and API.gadget[targetid].relativeResizeBool=1
						api.gadget[i].width=futurewidth 
						api.gadget[i].PositionX=targetx+distance
						DrawGadget(i,api.gadget[i].kind)
					else
						api.gadget[i].positionx=targetx+targetWidth+distance
						setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionX,api.gadget[i].PositionY)
					endif
				endif
				if api.gadget[i].RelativeTop=1//top
					futureheight=   api.gadget[i].positiony-(targety+targetheight+distance) 
					if futureheight >5 and API.gadget[targetid].relativeResizeBool=1
						api.gadget[i].height=futureheight 
						api.gadget[i].Positiony=targety+distance
						DrawGadget(i,api.gadget[i].kind)
					else
						api.gadget[i].positionY=targetY-distance-height
						setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionY,api.gadget[i].PositionY)
					endif
				endif
				if api.gadget[i].RelativeBottom=1//bottom
					futureheight=   api.gadget[i].positiony-(targety+targetheight+distance) 
					if futureheight >5 and API.gadget[targetid].relativeResizeBool=1
						api.gadget[i].height=futureheight 
						api.gadget[i].Positiony=targety+distance
						DrawGadget(i,api.gadget[i].kind)
					else
						api.gadget[i].positionx=targetY+targetHeight+distance
						setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionY,api.gadget[i].PositionY)
					endif
				endif
			endif
		endif
		//screen	
		if targetIDz=-1
			if api.gadget[i].RelativeLeft=1 
				api.gadget[i].positionx= distance
				setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionX,api.gadget[i].PositionY)
			endif
			if api.gadget[i].RelativeRight=1 
				api.gadget[i].positionx=GetWindowWidth() -width-distance
				setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionX,api.gadget[i].PositionY)
			endif
			if api.gadget[i].RelativeTop=1 
				api.gadget[i].positionY=distance
				setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionY,api.gadget[i].PositionY)
			endif
			if api.gadget[i].RelativeBottom=1 
				api.gadget[i].positionx=GetWindowHeight()-Height-distance
				setspriteposition(api.gadget[i].SpriteID,api.gadget[i].PositionY,api.gadget[i].PositionY)
			endif
			//if anchor on both ends
			if api.gadget[i].RelativeLeft=1  and api.gadget[i].RelativeRight=1 
				api.gadget[i].positionx=1
				api.gadget[i].WIDth=getwindowwidth()-distance
				DrawGadget(i,api.gadget[i].kind)
			endif
			
			if api.gadget[i].RelativeTop=1  and api.gadget[i].RelativeBottom=1 -distance
				api.gadget[i].positionY=distance
				api.gadget[i].Height=getwindowwidth()
				DrawGadget(i,api.gadget[i].kind)
			endif
		endif
	next
endfunction





function Clip(var) 
	For i =0 to API.Gadget.Length
		x=0:y=0:w=0:h=0
		if API.Gadget[i].parent >-1
			x=API.Gadget[i].PositionX
			y=API.Gadget[i].positiony
			w=API.Gadget[i].PositionX+API.Gadget[i].Width
			h=API.Gadget[i].positiony+API.Gadget[i].Height+1
			p=getid(API.Gadget[i].parent)
			px=API.Gadget[p].PositionX
			py=API.Gadget[p].positiony
			pw=API.Gadget[p].PositionX+API.Gadget[p].Width
			ph=API.Gadget[p].positiony+API.Gadget[p].Height
			Pad=API.Gadget[p].PadWidth
			bor=API.Gadget[p].BorderWidth
			if px+bor+Pad > x then x=px+bor+Pad
			if py+bor+Pad > y then y=py+bor+Pad
			if pw-bor-Pad < w then w=pw-bor-Pad
			if ph-bor-Pad < h then h=ph-bor-Pad
			if API.Gadget[p].parent > -1
				pp=getid(API.Gadget[p].parent)
				ppx=API.Gadget[pp].PositionX
				ppy=API.Gadget[pp].positiony
				ppw=API.Gadget[pp].PositionX+API.Gadget[pp].Width
				pph=API.Gadget[pp].positiony+API.Gadget[pp].Height
				if ppx > x then x=ppx
				if ppy > y then y=ppy
				if ppw < w then w=ppw
				if pph < h then h=pph
			Endif
		Endif
		xoffSet=API.Gadget[i].HorizontalOffSet
		SetSpriteScissor(API.Gadget[i].SpriteID,x,y,w,h) 
		if API.Gadget[API.Active].parent >-1
			parent=getid(API.Gadget[API.Active].parent)
			px=API.Gadget[parent].PositionX
			py=API.Gadget[parent].Positiony
			pw=API.Gadget[parent].Width
			ph=API.Gadget[parent].Height
			if API.Dragbody=1 and TIMER()-API.stopEdgeDrag > .400  
				if API.Mouse.x < px or API.Mouse.x > px+pw or API.Mouse.y < py or API.Mouse.y > py+ph	
					unparent(-1)
					exitfunction
				Endif
			Endif
		Endif
	next
endfunction



function Depth_Highlight()
	If API.Gadget[API.hoverActive].HighlightBool=1 and API.gadget[API.hoverActive].kind <> 4 and API.gadget[API.hoverActive].kind <>10
		r=getcolorred(API.Gadget[API.hoverActive].SpriteColor)
		g=getcolorGreen(API.Gadget[API.hoverActive].SpriteColor)
		b=getcolorBlue(API.Gadget[API.hoverActive].SpriteColor)
		a=getcolorAlpha(API.Gadget[API.hoverActive].SpriteColor)
		SetSpritecolor(API.Gadget[API.hoverActive].SpriteID,r/4,g/4,b/4,a)
		SetSpriteTransparency(API.Gadget[API.hoverActive].SpriteID,2)
	Endif
	For i= 0 to API.Gadget.Length
		If API.gadget[i].Spriteid <> API.SpriteHit
			SetSpriteTransparency(API.Gadget[i].SpriteID,1)
			a=getcolorAlpha(API.Gadget[i].SpriteColor)
			SetSpritecolor(API.Gadget[i].SpriteID,255,255,255,a)
		Endif
	//depth only runs on new Mouse selection
		If API.Gadget[i].LegacyID=API.Gadget[API.hoverActive].LegacyID
			SetSpritedepth(API.Gadget[i].SpriteID,API.Gadget[i].Depth-200)
		else
			If API.Gadget[i].Depth <> getSpritedepth(API.Gadget[i].SpriteID)
				SetSpritedepth(API.Gadget[i].SpriteID,API.Gadget[i].Depth )
			Endif
		Endif
	next
endfunction

						
function DragBody(flag,xx,yy)`recursive resue if can
	Active=API.Active
	if flag=1`Force move
		API.Dragbody=1
		API.Mouse.Drag=1
		API.DragEdge=0
		storeDragbool=API.Gadget[API.Active].DragBool`************ add back to gadget at end
		API.Gadget[API.Active].DragBool=1
		API.Mouse.mx=xx
		API.Mouse.my=yy
		goto ForceMove:
	Endif
	
	If API.Mouse.Drag=1 and API.DragEdge=0 and API.Gadget[API.Active].DragBool=1
		API.Dragbody=1
		x=API.Gadget[Active].positionX
		y=API.Gadget[Active].positionY
		if x+API.Mouse.mx > 0 and y+API.Mouse.my >0 and x+API.Gadget[Active].Width+API.Mouse.mx < API.WinWidth and y+API.Gadget[Active].Height+API.Mouse.my < API.WinHeight
			ForceMove:
			x=API.Gadget[Active].positionX
			y=API.Gadget[Active].positionY
			API.Gadget[Active].positionX=x+API.Mouse.mx
			API.Gadget[Active].positionY=Y+API.Mouse.my
			SetSpritePosition(API.Gadget[Active].SpriteID,API.Gadget[Active].positionX,API.Gadget[Active].positionY)
			`recursive
			if temp.Length < 0 then  Temp=API.Gadget[Active].children
			restart:
			local temp as integer[]
			local temp2 as integer[]
			if temp.Length>-1
				For i = 0 to temp.Length`runs through children of parents
					t=temp[i]
					t=getid(t)
					API.Gadget[t].positionX=API.Gadget[t].positionX+API.Mouse.mx
					API.Gadget[t].positionY=API.Gadget[t].positionY+API.Mouse.my
					SetSpritePosition(API.Gadget[t].SpriteID,API.Gadget[t].positionX,API.Gadget[t].positionY)`2nd layer
					For child = 0 to API.Gadget[t].Children.Length `3rd layer deep	
						c=getid(API.Gadget[t].Children[child])
						temp2.insert(API.Gadget[t].Children[child])
					next
					if i=temp.Length and temp2.Length>-1`does detect 3rd child
						temp=temp2
						i=0
						child=0
						temp2.Length=-1	
						goto restart:
					Endif
				next
			Endif
		Endif
	Endif
endfunction



function DragOnDrop()
	If API.DragBody=1 and API.Mouse.LeftState=0  
		API.DragEdge=0
		//reSet Drag stole from Mouse cmds
		Child= API.Gadget[API.Active].SpriteID
		x=getSpritex(Child)
		y=getSpritey(Child)
		SetSpriteposition(Child,x+10000,y+10000)
		target=getSpritehit(getpointerx(),getpointery())
		SetSpriteposition(Child,x,y)
		if target <= 0 and API.Gadget[API.Active].parent > -1
			unparent(-1)
		Endif
		if target >= 0 and API.Gadget[API.Active].parent >-1 
			if target <> API.Gadget[getid(API.Gadget[API.Active].parent)].Spriteid AND TIMER()-API.stopEdgeDrag > .400  
				unparent(-1)
			Endif
		Endif
		For i = 0 to API.Gadget.Length
			If target=API.Gadget[i].SpriteID and target<>getid(API.Gadget[API.Active].parent) and API.Gadget[i].LegacyID<>API.Gadget[API.Active].LegacyID AND TIMER()-API.stopEdgeDrag > .400    
				If target >=0 and API.Gadget[i].kind=2 
					addGadgetChild(-1,i)	
				exit
				Endif
			Endif
		next		
	Endif
endfunction

function unparent(Manual)`might cause issues with legacy ids's shares with old parent
	`For parent or single  item
	Active=API.Active
	if Manual >-1 then Active=Manual
	parent=API.Gadget[Active].parent
	parent=getid(parent)
	`SetSpriteScissor(API.Gadget[Active].SpriteID,0,0,0,0)
	`get real id gfrom parent / search parent children For the fake if of Active if found remove real id
	if parent >-1
		For findchild=0 to API.Gadget[parent].children.Length
			if API.Gadget[Active].id=API.Gadget[parent].children[findchild]
				API.Gadget[parent].children.remove(findchild)
			Endif
		next
	Endif
	oldlegacy=API.Gadget[Active].LegacyID
	inc API.LegacyID, 2
	API.Gadget[Active].LegacyID=API.LegacyID
	API.Gadget[Active].parent=-1
	API.Gadget[Active].depth=1000
	oldSpriteDepth=getSpritedepth(API.Gadget[Active].SpriteID)
	`SetSpriteDepth(API.Gadget[Active].SpriteID,800)
	difference=abs(oldSpriteDepth-800)
	if API.Gadget[Active].kind =2 or API.Gadget[Active].kind =9 or API.Gadget[Active].kind =5
		For i=0 to API.Gadget.Length
			if API.Gadget[i].legacyid=oldlegacy and API.Active <> i and i<> parent
				idepth=getSpritedepth(API.Gadget[i].Spriteid)
				if idepth< oldSpritedepth
					newDepthDiff=abs(oldSpritedepth-idepth)
					`SetSpritedepth(API.Gadget[i].SpriteID,800-newDepthDiff)
					API.Gadget[i].depth=1000-newDepthDiff
					API.Gadget[i].legacyid=API.Gadget[API.Active].legacyid
				Endif
			Endif
		next		
	Endif												
endfunction


	
function  AddGadgetChild(source,target)`target=arrayid
	Local Active as integer
	Local OldLegacy as integer
	Local futureparentLegacy as Integer
	Local TargetDepth as integer
	Local Depth as integer
	Active=API.Active
	if source >-1 then Active=source 
	if target<>Active and target >-1
		futureParentLegacy=API.Gadget[target].LegacyID
		oldlegacy=API.Gadget[Active].legacyid
		API.Gadget[Active].LegacyID=futureparentLegacy
		API.Gadget[Active].parent=API.Gadget[target].id
		depth=1
		API.Gadget[Active].depth=API.Gadget[target].depth-depth
		targetDepth=getSpritedepth(API.Gadget[target].Spriteid)
		SetSpritedepth(API.Gadget[Active].Spriteid,targetdepth-depth)
		API.Gadget[target].children.insert(API.Gadget[Active].id)
		Local i as integer
		For i = 0 to API.Gadget.Length
			if API.Gadget[i].LegacyID=oldlegacy 
				API.Gadget[i].legacyid = futureParentLegacy
				API.Gadget[i].depth= API.Gadget[getid(API.Gadget[i].parent)].depth-10
				SetSpritedepth(API.Gadget[i].Spriteid,getSpritedepth(API.Gadget[getid(API.Gadget[i].parent)].Spriteid)-10)
			Endif
		next
	Endif
endfunction


function createCursor(var) 
	SetRawMouseVisible(0)
	If getSpriteexists(API.cursorSprite)=0
		If  var=1 or var=2
			API.cursorSprite=CreateSprite(API.Gui.hArrow)
			SetSpriteShapeBox(API.cursorSprite,0,0,0,0,0)
			SetSpritedepth(API.cursorSprite,0)
			SetSpriteTransparency (API.CursorSprite,1)
		Endif
		If var=3 or var=4
			API.cursorSprite=CreateSprite(API.Gui.vArrow)
			SetSpriteShapeBox(API.cursorSprite,0,0,0,0,0,0)
			SetSpritedepth(API.cursorSprite,0)
			SetSpriteTransparency (API.CursorSprite,1)
		Endif
	Endif
endfunction

function RunSlider()
	if api.active>-1
		id=api.active
		SpriteWidth=api.gadget[id].WIDth
		if api.gadget[id].kind=8
			if api.mouse.LeftState=1 and api.Spritehit=api.gadget[api.active].SpriteID and api.DragEdge=0
				 now# = api.mouse.x-api.gadget[id].PositionX
				percent#=round((now#/SpriteWidth)*100)
				api.gadget[id].NowRange=percent#
				DrawGadget(8,id)
				print(percent#)
			endif
		endif
	endif
endfunction



