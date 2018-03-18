Scriptname EL_Captive extends EL_CaptiveMind

bool function Capture(Actor theCaptive)
	if ForceRefIfEmpty(theCaptive) == false
		return false
	endif
	return true
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

Quest AdvQuestOnSexStart = none
int AdvQuestOnSexStartStage = -1
Quest AdvQuestOnSexEnd = none
int AdvQuestOnSexEndStage = -1