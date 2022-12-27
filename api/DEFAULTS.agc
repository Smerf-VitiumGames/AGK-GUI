


// DEFAULTS####################################################

Function BuildDefaultButton()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	`Properties
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.MinSize=10
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.scrollID=-1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=1
	Temp.Depth=1000
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=40
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=255
	Temp.borderAlpha=255
	Temp.PadAlpha=255
	Temp.BgImageID=API.Gui.Button
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=1
	Temp.Bordercolor=API.Color.black
	Temp.Bgcolor=API.Color.black
	Temp.Fontcolor=API.Color.white
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.White
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip=""
	Temp.DragBool=0
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.HoverBool=1
	Temp.HighlightBool=1
	API.Gadget.insert(Temp)
Endfunction 



function BuildDefaultWindow()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.scrollID=-1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=2`change to type
	Temp.Depth=1000
	`Properties
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=100
	Temp.MinSize=40
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=255
	Temp.borderAlpha=255
	Temp.PadAlpha=255
	Temp.BgImageID=0
	Temp.alpha=255
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=1
	temp.bgimageID=-1
	Temp.Bordercolor=API.Color.black
	Temp.Bgcolor=makecolor(114,114,114,255)
	Temp.Fontcolor=API.Color.white
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.Darkgray
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip="dddd"
	Temp.DragBool=1
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=20
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.HoverBool=1
	Temp.HighlightBool=0
	Temp.ScrollBarH.Length=5`0=lefTextent,1=righTextent
	Temp.ScrollBarV.Length=5
	API.Gadget.insert(Temp)
Endfunction 


function BuildDefaultCheckBox()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.scrollID=-1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=3`change to type
	Temp.Depth=1000
	`Properties
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=14
	Temp.Height=14
	Temp.MinSize=10
	Temp.State=0
	Temp.TextAlpha=255
	Temp.BgAlpha=155
	Temp.borderAlpha=255
	Temp.BgImageID=API.gui.checkbox
	Temp.alpha=255
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=0
	Temp.Bordercolor=API.Color.black
	Temp.Bgcolor=API.Color.white
	Temp.Fontcolor=API.Color.white
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.Darkgray
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip="Checkbox"
	Temp.DragBool=1
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.HoverBool=1
	Temp.HighlightBool=1
	API.Gadget.insert(Temp)
Endfunction


function BuildDefaultScrollBar()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.scrollID=-1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=4`change to type
	Temp.Depth=1000
	`Properties
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=20
	Temp.Height=20
	Temp.MinSize=20
	Temp.Alpha=255
	`Temp.BgImageID=API.gui.Button
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=1
	Temp.BorderWidth=1
	Temp.Bordercolor=API.Color.black
	Temp.Bgcolor=API.Color.black
	Temp.Fontcolor=API.Color.white
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.Darkgray
	Temp.ScrollSlidercolor=API.Color.Gray
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip="<-Scroller->"
	`Temp.DragBool=0
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=20
	Temp.Bold=0
	`Temp.TextStr.insert("<---Scroller--->")
	Temp.HoverBool=1
	Temp.HighlightBool=1
	`Temp.BuiltInIntParam. 0=posiiton,1=Size,leftoffest,rightoffSet
	API.Gadget.insert(Temp)
Endfunction 


function BuildDefaultScrollBar2()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.scrollID=-1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=10`change to type
	Temp.Depth=1000
	`Properties
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=20
	Temp.Height=20
	Temp.MinSize=20
	Temp.Alpha=255
	`Temp.BgImageID=API.gui.Button
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=1
	Temp.BorderWidth=1
	Temp.Bordercolor=API.Color.darkgray
	Temp.Bgcolor=API.Color.black
	Temp.Fontcolor=API.Color.white
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.Darkgray
	Temp.ScrollSlidercolor=API.Color.Gray
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip="<-Scroller->"
	`Temp.DragBool=0
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=20
	Temp.Bold=0
	`Temp.TextStr.insert("<---Scroller--->")
	Temp.HoverBool=1
	Temp.HighlightBool=1
	`Temp.BuiltInIntParam. 0=posiiton,1=Size,leftoffest,rightoffSet
	API.Gadget.insert(Temp)
Endfunction 

function BuildDefaultTextBox()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.MinSize=12
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.scrollID=-1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=5`change to type
	Temp.Depth=1000
	`Properties
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=30
	Temp.Height=30
	Temp.BgAlpha=255
	Temp.borderAlpha=255
	Temp.PadAlpha=255
	Temp.BgImageID=API.Gui.input
	Temp.Padcolor=API.Color.gray
	Temp.PadWidth=0
	Temp.BorderWidth=1
	Temp.Bordercolor=API.Color.darkgray
	Temp.Bgcolor=API.Color.Lightgray
	Temp.Fontcolor=API.Color.black
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.gray
	`behavior
	Temp.EditMode=0
	Temp.ActiveBool=1
	Temp.ToolTip="input field"
	Temp.DragBool=1
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.HoverBool=1
	Temp.HighlightBool=0
	API.Gadget.insert(Temp)
Endfunction 

Function BuildDefaultLabel()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	`Properties
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.MinSize=10
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.scrollID=-1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=6
	Temp.Depth=1000
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=40
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=155
	Temp.borderAlpha=255
	Temp.PadAlpha=255
	Temp.BgImageID=-1
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=0
	Temp.Bordercolor=API.Color.blue
	Temp.Bgcolor=API.Color.gray
	Temp.Fontcolor=API.Color.black
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.White
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip=""
	Temp.DragBool=1
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("Label "+str(Temp.ID))
	Temp.TextFont="Calibri"
	Temp.HoverBool=1
	Temp.HighlightBool=0
	API.Gadget.insert(Temp)
