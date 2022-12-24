
Function MouseX()
	Local Ret as Integer
    Ret = API.Mouse.X - API.Mouse.OldX
  	API.Mouse.OldX = API.Mouse.X
endFunction ret

Function MouseY()
	Local Ret as Integer
	Ret = API.Mouse.Y - API.Mouse.OldY
    API.Mouse.OldY = API.Mouse.Y
 endFunction Ret
 
Function Mousemove()
	API.Mouse.mx=MouseX()
	API.Mouse.my=Mousey()
endFunction


function RunMouse()
	local SpriteHit as integer
	API.Mouse.LeftState=GetRawMouseLeftState()
	SpriteHit=getSpritehit(API.Mouse.x,API.Mouse.Y)
	MouseMove()
	If API.Mouse.LeftState=0 
		API.DragEdge=0
		API.DragBody=0
	Endif
	If SpriteHit > 0
		API.SpriteHit=SpriteHit
		For i = 0 to API.Gadget.Length
			If API.Gadget[i].SpriteID=SpriteHit
			 `find if it is a Button
			 	if API.mouse.LeftState<>1
					API.hoverActive=i
					Depth_Highlight()
				Endif
				exit
			Endif
		next
	else
		API.SpriteHit=0
	Endif
	
//Click control Targeting ect
//API.StartLeftDown declared here and is 0
	If API.Mouse.Leftstate=1 and API.Mouse.StartLeftDown=0 
		API.Mouse.StartLeftDown=1
		API.Mouse.LeftDownTimer=timer()
		If SpriteHit>-1
			API.Mouse.DownTarget=SpriteHit
		else
			API.Mouse.DownTarget=-1
		Endif
	Endif
	
	`find Click is down find time between doown and up
	If API.Mouse.LeftState=0 //up
		If API.Mouse.StartLeftDown=1  //has been pressed but not now
			If timer()-API.Mouse.leftDownTimer < API.Mouse.Clickspeed
				If Spritehit=API.Mouse.DownTarget // Target Clicked and down is the same as up Target Set to Active
					API.Mouse.Clicked=1 //full Click
					For i = 0 to API.Gadget.Length
						If API.Gadget[i].SpriteID=SpriteHit
							if API.Gadget[i].kind=1
								 API.ButtonPressed=i`fund if it is a Button
								 api.PersistantButtonPress=api.gadget[i].id
							 endif

							API.Active=i
							Depth_Highlight()
							exit
						Endif
					next
				Endif
			Endif
			API.Mouse.LeftDownTimer=0
			API.Mouse.StartLeftDown=0
		Endif
	Endif
	
	`is Mouse being Dragged
	If API.Active > -1 and not API.Active > API.Gadget.Length
		If API.Mouse.LeftState=1 and API.DragEdge=0 and API.DragBody=0 and API.Mouse.DownTarget=API.Gadget[API.Active].SpriteID 
			API.Mouse.Drag=1
		Endif
	Endif
	HandelCursor()
endfunction



Function HandelCursor()
	`unhide Mouse but dont interfere with other cursors
	If API.CursorSprite < 1
		If API.MouseVisibleBool=1
			SetRawMouseVisible(1)
		Endif
	Endif
endfunction






	
