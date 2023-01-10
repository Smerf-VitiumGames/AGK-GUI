// File: Load_GUI.agc
// Created: 22-06-17


type GuiType
	Bar_Ent as integer
	Bar_right as integer
	Bar_left as integer
	browser as integer
endtype


global gui as guitype

function load_gui_1()
	MakeToolBAr()
	For i= 1 to 100
	b=createobjectbox(3,3,3)
		setobjectposition(b,random(1,200),random(1,200),random(1,200))
		setobjectcolor(b,random(1,255),random(1,255),random(1,255),255)
	next
	MakeCamera(0,"mycam0")
	MakeCamera(1,"mycam1")
	bbb=MakeCamera(2,"mycam3")
	aaa=MakeCamera(3,"mycam4")
	
	//Ent Menu
	`ent Window
	gui.Bar_Ent=MakeWindow()
	SetWindowPositionxy(gui.bar_Ent,1,27)
	setWindowWidth(gui.bar_ent,46)
	setWindowHeight (Gui.bar_ent,286)


	gui.Bar_right=makewindow()
	setWindowWidth(gui.bar_right,146)
	setWindowHeight (Gui.bar_right,800)
	SetWindowRelative(gui.bar_right,"right",1,10,0,1,0)
	SetWindowRelative(gui.bar_right,"bottom",1,10,0,1,0)
	SetWindowRelative(gui.bar_right,"top",1,10,0,1,0)

	`Ent Title
	EntLabel=MakeLabel("Entity's")
	SetLabelSize(EntLabel,78,18)
	AddChild(EntLabel,Gui.bar_ent)
	SetLabelPosition(EntLabel,2,0)
	setlabelmove(entlabel,0)

	camImage=loadimage(API.path+"/gui/camera.png")
	Camera=MakeButton()
	setbuttonBGImage(camera,camimage)
	setbuttonsize(camera,40,40)
	setButtonPosition(camera,4,50)
	AddChild(camera,Gui.bar_ent)
	
	TriggerImage=loadimage(API.path+"/gui/trigger.png")
	trigger=MakeButton()
	setbuttonBGImage(trigger,Triggerimage)
	setbuttonsize(trigger,40,40)
	setButtonPosition(trigger,4,94)
	AddChild(trigger,Gui.bar_ent)
	
	lightImage=loadimage(API.path+"/gui/light.png")
	light=MakeButton()
	setbuttonBGImage(light,lightimage)
	setbuttonsize(light,40,40)
	setButtonPosition(light,4,138)
	AddChild(light,Gui.bar_ent)


	SoundImage=loadimage(API.path+"/gui/Sound.png")
	Sound=MakeButton()
	setbuttonBGImage(Sound,Soundimage)
	setbuttonsize(Sound,40,40)
	setButtonPosition(Sound,4,182)
	AddChild(Sound,Gui.bar_ent)
	
	spawnImage=loadimage(API.path+"/gui/spawn.png")
	spawn=MakeButton()
	setbuttonBGImage(spawn,spawnimage)
	setbuttonsize(spawn,40,40)
	setButtonPosition(spawn,4,226)
	AddChild(spawn,Gui.bar_ent)
	
	
	filmImage=loadimage(API.path+"/gui/film.png")
	film=MakeButton()
	setbuttonBGImage(film,filmimage)
	setbuttonsize(film,40,40)
	setButtonPosition(film,4,270)
	AddChild(film,Gui.bar_ent)
	
	gui.bar_left=makewindow()
	SetWindowSizexy(gui.bar_left,150,GetWindowHeight())
	setwindowpositionxy(gui.bar_left,1,27)
	AddChild(Gui.bar_ent,Gui.bar_left)
	`SetWindowRelative (aaa,"right",1,10,bbb,1,0)
	
	ViewMouseOptions=makebrowser()
	SetBrowserModeText(ViewMouseOptions)
	list as string[]: list=["SingleFlash","Strobe","GlowFade","Ran Flicker","Fire Flicker","colorCangeQuick","ColorChangeFade","Normal"]
	SetBrowserModeText(viewmouseoptions)
	API.Gadget[getid(viewmouseoptions)].BuiltInStrParam2=list
	UpdateBrowser(viewmouseoptions)
	addchild(ViewMouseOptions,gui.bar_left)
	setBrowserPosition(ViewMouseOptions,4,316)
	setbrowsersize(ViewMouseOptions,140,400)
	BorderAplphaSlider=MakeSlider()
	p=MakeColorPicker()
	addchild(p,gui.bar_right)
	
	bborderTextBox=MakeTextBox()
	SetTextBoxSize(bborderTextBox,131,183)
	SetTextBoxPosition(bborderTextBox,182,185)
	`AddChild(bborderTextBox,bgwin)
	

	UpdateGui()
