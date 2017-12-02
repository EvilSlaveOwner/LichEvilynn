Scriptname EL_Possessed extends Quest  

EL_Possessed Function GetApi() Global
	return Game.GetFormFromFile(0x050A92A1, "LichEvilynn.esp") as EL_Possessed
endfunction

function SetPossessed(actor victim)
	if victim == None
		EL_Utility.Log("Clearing possessed actor.", "EL_Possessed")
		Possessed.Clear()
		Evilynn.GetActorReference().Enable(true)
	else
		Evilynn.GetActorReference().Disable(true)
		if IsPosessed(victim)
			EL_Utility.Log("Actor already possessed.", "EL_Possessed")
			return
		endif
		EL_Utility.Log("Setting actor posessed.", "EL_Possessed")
		Possessed.ForceRefTo(victim as ObjectReference)
	endif
endfunction

bool function IsPosessed(actor victim)
	return victim == Possessed.GetActorReference()
endfunction

bool function IsPlayerPosessed()
	return PlayerRef == Possessed.GetActorReference()
endfunction

ReferenceAlias Property Possessed  Auto  
Actor Property PlayerRef Auto
ReferenceAlias Property Evilynn  Auto  
