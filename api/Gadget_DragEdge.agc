function DragEdge()
	if API.active <= API.Gadget.length
		posX=API.Gadget[API.active].positionX
		posY=API.Gadget[API.active].positionY
		SizeX=API.Gadget[API.active].Width
		SizeY=API.Gadget[API.active].Height
		mx=API.Mouse.mx
		my=API.Mouse.my
		kind=API.Gadget[API.active].Kind
		Parent=API.Gadget[API.active].Parent
		parent=getid(parent)
		if parent >-1
			PposX=API.Gadget[Parent].positionX
			PposY=API.Gadget[Parent].positionY
			PSizeX=API.Gadget[Parent].Width
			PSizeY=API.Gadget[Parent].Height
			ppw=API.Gadget[parent].PadWIDth
			pbw=API.Gadget[parent].BorderWIDth
			l=API.Gadget[parent].PositionX+pbw+ppw
			t=API.Gadget[parent].PositionY+pbw+ppw
			r=pposx+pSizex-pbw-ppw
			b= API.Gadget[parent].Positiony+API.Gadget[parent].Height-pbw-ppw
		else
			l=0
			t=0
			r=API.WinWIDth
			b=API.WinHeight
		Endif
		cW=API.Gadget[API.active].width
		ch=API.Gadget[API.active].height
		cpx=API.Gadget[API.active].PositionX
		cpy=API.Gadget[API.active].PositionY
		x=getpointerx()
		y=getpointery()
		//no need to find hover If dragging
		If API.DragEdge < 1 and API.Mouse.LeftState=0
			If API.Mouse.draghover>0 then API.Mouse.draghover=0
				If API.Mouse.y >posy and API.Mouse.y < posy+Sizey
					If API.Mouse.x >= posX+1 and API.Mouse.x <= posX+3 			then API.Mouse.dragHover=1 //left
					If API.Mouse.x <= posX+SizeX-1 and API.Mouse.x >= posX+SizeX-3	then API.Mouse.dragHover=2 //right
				Endif
				If API.Mouse.x >posx and API.Mouse.x < posx+Sizex
					If API.Mouse.Y >= posy+1 and API.Mouse.Y <= posY+3 			then API.Mouse.dragHover=3 //top
					If API.Mouse.Y <= posY+SizeY-1 and API.Mouse.Y >= posY+SizeY-3 	then API.Mouse.dragHover=4 //bottom
				Endif
			Endif

			If API.Mouse.dragHover > 0 and API.Mouse.LeftState=1 
				API.DragEdge=API.Mouse.dragHover
				API.stopEdgeDrag=0
				API.dragbody=0
			Endif
			if getid(API.mouse.DownTarget) >-1
				if API.dragedge > 0 then API.active = API.mouse.downtarget
			Endif
			If API.Mouse.dragHover+API.DragEdge>0 and API.gadget[API.active].ReSizeBool=1    then createCursor(API.Mouse.dragHover+API.DragEdge)//add together either will run it
			if GetSpriteExists(API.CursorSprite)
				//hover create cursor position
				If API.Mouse.dragHover =1 or API.Mouse.dragHover=2 or API.DragEdge =1 or API.DragEdge=2
					setSpritePosition(API.CursorSprite, API.Mouse.x-GetSpriteWidth(API.CursorSprite)/2, API.Mouse.Y)
				Endif
				If API.Mouse.dragHover >=3 or API.DragEdge >=3  or API.DragEdge >=3
					setSpritePosition(API.CursorSprite, API.Mouse.x, API.Mouse.Y-GetSpriteHeight(API.CursorSprite)/2)
				Endif
			Endif
		
			If API.gadget[API.active].ReSizeBool=1
				If API.DragEdge > 0
					`SetRawMouseVisible(0)
					minSize=API.Gadget[API.active].MinSize
					If API.Gadget[API.active].width-API.Mouse.MX > minSize and  posx+mx > l 
						If API.DragEdge=1
							API.Gadget[API.active].positionX=API.Gadget[API.active].positionX+API.Mouse.MX
							API.Gadget[API.active].width=API.Gadget[API.active].width-API.Mouse.MX
						Endif
					Endif	
				Endif
				If API.Gadget[API.active].width+API.Mouse.MX > minSize and posX+SizeX+mx  < r
					If API.DragEdge=2
						API.Gadget[API.active].width=API.Gadget[API.active].width+MX
						`if API.gadget[API.active].kind=11 then API.Gadget[API.active].height=API.Gadget[API.active].width	
					Endif
				Endif
				If API.Gadget[API.active].Height-API.Mouse.MY > minSize and posy+my > t
					If API.DragEdge=3
						API.Gadget[API.active].Height=API.Gadget[API.active].Height-API.Mouse.My
						API.Gadget[API.active].positionY=API.Gadget[API.active].positionY+API.Mouse.MY
						`if API.gadget[API.active].kind=11 then API.Gadget[API.active].width=API.Gadget[API.active].Height
					Endif
				Endif
				If API.Gadget[API.active].Height+API.Mouse.MY > minSize and posy+Sizey+my < b
					If API.DragEdge=4
						API.Gadget[API.active].Height=API.Gadget[API.active].Height+API.Mouse.My
						`if API.gadget[API.active].kind=11 then API.Gadget[API.active].width=API.Gadget[API.active].Height
					Endif
				Endif
			Endif
		Endif
	
	If GetSpriteExists(API.cursorSprite)=1 
		If API.Mouse.dragHover < 1 and API.DragEdge < 1
			deleteSprite(API.cursorSprite)
			API.cursorSprite=-1
		Endif
	Endif
	//important
	if GetRawMouseLeftState()=0 and API.stopEdgeDrag=0 then API.stopEdgeDrag=TIMER()
endfunction 1
			