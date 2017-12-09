Scriptname EL_ToggleLinkedVisibilityOnSpellHit extends ObjectReference  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akAggressor != PlayerREF
		Return
	EndIf
	Spell akSpell = akSource as Spell 
	If akSpell == None
		Return
	EndIf
	int changeTo = 0
	If akSpell == ShowSpell
		changeTo = 1;
	EndIf
	ToggleVisibilityOfLinkedItem(changeTo)
	
	If enableDuration > 0
		RegisterForSingleUpdate(enableDuration)
	EndIf
EndEvent

Event OnUpdate()
    ToggleVisibilityOfLinkedItem(0)
endEvent

Function ToggleVisibilityOfLinkedItem(int disableObject)
	If disableObject == 1
		EL_LairPhaseStatus.SetValue(1.0)
		objectToToggle.Enable()
	Else
		EL_LairPhaseStatus.SetValue(0.0)
		objectToToggle.Disable()
	EndIf
EndFunction

float Property enableDuration Auto
Actor Property PlayerREF Auto
ObjectReference Property objectToToggle Auto
Spell Property ShowSpell Auto
Spell Property HideSpell Auto
GlobalVariable Property EL_LairPhaseStatus Auto
