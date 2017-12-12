Scriptname EL_PhaseLairForceEffect extends activemagiceffect  

event OnEffectStart(Actor Target, Actor Caster)
	EL_Utility.Log("Phasing controller called.", "EL_PhaseLairForceEffect")
	EL_LairPhaseController.Get().PhaseIn()
endevent
