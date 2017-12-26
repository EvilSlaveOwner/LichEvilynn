Scriptname EL_MCVisualsTargetScript extends ActiveMagicEffect  

event OnEffectStart(Actor Target, Actor Caster)
	if Target == none
		return
	endif
	Target.SetFactionRank(EL_IsMindControlled, 1)
	EL_Utility.Log("Mind controlling " + Target.GetActorBase().GetName(), "EL_MCVisualsTargetScript")
endevent

Faction Property EL_IsMindControlled  Auto