endfunction
		
		
function UpdateGUI()
	RelativePosition()
	RelativePosition()
endfunction
		
	
function load_GUI_2()
`RIGHTPANE RIGHTPANE##########################################################################################################	
MakeToolBar()
	gui.Bar_Right=MakeWindow()
	setWindowWidth(gui.bar_Right,146)
	setWindowHeight (Gui.bar_Right,GetWindowHeight())
	SetWindowPositionxy(gui.bar_Right,GetWindowWidth()-146,27)
	SetWindowResize(gui.bar_right,1)

	`SetAPIcameraanglex(cam3,-90)
	f=MakeBrowser()
	SetBrowserModeText(f)
	imageB=makeBrowser()
	SetBrowserModePreview(imageB)
	FindFiles(f,"smerf_API",0,"png")
	
	UpdateBrowser(f)
	FindFiles(ImageB,"smerf_API",0,"png")
	UpdateBrowser(ImageB)
	
	Spacer=1
	bgWin=MakeWindow()
	SetWindowPositionXY(bgwin,0,0)
	SetWindowWidth(bgwin,287)
	SetWindowHeight(bgWin,getWindowHeight() )
	SetWindowResize(bgwin,1)
	bgcol=makecolor(75,75,75)
`Appearance Label
	label=MakeLabel("Appearance")
	SetLabelPosition(label,3,3)
	SetLabelSize(label,281,20)
	SetLabelTextBold(label,1)
	AddChild(label,bgwin)
	
	`Images Label
	ImagesLabel=MakeLabel("Images       |                 Name                ")
	SetLabelSize(ImagesLabel,230,18)
	SetLabelPosition(ImagesLabel,3,25)
	AddChild(Imageslabel,bgwin)
	
	`Label PadImage
	PadImageLabel=MakeLabel("Padding:        ")
	SetLabelSize(PadImageLabel,78,18)
	SetLabelPosition(PadImageLabel,3,45)
	AddChild(PadImagelabel,bgwin)
	`TextBox
	PadTextBox=MakeTextBox()
	SetTextBoxSize(PadTextBox,131,18)
	SetTextBoxPosition(PadTextBox,82,45)
	AddChild(PadTextBox,bgwin)
	
	`Label BgImage
	BgImageLabel=MakeLabel("Background:")
	SetLabelSize(BGImageLabel,78,18)
	SetLabelPosition(BGImageLabel,3,65)
	AddChild(BgImagelabel,bgwin)
	`TextBox
	bgTextBox=MakeTextBox()
	SetTextBoxSize(bgTextBox,131,18)
	SetTextBoxPosition(bgTextBox,82,65)
	AddChild(bgTextBox,bgwin)
	`Label BorderImage 
	BorderImageLabel=MakeLabel("Border:         ")
	SetLabelSize(BorderImageLabel,78,18)
	SetLabelPosition(BorderImageLabel,3,85)
	AddChild(BorderImagelabel,bgwin)
	`TextBox
	borderTextBox=MakeTextBox()
	SetTextBoxSize(borderTextBox,131,18)
	SetTextBoxPosition(borderTextBox,82,85)
	AddChild(borderTextBox,bgwin)
	

	
	`Label Enable 
	EnableLabel=MakeLabel("Enable")
	SetLabelSize(EnableLabel,50,18)
	SetLabelPosition(EnableLabel,234,25)
	SetLabelTextBold(Enablelabel,1)
	AddChild(Enablelabel,bgwin)
	`checkbox
	PadCheck=MakeCheckbox()
	SetCheckBoxSize(PadCheck,14,14)
	SetCheckBoxPosition(PadCheck,255,45)
	AddChild(Padcheck,bgwin)
	`check
	BGCheck=MakeCheckbox()
	SetCheckBoxSize(BGCheck,14,14)
	SetCheckBoxPosition(bgCheck,255,65)
	AddChild(bgcheck,bgwin)
	`check
	BorderCheck=MakeCheckbox()
	SetCheckBoxSize(BorderCheck,14,14)
	SetCheckBoxPosition(borderCheck,255,85)
	AddChild(bordercheck,bgwin)
	
	`FolderButton
	f1=makeButton()
	SetButtonBgImage(f1,API.gui.folder)
	SetButtonSize(f1,22,16)
	SetButtonText(f1,"")
	SetButtonPosition(f1,214,45)
	AddChild(f1,bgwin)
	`folderButton
	f2=makeButton()
	SetButtonBgImage(f2,API.gui.folder)
	SetButtonSize(f2,22,16)
	SetButtonText(f2,"")
	SetButtonPosition(f2,214,65)
	AddChild(f2,bgwin)
	`folderButton
	f3=makeButton()
	SetButtonBgImage(f3,API.gui.folder)
	SetButtonSize(f3,22,16)
	SetButtonText(f3,"")
	SetButtonPosition(f3,214,85)
	AddChild(f3,bgwin)
`Behavior Label Gadget
	backgroundAlpha=MakeLabel("Backgound Alpha:   ")
	SetLabelSize(backgroundAlpha,200,14)
	SetLabelPosition(backgroundAlpha,3,105)
	SetLabelTextLeft(backgroundAlpha,1)
	AddChild(backgroundAlpha,bgwin)
	
