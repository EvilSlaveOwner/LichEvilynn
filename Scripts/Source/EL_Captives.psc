Scriptname EL_Captives extends Quest  

; Fetch Captives
EL_Captives function Get() Global
	return Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_Captives
endfunction

ReferenceAlias[] captives
event OnInit()
	InitializeVariables()
endevent

function InitializeVariables()
	captives = new ReferenceAlias[2]
	captives[0] = Captive01
	captives[1] = Captive02
endfunction

function Capture(Actor theCaptive)
	InitialCaptiveSetup(theCaptive)
endfunction

function InitialCaptiveSetup(Actor theCaptive)
	int iSlot = GetOpenSlot()
	if iSlot == -1
		return
	endif
	captives[iSlot].ForceRefTo(theCaptive)
	theCaptive.SetFactionRank(EL_IsCaptive, 1)
	theCaptive.SetFactionRank(EL_CaptiveInLair, 1)
	EL_Utility.Log("Captured " + theCaptive.GetLeveledActorBase().GetName() , "EL_Captives")
endfunction

int function GetOpenSlot()
	int iCaptives = captives.length
	int iIndex = 0
	ObjectReference theCaptive = none
	while iIndex < iCaptives
		theCaptive = captives[iIndex].GetReference()
		if theCaptive == none
			return iIndex
		endif
		iIndex += 1
	endwhile
	EL_Utility.Log("Error - No open captive slots.", "EL_Captives")
	return -1
endfunction


ReferenceAlias Property Captive01  Auto
ReferenceAlias Property Captive02  Auto
Faction Property EL_CaptiveInLair  Auto
Faction Property EL_IsCaptive  Auto
