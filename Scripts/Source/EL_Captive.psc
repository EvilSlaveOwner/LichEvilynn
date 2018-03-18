Scriptname EL_Captive extends ReferenceAlias

event OnInit()
	Initialize()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_Captive")
endevent

function Initialize()
	Tats = ((self as ReferenceAlias) as EL_CaptiveTats)
	Mind = ((self as ReferenceAlias) as EL_CaptiveMind)
	Audio = ((self as ReferenceAlias) as EL_CaptiveAudio)
endfunction

bool function Capture(Actor theCaptive, bool trapped)
	if ForceRefIfEmpty(theCaptive) == false
		return false
	endif
	TrappedInLair = trapped
	Tats.Capture()
	Mind.Capture()
	Audio.Capture()
	return true
endfunction

bool function IsFilled()
	return GetReference() != none
endfunction

function Maintenance()
	CaptiveMaintenance()
	Tats.Maintenance()
	Mind.Maintenance()
	Audio.Maintenance()
endfunction

function CaptiveMaintenance()
	
endfunction

function OnSexStart(int tid)
	OnAdvanceQuestOnSexStart(tid)
endfunction

function OnSexEnd(int tid)
	OnAdvanceQuestOnSexEnd(tid)
endfunction

function OnAdvanceQuestOnSexStart(int tid)
	Actor theCaptive = GetActorRef()
	if AdvQuestOnSexStart == none
		return
	endif
	AdvQuestOnSexStart.SetStage(AdvQuestOnSexStartStage)
	AdvQuestOnSexStart = none
	AdvQuestOnSexStartStage = -1
endfunction

function OnAdvanceQuestOnSexEnd(int tid)
	Actor theCaptive = GetActorRef()
	if AdvQuestOnSexEnd == none
		return
	endif
	AdvQuestOnSexEnd.SetStage(AdvQuestOnSexEndStage)
	AdvQuestOnSexEnd = none
	AdvQuestOnSexEndStage = -1
endfunction

function SetAvanceQuestOnStart(Quest theQuest, int theStage)
	AdvQuestOnSexStart = theQuest
	AdvQuestOnSexStartStage = theStage
endfunction

function SetAvanceQuestOnEnd(Quest theQuest, int theStage)
	AdvQuestOnSexEnd = theQuest
	AdvQuestOnSexEndStage = theStage
endfunction

bool property TrappedInLair = false auto hidden
Quest AdvQuestOnSexStart = none
int AdvQuestOnSexStartStage = -1
Quest AdvQuestOnSexEnd = none
int AdvQuestOnSexEndStage = -1
EL_CaptiveTats Tats
EL_CaptiveMind Mind
EL_CaptiveAudio Audio
