Scriptname EL_OnGameLoad extends Quest

EL_OnGameLoad function Get() Global
	return Game.GetFormFromFile(0x060AF035, "LichEvilynn.esp") as EL_OnGameLoad
endfunction

Event OnInit()
	CheckForUpdates()
	Maintenance()
EndEvent
 
Function Maintenance()
	EL_Utility.Log("Maintenance started", "EL_OnGameLoad")
	EL_SexLabUtil.Get().OnGameLoad()
	EL_Captives.Get().OnGameLoad()
	EL_Utility.Log("Maintenance stopped", "EL_OnGameLoad")
endfunction
 
Function CheckForUpdates()
	if major == 0 && minor == 2
		return
	endif
	If major && minor
		EL_Utility.Log("Updating from version " + major + "." + minor, "EL_OnGameLoad")
		Update(major, minor)
	Else
		EL_Utility.Log("Initializing for the first time.", "EL_OnGameLoad")
		Initialize()
	EndIf
	major = 0
	minor = 2
EndFunction

; run once ever
function Initialize()
	
endfunction

function Update(int major, int minor)
	if major == 0 && minor == 1
		UpdateFrom0dot1(major, minor)
	endif
endfunction

function UpdateFrom0dot1(int major, int minor)
	EL_Captives.Get().InitializeVariables()
endfunction


int Property major Auto
int Property minor Auto