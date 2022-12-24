
// Project: LevelEdit 
// Created: 22-11-26

// show all errors

SetErrorMode(2)

// set window properties
SetWindowTitle( "LevelEdit" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 3000, 1 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 )
setcamerarange(1,.1,1000)
SetGenerateMipmaps(1)
setAntialiasMode(4)
SetAmbientColor(128,128,128)
SetClearColor(64,64,64)
setsunactive(1)
`SetGlobal3DDepth(2000)
SetCameraPosition(1,0,0,-4)
SetCameraRotation(1,0,0,0)
sync()









#include "api/Init_Main.agc"
INIT_API()



`try these guis out!
load_gui_1()
`load_gui_2()







global colorpicker as colorpickertype



do

`print(colorpicker.red)

RUN_API()
Rungui1()



  ApiSync()
loop










	
	

	
