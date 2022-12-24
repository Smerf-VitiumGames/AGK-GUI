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

