Scriptname EL_ActivateToToggleEnabledItem extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == PlayerRef
		If isDisabled == 0
			objectToToggle.Enable()
			isDisabled = 1
		Else
			objectToToggle.Disable()
			isDisabled = 0
		EndIf
	EndIf
EndEvent

int Property isDisabled  Auto
Actor Property PlayerRef Auto
ObjectReference Property objectToToggle Auto