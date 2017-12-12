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
