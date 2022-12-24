// File: Gadget_Scroll.agc
// Created: 22-04-22
							
function AutoScroll()` add if Draggind and scroll ID >1 to reduce lagg later
Local ID as integer
Local C as Integer
Local C2 as Integer 
Local horRemove as Integer
if API.Dragedge > 0
	Local count as Integer=-1
	Local count2 as Integer=-1
	Local hormake as Integer=-1
	Local vertmake as Integer=-1
	Local P as Integer
	For p=0 to API.Gadget.Length
		if API.Gadget[p].children.Length = 0
			if API.Gadget[getID(API.Gadget[p].children[0])].kind=4
				ID=getID(API.Gadget[p].children[0])
				unparent(ID)
				deleteSprite(API.Gadget[ID].SpriteID)
				deleteimage(API.Gadget[ID].ImageID)
				API.Gadget.remove(ID)
				API.Gadget[p].scrollID= -1
				exitfunction 1
			Endif
		Endif

		Local CID as Integer
		if API.Gadget[p].Children.Length > -1 and API.Gadget[p].kind <> 4
			For c=0 to API.Gadget[p].Children.Length
				cID= getID(API.Gadget[p].Children[c])
				`horizontal	
				if API.Gadget[p].scrollID=-1																																
					if API.Gadget[cID].positionX < API.Gadget[p].positionX and API.Gadget[cID].kind <> 4 or API.Gadget[cID].positionX +API.Gadget[cID].Width > API.Gadget[p].positionX+API.Gadget[p].Width 
						HorMake=cID
					Endif
				Endif
				if API.Gadget[p].scrollID > -1 and API.Gadget[cID].kind <> 4 
					if  API.Gadget[cID].positionX > API.Gadget[p].positionX and API.Gadget[cID].positionX +API.Gadget[cID].Width < API.Gadget[p].positionX+API.Gadget[p].Width
						inc count, 1
					Endif
				Endif
				if c=API.Gadget[p].Children.Length and count=API.Gadget[p].Children.Length-1 and count <> -1				
					horRemove=1
					hormake=-1
				Endif 
			next
		Endif
		
		Local CID2 as Integer
		Local VertRemove as integer
		if API.Gadget[p].Children.Length > -1 and API.Gadget[p].kind <> 10
			For c2=0 to API.Gadget[p].Children.Length
				cID2= getID(API.Gadget[p].Children[c2])
				`Vertizontal	
				if API.Gadget[p].ScrollID2=-1																														
					if API.Gadget[cID2].PositionY < API.Gadget[p].PositionY and API.Gadget[cID2].kind <> 4 or API.Gadget[cID2].PositionY +API.Gadget[cID2].Height > API.Gadget[p].PositionY+API.Gadget[p].Height 
						VertMake=cID2
					Endif
				Endif
				if API.Gadget[p].ScrollID2 > -1 and API.Gadget[cID2].kind <> 10
					if  API.Gadget[cID2].PositionY > API.Gadget[p].PositionY and API.Gadget[cID2].PositionY +API.Gadget[cID2].Height < API.Gadget[p].PositionY+API.Gadget[p].Height
						inc count2, 1
					Endif
				Endif
				if c2=API.Gadget[p].Children.Length and count=API.Gadget[p].Children.Length-1 and count <> -1				
					VertRemove=1
					Vertmake=-1
				Endif 
			next
		Endif
		
		Local ScrollID as integer
		ScrollID=getID(API.Gadget[p].scrollID)
		if HorRemove =1 
			if  scrollID >0
				if API.Gadget[ScrollID].kind=4
					unparent(scrollID)
					deleteSprite(API.Gadget[ScrollID].SpriteID)
					deleteimage(API.Gadget[ScrollID].ImageID)
					API.Gadget.remove(scrollID)
					API.Gadget[p].scrollID=-1
					exitfunction 1
				Endif
			Endif
		Endif
		
		Local ScrollID2 as integer
		ScrollID2=getID(API.Gadget[p].scrollID2)
		if vertRemove =1 
			if  scrollID2 >0
				if API.Gadget[ScrollID2].kind=10
					unparent(scrollID2)
					deleteSprite(API.Gadget[ScrollID2].SpriteID)
					deleteimage(API.Gadget[ScrollID2].ImageID)
					API.Gadget.remove(scrollID2)
					API.Gadget[p].scrollID2=-1
					exitfunction 1
				Endif
			Endif
		Endif
		
				

		if HorMake > -1 and API.Gadget[p].scrollID=-1 and API.Gadget[cID].kind <> 4
			`checked this loop only runes once verified to work prperly
			`API.Active=-1
			Local ret as integer
			ret=DrawGadget(4,-1)`Horizontal scroll Make=1
			API.Gadget[p].scrollID=API.Gadget[ret].ID
			LocalpW=API.Gadget[p].Width
			ph=API.Gadget[p].Height
			Ppx=API.Gadget[p].positionx
			Ppy=API.Gadget[p].positiony
			pPw=API.Gadget[p].PadWidth
			pBw=API.Gadget[p].BorderWidth
			ch=API.Gadget[ret].Height

			API.Gadget[ret].PositionX=(ppx+ppw+pbw)
			API.Gadget[ret].PositionY=(ppy+ph-pbw-ppw-ch)
			API.Gadget[ret].Width=pw-(pbw*2)-(ppw*2)
			addGadgetChild(ret,p)
			if p <> ret `and API.Gadget[ret].kind =4 and API.Active <> ret  and API.Gadget[P].kind <>4 and p <> API.Active and API.Gadget[ret].LegacyID <> API.Gadget[p].legacyID and API.Gadget[ret].parent <  0
				ret=DrawGadget(4,ret)`remake
			Endif
		Endif
		count=-1
		hormake=-1
		horremove=-1
		`reSize scroll bar
		if API.Gadget[p].kind=4 `if gadget is a scroll bar
			if getID(API.Gadget[p].parent)=API.Active`if scroll bar parent is Active check For Drag
				if API.DragEdge > 0
					parent=getID(API.Gadget[p].parent)
					Padw=API.Gadget[parent].PadWidth
					bw=API.Gadget[parent].BorderWidth
					Width=API.Gadget[parent].Width
					Height=API.Gadget[parent].Height
					API.Gadget[p].Width=Width-(Padw*2)-(bw*2)
					API.Gadget[p].positionx=API.Gadget[parent].positionx+Padw+bw
					API.Gadget[p].positiony=API.Gadget[parent].PositionY+Height-API.Gadget[p].Height-Padw-bw
					DrawGadget(4,p)
				Endif
			Endif
		Endif
		
		if VertMake > -1 and API.Gadget[p].scrollID2=-1 and API.Gadget[cID].kind <> 10
			`checked this loop only runes once verified to work prperly
			`API.Active=-1
			ret2=DrawGadget(10,-1)`Horizontal scroll Make=1
			API.Gadget[p].scrollID2=API.Gadget[ret2].ID`issue heredg
			pW=API.Gadget[p].Width
			ph=API.Gadget[p].Height
			Ppx=API.Gadget[p].positionx
			Ppy=API.Gadget[p].positiony
			pPw=API.Gadget[p].PadWidth
			pBw=API.Gadget[p].BorderWidth
			ch=API.Gadget[ret2].Height

			API.Gadget[ret2].PositionX=(ppx+pw-ppw-pbw-API.Gadget[ret2].Width)
			API.Gadget[ret2].PositionY=(ppy+pbw+ppw)
			API.Gadget[ret2].Height=ph-(pbw*2)-(ppw*2)
			addGadgetChild(ret2,p)
			if p <> ret2 `and API.Gadget[ret2].kind =4 and API.Active <> ret2  and API.Gadget[P].kind <>4 and p <> API.Active and API.Gadget[ret2].LegacyID <> API.Gadget[p].legacyID and API.Gadget[ret2].parent <  0
				ret2=DrawGadget(10,ret2)`remake
			Endif
		Endif
		count2=-1
		vertmake=-1
		vertRemove=-1
		`reSize scroll bar
		if API.Gadget[p].kind=10 `if gadget is a scroll bar
			if getID(API.Gadget[p].parent)=API.Active`if scroll bar parent is Active check For Drag
				if API.DragEdge > 0
					parent=getID(API.Gadget[p].parent)
					Padw=API.Gadget[parent].PadWidth
					bw=API.Gadget[parent].BorderWidth
					Height=API.Gadget[parent].Height
					Width=API.Gadget[parent].Width
				
					API.Gadget[p].Height=Height-(Padw*2)-(bw*2)
					API.Gadget[p].positionx=API.Gadget[parent].positionx+Width-API.Gadget[p].Width-Padw-bw
					API.Gadget[p].positiony=API.Gadget[parent].positiony+Padw+bw
					DrawGadget(10,p)
				Endif
			Endif
		Endif
		
	next
