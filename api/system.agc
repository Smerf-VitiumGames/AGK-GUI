// File: system.agc
// Created: 22-11-26


function PrintT(stringvar as string)
	print(stringvar)
	sync()
	sleep(4000)
endfunction


function Error(msg as string,Value)
	`1 notify `2 terminate
	ErrorMessage$=Msg
	if Value=2
		end
	endif
endfunction


function nextPowerof2(n)
    if isPowerof2(n+1)=0
        exitfunction nextPowerof2(n+1)
    endif  
endfunction n+1
 
function isPowerof2(n)
   //condition to check whether number is power of two or not
   //performing bitwise operation
   if(n <> 0) and ((n &&(n - 1)) = 0)
      exitfunction 1
   else
      exitfunction 0
   endif
endfunction 1


type colorpickertype
	red as integer
	green as integer
	blue as integer
	alpha as integer
endtype



Function pickColor(X,Y)
	render()
    tImage=getImage(x,y,1,1)
    tMemblock=CreateMemblockfromImage(tImage)
    api.colorPicker.red=GetMemblockbyte(tMemblock,12)
    api.colorPicker.green=GetMemblockbyte(tMemblock,13)
    api.colorPicker.blue=GetMemblockbyte(tMemblock,14)
   	api.colorPicker.alpha=GetMemblockbyte(tMemblock,15)

    deletememblock(tMemblock)
    deleteimage(tImage)
    clearscreen()
endfunction 

function GetPickedColorRed()
	Local ret as integer
	ret=api.colorPicker.red
endfunction ret

function GetPickedColorGreen()
	Local ret as integer
	ret=api.colorPicker.green
endfunction ret

function GetPickedColorBlue()
	Local ret as integer
	ret=api.colorPicker.blue
endfunction ret

function GetPickedColorAlpha()
	Local ret as integer
	ret=api.colorPicker.Alpha
endfunction ret

function GetPickedColor()
	Local ret as integer
	ret=makecolor(api.colorPicker.red,api.colorPicker.green,api.colorPicker.blue,api.colorPicker.alpha)
endfunction ret

function EnableDebugMessages(bool)
endfunction



