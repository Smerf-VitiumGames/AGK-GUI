function INIT_API()
	SetCurrentDir("..")
	#include "api/API_Colors.agc"
	#include "api/API_Mouse.agc"
	#include "api/Command_API.agc"
	#include "api/Command_Browser.agc"
	#include "api/Command_Button.agc"
	#include "api/Command_CheckBox.agc"
	#include "api/Command_Label.agc"
	#include "api/Command_Slider.agc"
	#include "api/Command_Window.agc"
	#include "api/Command_TextBox.agc"
	#include "api/DEFAULTS.agc"
	#include "api/DropMenu.agc"
	#include "api/Gadget_Build.agc"
	#include "api/Gadget_DragEdge.agc"
	#include "api/Gadget_Handel.agc"
	#include "api/Gadget_Scroll.agc"
	#include "api/Gadget_TextBox.agc"
	#include "api/test_GUI.agc"
	#include "api/Command_Camera.agc"
	#include "api/templates.agc"
	#include "api/system.agc"

	API.Gui.vArrow=LoadImage		(api.path+"api/media/smerf_api/"+"varrow.png")
	API.Gui.hArrow=LoadImage		(api.path+"api/media/smerf_api/"+"harrow.png")
	API.Gui.Button=LoadImage		(api.path+"api/media/smerf_api/"+"btn.png")
	API.Gui.folder=LoadImage		(api.path+"api/media/smerf_api/"+"folder.png")
	API.Gui.background=LoadImage	(api.path+"api/media/smerf_api/"+"bg.png")
	API.Gui.SlideBar=LoadImage	(api.path+"api/media/smerf_api/"+"SlideBar.png")
	API.Gui.SlideBTN=LoadImage	(api.path+"api/media/smerf_api/"+"SlideButton.png")
	API.Gui.input=LoadImage		(api.path+"api/media/smerf_api/"+"input.png")
	API.Gui.edit=LoadImage		(api.path+"api/media/smerf_api/"+"editbox.png")
	API.Gui.checkbox=LoadImage	(api.path+"api/media/smerf_api/"+"checkbox.png")

	API.path="raw:"+getreadpath()+"media/"
	API.GlobalGadgetNum =100
	API.Active=-1
	API.MouseVisibleBool=1
	API.Mouse.Clickspeed=.2
	resolution(1)
	sync()
	LoadColors()
	api.disable.clipping=0
	api.disable.DragBody=0
	api.disable.DragDrop=0
	api.disable.DragEdge=0
	api.disable.Relative=0

endfunction
type Toolbars
	`Entity as integer
	RightPane as integer
	LeftPane as integer
endtype

global toolbars

type APIType
	CursorPosx as Integer
	CursorPosY as integer
	ColorPicker as Colorpickertype
	camImage1 as integer
	camImage2 as integer
	CamImage3 as integer
	camimage4 as integer
	Color as ColorType
	Gadget as GadgetType []
	PATH as string
	Gui as ApiGUI
	Keypress as integer
	stopEdgeDrag as float
	ButtonPressed as integer
	legacyID as integer
	DragBody as integer
	DragEdge as integer
	MouseVisibleBool as integer
	Active as integer
	hoverActive as integer
	CursorSprite as integer
	GlobalGadgetNum as integer
	WinWidth as integer
	WinHeight as integer
	SpriteHit as integer
	Mouse as Mousetype
	MainMenu as MainMenuType
	group as grouptype []
	Cam as CameraType [3]
	Template as TemplateType
	PersistantButtonPress as integer
	Disable as DisableType
endtype
global API as APIType

type GroupType
	members as integer[]
	Kind as string
endtype


type ReturnType
	order as integer []
	Integers as integer[]
	strings as string[]
endtype

Type DisableType
	clipping as Integer
	DragDrop as integer
	DragEdge as Integer
	DragBody as Integer
	Relative as integer	
endtype

    
function Ret(t as returnType)
endfunction



type ApiGui //Media
	background as integer //media
	SlideBar as integer//media
	SlideBTN as integer
	folder as integer //media
	Button as integer //media
	vArrow as integer //media
	hArrow as integer //media
	input as integer `gui image
	edit as integer
	Slider as integer
	SliderBar as integer
	checkbox as integer
endtype

global bool as integer

`integrated check for issues
type MainMenuType
	oldHeight as integer
	oldWidth as integer
	fontSize as integer
	HighlighterIID as integer
	HighlighterSID as integer
	Clicked as integer//can replace with whatever u want to for Clicked funtion
	ActiveChild as integer
	TextHeight as integer
	TextWidth as integer
	Size as integer
endtype


type CameraType
	GadgetID as integer
	clearColor as integer
	State as integer
	PosX as Float
	PosY as Float
	PosZ as Float
	RotX as Float
	RotY as Float
	RotZ as Float
endtype


global Mousetype
type Mousetype
	Clickspeed as float
	Clicked as integer
	X as integer
	Y as integer
	oldX as integer
	oldY as integer
	MX as integer
	MY as integer
	StartLeftDown as integer
	sliding as integer
	DownTarget as integer
	LeftState as integer
	leftDownTimer as float
	lUpTimer as float
	Draghover as integer
	Drag as integer
endtype


function GetPointerMoveY()
	Local ret as float
	ret=API.Mouse.MY
endfunction ret


function GetPointerMoveX()
	Local ret as float
	ret=API.Mouse.MX
endfunction ret


Function resolution(flag as integer)
	h=GetWindowHeight()
	w=GetWindowWidth()
	If API.WinHeight<>h or API.WinWidth <> w
		API.WinHeight=h
		API.WinWidth=w
		SetVirtualResolution(API.WinWidth,API.WinHeight)
		DrawToolbarBackground()
	Endif
endFunction



function RUN_API()`RUN RUN RUN RUN
	GetButtonPress()
	API.Mouse.x=getpointerx()
	API.Mouse.y=getpointery()
	resolution(0)
	RunTextBox()
	RunSlider()
	RunMouse()
	RunMenu()
	RunTemplates()
	If API.Gadget.Length >-1
		runGadgets()
	Endif
	if GetRawMouseLeftState()=0
		API.Dragedge=0
		API.Dragbody=0
		API.Mouse.Drag=0
	endif
endfunction



function ApiSync()
	API.ButtonPressed=-1
	api.mouse.clicked=-1
	resolution(0)
	sync()
endfunction


function DeleteGadget(ID)
	id=getid(id)
	if ID <= API.Gadget.Length  and ID >-1
		for i =0 to api.gadget[id].children.length
			child=getid(api.gadget[id].children[i] )
			if getspriteexists(api.gadget[child].SpriteID)  then DeleteSprite(api.gadget[child].SpriteID)
			if getimageexists(api.gadget[child].ImageID) then Deleteimage(api.gadget[child].ImageID)
			api.gadget.remove(child)
		next
		if getSpriteExists(API.Gadget[ID].SpriteID) then deletesprite(API.Gadget[ID].SpriteID)
		if getimageexists(API.Gadget[ID].ImageID) then DeleteImage(API.Gadget[ID].ImageID)
		API.Gadget.remove(ID)
		if api.active=id then api.active=-1
	endif
endfunction


function Exception(error as string)
endfunction
