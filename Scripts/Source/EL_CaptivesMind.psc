Scriptname EL_CaptivesMind extends Quest  

bool initalized = false
event OnInit()
	Initialize()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_CaptivesMind")
endevent

function OnGameLoad()
	if initalized == false
		Initialize()
	endif
endfunction

function Initialize()
	initalized = true
endfunction

function Maintenance()
endfunction

function Capture(Actor theCaptive)
endfunction