Endif
	scrollBar()
	scrollBar2()
endfunction 1


function ScrollBar()
	`SCALE SlIDer
	if API.Active >-1
		if API.Gadget[API.Active].scrollID > 0 `has scroll bar
			parent=API.Active`getID(API.Gadget[ID].parent)
			xleft=API.Gadget[parent].PositionX
			xright=(API.Gadget[parent].PositionX+API.Gadget[parent].Width)
			For extents= 0 to API.Gadget[parent].Children.Length
				child=getID(API.Gadget[parent].Children[extents])
				if not API.Gadget[child].kind =4
					if API.Gadget[child].PositionX+API.Gadget[child].Width > API.Gadget[parent].Positionx+API.Gadget[parent].Width  and  API.Gadget[child].PositionX+API.Gadget[child].Width > xright then xright=API.Gadget[child].PositionX +API.Gadget[child].Width
					if API.Gadget[child].PositionX < API.Gadget[parent].PositionX and  API.Gadget[child].PositionX < xleft then xleft=API.Gadget[child].PositionX
				Endif
			next 
			ExtentLeft=API.Gadget[parent].positionx-xLeft
			ExtentRight=xRight-(API.Gadget[parent].Positionx+API.Gadget[parent].Width)
			API.Gadget[API.Active].ScrollBarH[0]=ExtentLeft
			API.Gadget[API.Active].ScrollBarH[1]=ExtentRight`moved from gadget to window let it manage its own scrol bar
			BarSize=API.Gadget[API.Active].Width-(API.Gadget[API.Active].PadWidth*2)-(API.Gadget[API.Active].BorderWidth*2)
			if barSize <= 1 
				 barSize=1
			Endif
			`CALCULATE SLIDER Size	
			world#=extentright+extentLeft+API.Gadget[API.Active].Width
			b#=barSize
			percent#=(b#/world#*100)+1`correct
			Size#=b#/100*percent#
			API.Gadget[API.Active].ScrollBarH[2]=round(Size#)
			SlIDerWidth=API.Gadget[parent].ScrollBarH[2] 
			if API.Gadget[API.Active].ScrollBarH[3] < API.Gadget[API.Active].PadWidth+API.Gadget[API.Active].BorderWidth
				API.Gadget[API.Active].ScrollBarH[3]=API.Gadget[API.Active].PadWidth+API.Gadget[API.Active].BorderWidth
			Endif
			DrawGadget(4,API.Active)
		Endif
	`SlIDer Control			
	if API.Gadget[API.Active].kind=4
		parent=getID(API.Gadget[API.Active].parent)
		if API.SpriteHit= API.Gadget[API.Active].SpriteID and API.Mouse.DownTarget=API.Gadget[API.Active].SpriteID and API.Mouse.LeftState=1` find Mouse pos
			MouseDown=API.Mouse.X
			xStart=API.Gadget[API.Active].PadWidth+API.Gadget[API.Active].BorderWidth+-API.Gadget[API.Active].PadWidth-API.Gadget[API.Active].BorderWidth
			xEnd=(API.Gadget[parent].Width - API.Gadget[parent].PadWidth-API.Gadget[parent].BorderWidth)-API.Gadget[API.Active].PadWidth-API.Gadget[API.Active].BorderWidth-2
			parent=getID(API.Gadget[API.Active].parent)
			SlIDerPosx=API.Gadget[parent].ScrollBarH[3]
			SlIDerWidth=API.Gadget[parent].ScrollBarH[2]
			if SlIDerPosX +API.Mouse.mx >= xStart and xend > slIDerposx +API.Mouse.mx +slIDerWidth `SlIDerWidth 
				BarSize=API.Gadget[API.Active].Width-(API.Gadget[API.Active].PadWidth*2)-(API.Gadget[API.Active].BorderWidth*2)
				API.Gadget[parent].scrollBarH[3]=API.Gadget[parent].scrollBarH[3]+API.Mouse.mx`position
				world=API.Gadget[parent].Width+API.Gadget[parent].ScrollBarH[0]+API.Gadget[parent].ScrollBarH[1]
				API.Gadget[parent].ScrollBarH[4]=API.Gadget[parent].ScrollBarH[4]+ API.Mouse.mx* round((world/ (barSize-round(SlIDerWidth/2))))
				DrawGadget(4,API.Active)
					For child=0 to API.Gadget[parent].Children.Length
						ID=getID(API.Gadget[parent].children[child])
						if API.Gadget[ID].kind <> 4 and API.Gadget[ID].kind <> 10
							`Setchildren to same offSet as scroll bar, might need to run a check later to remove offSets
							OldOffSet=API.Gadget[parent].ScrollBarH[4]
							newoffSet=API.Gadget[ID].HorizontalOffSet
							offSet=oldoffSet-newoffSet
							API.Gadget[ID].HorizontalOffSet=API.Gadget[ID].HorizontalOffSet+offSet
							API.Gadget[ID].PositionX=API.Gadget[ID].PositionX-offSet
							SetSpriteposition(API.Gadget[ID].SpriteID,API.Gadget[ID].PositionX,API.Gadget[ID].PositionY)
							Clip(1)
						Endif
					next
				Endif
			Endif
		Endif
	Endif
endfunction 






function ScrollBar2()
	`SCALE SlIDer
	if API.Active >-1
		if API.Gadget[API.Active].scrollID2 > 0 `has scroll bar
			parent=API.Active`getID(API.Gadget[ID].parent)
			YTop=API.Gadget[parent].PositionY
			YBottom=(API.Gadget[parent].Positiony+API.Gadget[parent].Height)
			For extents= 0 to API.Gadget[parent].Children.Length
				child=getID(API.Gadget[parent].Children[extents])
				if not API.Gadget[child].kind =10
					if API.Gadget[child].PositionY+API.Gadget[child].Height > API.Gadget[parent].Positiony+API.Gadget[parent].Height  and  API.Gadget[child].PositionY+API.Gadget[child].Height > YBottom then YBottom=API.Gadget[child].PositionY +API.Gadget[child].Height
					if API.Gadget[child].PositionY < API.Gadget[parent].PositionY and  API.Gadget[child].PositionY< YTop then yTop=API.Gadget[child].PositionY
				Endif
			next 
			ExtentTop=API.Gadget[parent].positiony-YTop
			Extentbottom=Ybottom-(API.Gadget[parent].Positiony+API.Gadget[parent].Height)
			API.Gadget[API.Active].ScrollBarV[0]=ExtentTop
			API.Gadget[API.Active].ScrollBarV[1]=Extentbottom`moved from gadget to window let it manage its own scrol bar
			BarSize=API.Gadget[API.Active].Height-(API.Gadget[API.Active].PadWidth *2)-(API.Gadget[API.Active].BorderWidth*2)
			if barSize <= 1 
				 barSize=1
			Endif
			`CALCULATE SLIDER Size	
			world#=extentbottom+extentTop+API.Gadget[API.Active].Height
			b#=barSize
			percent#=(b#/world#*100)+1`correct
			Size#=b#/100*percent#
			API.Gadget[API.Active].ScrollBarV[2]=round(Size#)
			SlIDerHeight=API.Gadget[parent].ScrollBarv[2] 
			if API.Gadget[API.Active].ScrollBarV[3] < API.Gadget[API.Active].PadWidth+API.Gadget[API.Active].BorderWidth
				API.Gadget[API.Active].ScrollBarV[3]=API.Gadget[API.Active].PadWidth+API.Gadget[API.Active].BorderWidth
			Endif
			DrawGadget(10,API.Active)
		Endif
				
		`SlIDer Control			
		if API.Gadget[API.Active].kind=10
			parent=getID(API.Gadget[API.Active].parent)
			SlIDerHeight=API.Gadget[parent].ScrollBarv[2] 
			if API.SpriteHit= API.Gadget[API.Active].SpriteID and API.Mouse.DownTarget=API.Gadget[API.Active].SpriteID and API.Mouse.LeftState=1` find Mouse pos
				YStart=API.Gadget[API.Active].PadWidth+API.Gadget[API.Active].BorderWidth+API.Gadget[parent].PadWidth-API.Gadget[parent].BorderWidth
				YEnd=(API.Gadget[API.active].Height-API.Gadget[API.Active].PadWidth-API.Gadget[API.Active].BorderWidth)
				parent=getID(API.Gadget[API.Active].parent)
				SlIDerPosY=API.Gadget[parent].ScrollBarV[3]
				`posistion scroll bar
				if SlIDerPosY +API.Mouse.mY >= YStart and yend > SlIDerPosY+API.Mouse.mY+SlIDerHeight
					BarSize=API.Gadget[API.Active].Height-(API.Gadget[API.Active].PadWidth*2)-(API.Gadget[API.Active].BorderWidth*2)
					API.Gadget[parent].scrollBarV[3]=API.Gadget[parent].scrollBarV[3]+API.Mouse.my`position
					world=API.Gadget[parent].Height+API.Gadget[parent].ScrollBarV[0]+API.Gadget[parent].ScrollBarV[1]
					API.Gadget[parent].ScrollBarV[4]=API.Gadget[parent].ScrollBarV[4]+ API.Mouse.my* round((world/ (barSize-round(SlIDerHeight/2))))
					DrawGadget(10,API.Active)
					For child=0 to API.Gadget[parent].Children.Length
						ID=getID(API.Gadget[parent].children[child])
						if API.Gadget[ID].kind <> 10 and API.Gadget[ID].kind <> 4
							`Setchildren to same offSet as scroll bar, might need to run a check later to remove offSets
							OldOffSet=API.Gadget[parent].ScrollBarV[4]
							newoffSet=API.Gadget[ID].VerticalOffSet
							offSet=oldoffSet-newoffSet
							API.Gadget[ID].VerticalOffSet=API.Gadget[ID].VerticalOffSet+offSet
							API.Gadget[ID].PositionY=API.Gadget[ID].PositionY-offSet
							SetSpriteposition(API.Gadget[ID].SpriteID,API.Gadget[ID].PositionX,API.Gadget[ID].PositionY)
							Clip(1)
						Endif
					next
				Endif
			Endif
		Endif
	Endif
endfunction














