Scriptname EL_LairEntranceTriggerScript extends ObjectReference  

event OnTriggerEnter(ObjectReference akActionRef)
	Actor theActor = (akActionRef as Actor)
	EL_Captive captive = EL_Captives.GetCaptiveScript(theActor)
	if captive == none || captive.TrappedInLair == false
		return
	endif
	EL_LairStopExit.Get().SetVictim(theActor)
endevent

Faction Property EL_CaptiveInLair  Auto            
