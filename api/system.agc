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