`alpha textbox
	TextBoxAlpha=MakeTextBox()
`SetTextBoxSize(TextBoxAlpha,200,14)
	SetTextBoxPosition(TextBoxAlpha,3,89)
`SetTextBoxTextLeft(backgroundAlpha,1)
	AddChild(TextBoxAlpha,bgwin)

`Alpha
	BorderAplphaSlider=MakeSlider()
	SetSliderSize(BorderAplphaSlider,100,4)
	SetSliderPosition(BorderAplphaSlider,355,189)
	AddChild(BorderAplphaSlider,bgwin)

`Appearance Label
	label=MakeLabel("Behavior")
	SetLabelPosition(label,3,130)
	SetLabelSize(label,281,20)
	SetLabelTextBold(label,1)
	SetLabelBorderColor(label,API.color.Black)
	SetLabelBorderWidth(Label,1)
	AddChild(label,bgwin)
endfunction
`GetPointerMoveY()


function rungui1()
	`MakeSlider()
	SetCameraRotationX(0,GetCameraRotationX(0) +getpointerMovey())
	SetCameraRotationY(0,GetCameraRotationY(0) -getpointerMoveX())
	
	SetCameraRotationX(1,GetCameraRotationX(1) +getpointerMoveY()/2)
	SetCameraRotationY(1,GetCameraRotationY(1) -getpointerMoveX()/2)
	
	SetCameraRotationX(2,GetCameraRotationX(2) +getpointerMovey())
	SetCameraRotationY(2,GetCameraRotationY(2) +getpointermoveX())

	SetCameraRotationX(3,GetCameraRotationX(3) +getpointermovey() /2)
	SetCameraRotationY(3,GetCameraRotationY(3) +getpointermoveX() /2)
	UpdateCameraView(0)
	UpdateCameraView(1)
	UpdateCameraView(2)
	UpdateCameraView(3)
endfunction 
