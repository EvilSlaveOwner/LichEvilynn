Scriptname EL_AdvanceQuestOnBeating extends ObjectReference  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akAggressor != Game.GetPlayer())
		return
	endif
	if (RequiredStage > -1)
		if (TheQuest.GetStage() == RequiredStage)
				TheQuest.SetStage(NewStage)
		endif
	else
		TheQuest.SetStage(NewStage)
	endif
EndEvent
 
Quest Property TheQuest  Auto
Int Property NewStage  Auto
Int Property RequiredStage Auto