Scriptname EL_CaptivesAudio extends Quest  

bool initalized = false
event OnInit()
	Initialize()
endevent

function Initialize()
	initalized = true
endfunction

function Maintenance()
endfunction

function OnGameLoad()
	if initalized == false
		Initialize()
	endif
endfunction

function Capture(Actor theCaptive)
endfunction