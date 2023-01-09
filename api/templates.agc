// File: templates.agc
// Created: 22-12-18


//COLOR Picker/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Templates are collection of gadgets  assighned to a window they take some time to build but once set up are worth the trouble.
	// to build a template make a function that builds a main window, the build buttons lebels ect and add them as children to the window
	// it is important to give your elements a name so templates can search themselves for targets.  
	//Gadgets run faster then templates but template allow for fast easy replication  and esentially custom gadget
	
	
	//1#  Make a parent window, then make gadgets and add them as children to the parent. color position them ect.
	//2#  return the window ID of the parent
	//3# in run templates add code
		
function MakeColorPicker()
	
	ColorGradientImage=loadIMage(API.path+"/gui/color.png")
	colorPickerWindow=makewindow()
	setwindowsizexy(colorpickerwindow,170,170)
	ColorGradientBTN=makebutton():setbuttonName(ColorGradientBTN,"BTN_Color")
	SetButtonBgImage(ColorGradientBTN,ColorGradientImage)
	SetButtonSize(ColorGradientBTN,20,166)
	setbuttonHighlight(ColorGradientBTN,4)
	AddChild(ColorGradientBTN,colorPickerWindow)
	SetButtonPosition(ColorGradientBTN,2,2)
	
	LabelR=MakeLabel  ("  Red:"):addChild(LabelR,colorPickerWindow):SetLabelPosition(LabelR,75,13):SetLabelBgColor(labelr,makecolor(0,0,0,0)):SetLabelSize(labelr,40,20)
	Labelg=MakeLabel  ("Green:"):addChild(Labelg,colorPickerWindow):SetLabelPosition(Labelg,75,41):SetLabelBgColor(labelg,makecolor(0,0,0,0)):SetLabelSize(labelg,40,20)
	Labelb=MakeLabel  (" Blue:"):addChild(Labelb,colorPickerWindow):SetLabelPosition(Labelb,75,69):SetLabelBgColor(labelb,makecolor(0,0,0,0)):SetLabelSize(labelb,40,20)
	LabelA=MakeLabel  ("Alpha:"):addChild(Labela,colorPickerWindow):SetLabelPosition(Labela,75,96):SetLabelBgColor(labela,makecolor(0,0,0,0)):SetLabelSize(labela,40,20)
	LabelLum=MakeLabel("  Lum:"):addChild(Labellum,colorPickerWindow):SetLabelPosition(Labellum,75,125):SetLabelBgColor(labellum,makecolor(0,0,0,0)):SetLabelSize(labellum,40,20)
	
	r=MakeTextBox():addChild(r,colorPickerWindow):setTextBoxPosition(r,120,4):SetTextBoxSize(r,40,25):setTextBoxTextSize(r,16):setTextBoxName(R,"Red")
	g=MakeTextBox():addChild(g,colorPickerWindow):setTextBoxPosition(g,120,32):SetTextBoxSize(g,40,25):setTextBoxTextSize(g,16):setTextBoxName(g,"green")
	b=MakeTextBox():addChild(b,colorPickerWindow):setTextBoxPosition(b,120,60):SetTextBoxSize(b,40,25):setTextBoxTextSize(b,16):setTextBoxName(b,"blue")
	A=MakeTextBox():addChild(A,colorPickerWindow):setTextBoxPosition(A,120,88):SetTextBoxSize(A,40,25):setTextBoxTextSize(A,16):setTextBoxName(a,"alpha")
	LUM=MakeTextBox():addChild(lum,colorPickerWindow):setTextBoxPosition(lum,120,116):SetTextBoxSize(Lum,40,25):setTextBoxTextSize(lum,16):setTextBoxName(lum,"lum")
	
	GradientImage=loadIMage(API.path+"/gui/gradient.png")
	GradientBTN=makebutton():setbuttonName(GradientBTN,"BTN_Gradient")
	SetButtonBgImage(GradientBTN,GradientImage)
	SetButtonSize(GradientBTN,20,166)
	setbuttonHighlight(GradientBTN,0)
	AddChild(GradientBTN,colorPickerWindow)
	SetButtonPosition(gradientBTN,26,2)
	
	AlphaImage=loadIMage(API.path+"/gui/Alpha.png")
	AlphaBTN=makebutton()
	SetButtonSize(AlphaBTN,20,166)
	SetButtonBgImage(AlphaBTN,AlphaImage)
	setbuttonHighlight(AlphaBTN,0)
	AddChild(AlphaBTN,colorPickerWindow)
	SetButtonPosition(AlphaBTN,50,2)
	alpha=makecolor(255,255,255,50)
	SetButtonBgColor(alphabtn,alpha)
	local ret as integer
	API.Template.ParentID.insert(colorPickerWindow)
endfunction  colorPickerWindow





function RunTemplates()
//this checks for a button press
//find the element with your text then check to see if it is the active button
//if so find the desired target via name and set its value

if GetButtonPress() >0
if len(Api.gadget[getid(GetButtonPress())].name)>0 and Api.gadget[getid(GetButtonPress())].parent> 0
//#Add Your Code Below



		 	if FindTemplate("BTN_Color")=GetButtonPress()
		 		pickcolor(getrawmousex(),getrawmousey())
				setTextBoxString(FindTemplate("red") ,	str( getPickedColorred() ))
				setTextBoxString(FindTemplate("green") ,	str( getPickedColorgreen() ))
				setTextBoxString(FindTemplate("blue") ,	str( getPickedColorBlue() ))
			endif
			
			if FindTemplate("BTN_Gradient")=GetButtonPress()
		 		pickcolor(getrawmousex(),getrawmousey())
		 		setTextBoxString(FindTemplate("lum") ,str(getPickedColorRed()))
			endif
			




endif
endif	

























































































endfunction








































































type TemplateType
	ParentID as integer []
endtype



Function FindTemplate(text as string)
	local RetString as string
	local Name as string
	for templateRange =0 to API.Template.ParentID.length
		for ChildName = 0 to GetTemplateChildren(API.template.ParentID[templateRange])
			Name=getstringtoken(GetTemplateChidName(templateRange,ChildName),":",1)
			ID=val(getstringtoken(GetTemplateChidName(templateRange,ChildName),":",2))
			if lower(name)=lower(text) and api.gadget[id].parent =   api.gadget[getid(GetButtonPress())].parent
				ret=api.gadget[ID].id
				exitfunction ret
			endif
		next
	Next
endfunction 0


Function GetTemplateChildren(ID)
	local ret as integer
	id=getid(id)
	ret=API.gadget[id].Children.length
endfunction ret


Function GetTemplateChidName(ID,ChildName)
	local ret as string
	name as string
	parentid=api.template.parentid[id]
	id=getid(parentid)
	childID=Api.gadget[ID].children[ChildName]
	childID=getid(childID)
	name=API.Gadget[ChildID].Name
	Ret=name+":"+str(ChildID)
endfunction ret
//COLOR Picker/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



