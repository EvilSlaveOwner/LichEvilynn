Scriptname EL_LairEntranceTriggerScript extends ObjectReference  

event OnTriggerEnter(ObjectReference akActionRef)
	Actor theActor = (akActionRef as Actor)
	if theActor.GetFactionRank(EL_CaptiveInLair) <= 0
		return
	endif
	EL_LairStopExit.Get().SetVictim(theActor)
endevent

Faction Property EL_CaptiveInLair  Auto            
