Scriptname EL_Possessed extends Quest  

EL_Possessed Function GetApi() Global
	return Game.GetFormFromFile(0x050A92A1, "LichEvilynn.esp") as EL_Possessed
endfunction

function SetPossessed(actor victim)
	if victim == None
		EL_Utility.Log("Actor SetPossessed(none) callled.", "EL_Possessed")
		ClearPosession(victim)
		return
	endif
	if IsPosessed(victim)
		EL_Utility.Log("Actor already possessed.", "EL_Possessed")
		return
	endif
	EL_Utility.Log("Setting actor posessed.", "EL_Possessed")
	EL_IsPossessing.SetValue(1)
	Utility.Wait(3)
	Possessed.ForceRefTo(victim as ObjectReference)
	;EL().Disable(true)
endfunction

function ClearPosession(Actor victim, ObjectReference PlaceAt = none)
	EL_Utility.Log("Clearing possessed actor.", "EL_Possessed")
	;if PlaceAt == none
	;	PlaceAt = CurrentVictim()
	;endif
	;EL().Enable(true)
	;EL().MoveTo(PlaceAt, abMatchRotation = true)
	;EL().setAlpha(ghostAlpha, true)
	EL_IsPossessing.SetValue(0)
	Possessed.Clear()
endfunction

actor function CurrentVictim()
	return Possessed.GetActorReference()
endfunction

bool function IsPosessed(actor victim)
	return victim == CurrentVictim()
endfunction

bool function IsPlayerPosessed()
	return PlayerRef == CurrentVictim()
endfunction

ReferenceAlias Property Possessed  Auto  
Actor Property PlayerRef Auto
GlobalVariable Property EL_IsPossessing  Auto 
