Scriptname EL_CaptivesSexLab extends Quest  

EL_CaptivesSexLab function Get() Global
	return Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptivesSexLab
endfunction

bool initalized = false

event OnInit()
	Initialize()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_CaptivesSexLab")
endevent

event OnSexEnd(Form FormRef, int tid)
	Actor theCaptive = FormRef as Actor
	EL_Captive elCaptive = Captives.RunGetCaptiveScript(theCaptive)
	if elCaptive == none
		return
	endif
	elCaptive.OnSexEnd(tid)
endevent

event OnSexStart(Form FormRef, int tid)
	Actor theCaptive = FormRef as Actor
	EL_Captive elCaptive = Captives.RunGetCaptiveScript(theCaptive)
	if elCaptive == none
		return
	endif
	elCaptive.OnSexStart(tid)
endevent

function OnGameLoad()
	RegisterForModEvent("CaptiveSex_Start", "OnSexStart")
	RegisterForModEvent("CaptiveSex_End", "OnSexEnd")
	if initalized == false
		Initialize()
	endif
endfunction

Function Maintenance()
endfunction

function Initialize()
	initalized = true
	Captives = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_Captives
endfunction

function Capture(Actor theCaptive)
	SexLabUtil.GetAPI().TrackActor(theCaptive, "CaptiveSex")
endfunction

EL_Captives Captives
