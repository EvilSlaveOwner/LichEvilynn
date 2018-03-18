Scriptname EL_LockActorEffect extends activemagiceffect  

Event OnEffectStart(Actor Target, Actor Caster)
	if Target == none
		return
	endif
	Target.SetRestrained()
EndEvent


Event OnEffectFinish(Actor Target, Actor Caster)
	if Target == none
		return
	endif
	Target.SetRestrained(false)
EndEvent


;Actor victim