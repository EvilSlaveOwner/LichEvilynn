Scriptname EL_Movement extends Quest 

EL_Movement Function Get() Global
	return Game.GetFormFromFile(0x051244ED, "LichEvilynn.esp") as EL_Movement
endfunction


bool function AliasJumpDirectlyTo(ReferenceAlias theAlias, ReferenceAlias toAlias, float xOffest = 0.0, float yOffset = 0.0, float zOffset = 0.0, bool matchRotation = true) Global
	if theAlias == none || toAlias == none
		EL_Utility.Log("Missing ReferenceAlias.", "EL_Movement")
		return false
	endif
	return JumpDirectlyTo(theAlias.GetReference(), toAlias.GetReference(), xOffest, yOffset, zOffset, matchRotation)
endfunction

bool function JumpDirectlyTo(ObjectReference theObject, ObjectReference toObject, float xOffest = 0.0, float yOffset = 0.0, float zOffset = 0.0, bool matchRotation = true) Global
	if theObject == none || toObject == none
		EL_Utility.Log("Missing ObjectReference.", "EL_Movement")
		return false
	endif
	EL_Utility.Log("Placing ObjectReference at x/y/z " + toObject.GetPositionX() + "/" + toObject.GetPositionY() + "/" + toObject.GetPositionZ(), "EL_Movement")
	theObject.SetPosition(toObject.GetPositionX(), toObject.GetPositionY(), toObject.GetPositionZ())
	if matchRotation
		EL_Utility.Log("Placing ObjectReference at angle x/y/z " + toObject.GetAngleX() + "/" + toObject.GetAngleY() + "/" + toObject.GetAngleZ(), "EL_Movement")
		theObject.SetAngle(toObject.GetAngleX(), toObject.GetAngleY(), toObject.GetAngleZ())
	endif
	Utility.Wait(0.3)
	EL_Utility.Log("ObjectReference is at x/y/z " + theObject.GetPositionX() + "/" + theObject.GetPositionY() + "/" + theObject.GetPositionZ(), "EL_Movement")
	return true
endfunction

bool function AliasMoveDirectlyTo(ReferenceAlias theAlias, ReferenceAlias toAlias, float xOffest = 0.0, float yOffset = 0.0, float zOffset = 0.0, bool matchRotation = true) Global
	if theAlias == none || toAlias == none
		EL_Utility.Log("Missing ReferenceAlias.", "EL_Movement")
		return false
	endif
	return MoveDirectlyTo(theAlias.GetReference(), toAlias.GetReference(), xOffest, yOffset, zOffset, matchRotation)
endfunction

bool function MoveDirectlyTo(ObjectReference theObject, ObjectReference toObject, float xOffest = 0.0, float yOffset = 0.0, float zOffset = 0.0, bool matchRotation = true) Global
	if theObject == none || toObject == none
		EL_Utility.Log("Missing ObjectReference.", "EL_Movement")
		return false
	endif
	theObject.MoveTo(toObject, xOffest, yOffset, zOffset, matchRotation)
	return true
endfunction

function RotateToFace(ObjectReference theObject, ObjectReference toObject, float speed = 0.0, float rotationSpeed = 25.0) Global
	float zOffset = theObject.GetHeadingAngle(toObject)
	EL_Utility.Log("RotateToFace - zOffset: " + zOffset, "EL_Movement")
	if speed == 0.0
		EL_Utility.Log("RotateToFace - hard SetAngle" , "EL_Movement")
		theObject.SetAngle(theObject.GetAngleX(), theObject.GetAngleY(), theObject.GetAngleZ() + zOffset)
		return
	endif
	EL_Utility.Log("RotateToFace - TranslateTo" , "EL_Movement")
	theObject.TranslateTo(theObject.GetPositionX() - 0.5, theObject.GetPositionY() - 0.5, theObject.GetPositionZ(), theObject.GetAngleX(), theObject.GetAngleY(), theObject.GetAngleZ() + zOffset, speed, rotationSpeed)
	;theObject.SetAngle(theObject.GetAngleX(), theObject.GetAngleY(), theObject.GetAngleZ() + zOffset)
	;int steps = 10
	;int currentStep = 0
	;float startZ = theObject.GetAngleZ()
	;float stepSize = zOffset / steps
	;while currentStep < steps
;		currentStep = currentStep + 1
;		theObject.SetAngle(theObject.GetAngleX(), theObject.GetAngleY(), startZ + (stepSize * currentStep))
;		Utility.Wait(0.1)
;	endwhile
	
endfunction