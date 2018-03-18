Scriptname EL_Captives extends Quest  

bool initalized = false
EL_CaptivesTats property Tats auto hidden
EL_CaptivesMind property Mind auto hidden
EL_CaptivesAudio property Audio auto hidden
EL_CaptivesSexLab property SexLab auto hidden

EL_Captives function Get() Global
	return Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_Captives
endfunction

bool function Capture(Actor theCaptive, bool TrappedInLair = true) Global
	return Get().InitialCapture(theCaptive, TrappedInLair)
endfunction

ReferenceAlias function FindActorSlot(Actor theCaptive) Global
	return Get().RunFindActorSlot(theCaptive)
endfunction

EL_Captive function GetCaptiveScript(Actor theCaptive) Global
	return Get().RunGetCaptiveScript(theCaptive)
endfunction

ReferenceAlias[] captives
event OnInit()
	Initialize()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_Captives")
	Maintenance()
endevent

function OnGameLoad()
	if initalized == false
		Initialize()
	endif
	SexLab.OnGameLoad()
	Tats.OnGameLoad()
	Mind.OnGameLoad()
	Audio.OnGameLoad()
endfunction

function InitializeCapriveVariables()
	captives = new ReferenceAlias[25]
	captives[0] = Captive01
	captives[1] = Captive02
	captives[2] = Captive03
	captives[3] = Captive04
	captives[4] = Captive05
	captives[5] = Captive06
	captives[6] = Captive07
	captives[7] = Captive08
	captives[8] = Captive09
	captives[9] = Captive10
	captives[10] = Captive11
	captives[11] = Captive12
	captives[12] = Captive13
	captives[13] = Captive14
	captives[14] = Captive15
	captives[15] = Captive16
	captives[16] = Captive17
	captives[17] = Captive18
	captives[18] = Captive19
	captives[19] = Captive20
	captives[20] = Captive21
	captives[21] = Captive22
	captives[22] = Captive23
	captives[23] = Captive24
	captives[24] = Captive25
endfunction


; check captives ever 10 seconds.
; but, limit to maxAtOnce at a time.
int maxAtOnce = 10
int current = 0
Function Maintenance()
	EL_Utility.Log("Maintenance starting at captive " + current, "EL_Captives")
	int i = 0
	int count = captives.length
	while i < maxAtOnce
		if captives[current].GetReference() != none
			(captives[current] as EL_Captive).Maintenance()
		endif
		i = i + 1
		current = current + 1
		if current >= count
			current = 0
		endif
	endwhile
	EL_Utility.Log("Maintenance ending at captive " + current, "EL_Captives")
	RegisterForSingleUpdate(10.0)
endfunction

function Initialize()
	initalized = true
	Tats = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptivesTats
	Mind = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptivesMind
	Audio = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptivesAudio
	SexLab = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptivesSexLab
	InitializeCapriveVariables()
	RegisterForSingleUpdate(10.0)
endfunction

bool function InitialCapture(Actor theCaptive, bool TrappedInLair = true)
	int iSlot = GetOpenSlot()
	if iSlot == -1
		return false
	endif
	int existingSlot = RunFindActorSlotID(theCaptive)
	if existingSlot != -1
		EL_Utility.Log("Error: " + theCaptive.getDisplayname() + " is already a captive.", "EL_Captives")
		return false
	endif
	EL_Captive captive = captives[iSlot] as EL_Captive
	bool success = captive.Capture(theCaptive, TrappedInLair)
	if success == false
		return false
	endif
	theCaptive.SetFactionRank(EL_IsCaptive, 1)
	if (TrappedInLair)
		theCaptive.SetFactionRank(EL_CaptiveTrappedInLair, 1)
	endif
	
	Tats.Capture(theCaptive)
	Mind.Capture(theCaptive)
	Audio.Capture(theCaptive)
	SexLab.Capture(theCaptive)

	EL_Utility.Log("Captured " + theCaptive.GetLeveledActorBase().GetName() , "EL_Captives")
	return true
endfunction

EL_Captive function RunGetCaptiveScript(Actor theCaptive = none)
	return RunFindActorSlot(theCaptive) as EL_Captive
endfunction

ReferenceAlias function RunFindActorSlot(Actor theCaptive)
	int slotID = RunFindActorSlotID(theCaptive)
	if slotID == -1
		return none
	endif
	return captives[slotID]
endfunction

int function RunFindActorSlotID(Actor theCaptive)
	int iCaptives = captives.length
	int iIndex = 0
	ObjectReference theCaptiveObject = theCaptive as ObjectReference
	while iIndex < iCaptives
		if theCaptiveObject == captives[iIndex].GetReference()
			return iIndex
		endif
		iIndex += 1
	endwhile
	return -1
endfunction

int function GetOpenSlot()
	int iCaptives = captives.length
	int iIndex = 0
	while iIndex < iCaptives
		if captives[iIndex].GetReference() == none
			return iIndex
		endif
		iIndex += 1
	endwhile
	EL_Utility.Log("Error - No open captive slots.", "EL_Captives")
	return -1
endfunction


ReferenceAlias Property Captive01  Auto
ReferenceAlias Property Captive02  Auto
ReferenceAlias Property Captive03  Auto
ReferenceAlias Property Captive04  Auto
ReferenceAlias Property Captive05  Auto
ReferenceAlias Property Captive06  Auto
ReferenceAlias Property Captive07  Auto
ReferenceAlias Property Captive08  Auto
ReferenceAlias Property Captive09  Auto
ReferenceAlias Property Captive10  Auto
ReferenceAlias Property Captive11  Auto
ReferenceAlias Property Captive12  Auto
ReferenceAlias Property Captive13  Auto
ReferenceAlias Property Captive14  Auto
ReferenceAlias Property Captive15  Auto
ReferenceAlias Property Captive16  Auto
ReferenceAlias Property Captive17  Auto
ReferenceAlias Property Captive18  Auto
ReferenceAlias Property Captive19  Auto
ReferenceAlias Property Captive20  Auto
ReferenceAlias Property Captive21  Auto
ReferenceAlias Property Captive22  Auto
ReferenceAlias Property Captive23  Auto
ReferenceAlias Property Captive24  Auto
ReferenceAlias Property Captive25  Auto

Faction Property EL_CaptiveTrappedInLair  Auto
Faction Property EL_IsCaptive  Auto