Endfunction 

`divIDer
Function BuildDefaultDivider()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	`Properties
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.MinSize=8
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.scrollID=-1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=7
	Temp.Depth=1000
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=10
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=155
	Temp.borderAlpha=255
	Temp.PadAlpha=255
	Temp.BgImageID=-1
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=0
	Temp.Bordercolor=API.Color.blue
	Temp.Bgcolor=API.Color.gray
	Temp.Fontcolor=API.Color.black
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.White
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip=""
	Temp.DragBool=1
	Temp.ReSizeBool=0
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("Label "+str(Temp.ID))
	Temp.TextFont="Calibri"
	Temp.HoverBool=1
	Temp.HighlightBool=0
	API.Gadget.insert(Temp)
Endfunction 


Function BuildDefaultSlider()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	`Properties
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.MinSize=8
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.scrollID=-1
	Temp.rangeLow=0
	Temp.rangeHigh=100
	Temp.NowRange=50
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=8
	Temp.Depth=1000
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=20
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=255
	Temp.borderAlpha=155
	Temp.PadAlpha=155
	Temp.BgImageID=API.Gui.Slidebar
	Temp.SecondImageID=api.gui.SlideBTN
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=0
	Temp.Bordercolor=API.Color.blue
	Temp.Bgcolor=API.Color.gray
	Temp.Fontcolor=API.Color.black
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.White
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip=""
	Temp.DragBool=1
	Temp.ReSizeBool=1
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.TextFont="Calibri"
	Temp.HoverBool=1
	Temp.HighlightBool=0
	Temp.BuiltInintParam.insert(5)
	Temp.BuiltInIntParam.insert(20)
	API.Gadget.insert(Temp)
Endfunction 


Function BuildDefaultBrowser()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	`Properties
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.MinSize=40
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.scrollID=-1
	Temp.scrollID2=-1
	`Temp.rangeLow=0
	`Temp.rangeHigh=100
	`Temp.NowRange=50
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=9
	Temp.Depth=1000
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=100
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=255
	Temp.borderAlpha=155
	Temp.PadAlpha=155
	Temp.BgImageID=-1
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=0
	Temp.BorderWidth=1
	Temp.Bordercolor=API.Color.black
	Temp.Bgcolor=API.Color.gray
	Temp.Fontcolor=API.Color.black
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.White
	`behavior
	Temp.EditMode=1
	Temp.ActiveBool=1
	Temp.ToolTip=""
	Temp.DragBool=1
	Temp.ReSizeBool=1
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=20
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.TextFont="Calibri"
	Temp.HoverBool=1
	Temp.HighlightBool=0
	Temp.BuiltInIntParam.Length=4
	Temp.BuiltInIntParam[0]=1
	Temp.ScrollBarH.Length=5`0=lefTextent,1=righTextent
	Temp.ScrollBarV.Length=5
	`Temp.BuiltInIntParam.insert(0)
	`BuiltInIntParam [0]=boolean For icon mode [0,1]=preview mode	
	API.Gadget.insert(Temp)
endfunction

function BuildDefaultViewPort()// Future functionality type this insert defaults based on kind.
	inc API.GlobalGadgetNum ,1
	inc API.legacyID,1
	Temp as GadgetType
	Temp.ID=API.GlobalGadgetNum
	Temp.parent=-1
	Temp.ScrollBool=1
	Temp.scrollID=-1
	Temp.ScrollHorBool=1
	Temp.ScrollVertBool=1
	Temp.LegacyID=API.LegacyID
	Temp.SpriteID=0
	Temp.Kind=11`change to type
	Temp.Depth=1000
	`Properties
	Temp.PositionX=100
	Temp.PositionY=100
	Temp.Width=100
	Temp.Height=100
	Temp.MinSize=40
		
	Temp.Alpha=255
	Temp.TextAlpha=255
	Temp.BgAlpha=255
	Temp.borderAlpha=255
	Temp.PadAlpha=255
	Temp.BgImageID=-1
	Temp.alpha=255
	Temp.Padcolor=API.Color.darkgray
	Temp.PadWidth=1
	Temp.BorderWidth=1
	Temp.Bordercolor=API.Color.orange
	Temp.Bgcolor=API.Color.black
	Temp.Fontcolor=API.Color.white
	Temp.AlineLeftBool=0
	Temp.AlineTopBool=0
	Temp.AlineRightBool=0
	Temp.AlineBottomBool=0
	Temp.SpriteColor=API.Color.Darkgray
	
	`behavior
	Temp.EditMode=0
	Temp.ActiveBool=1
	Temp.ToolTip="dddd"
	Temp.DragBool=1
	Temp.ReSizeBool=1
	Temp.MinimizeBool=0
	Temp.MaximizeBool=0
	Temp.CloseBool=0
	Temp.TooltipBool=0
	Temp.TextSize=16
	Temp.Bold=0
	Temp.TextStr.insert("")
	Temp.HoverBool=1
	Temp.HighlightBool=0
	Temp.ScrollBarH.Length=5`0=lefTextent,1=righTextent
	Temp.ScrollBarV.Length=5
	API.Gadget.insert(Temp)
Endfunction 