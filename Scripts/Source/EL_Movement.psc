Scriptname EL_Movement extends Quest 

EL_Movement Function Get() Global
	return Game.GetFormFromFile(0x051244ED, "LichEvilynn.esp") as EL_Movement
endfunction


bool function AliasJumpDirectlyTo(ReferenceAlias theAlias, ReferenceAlias toAlias) Global
	if theAlias == none || toAlias == none
		EL_Utility.Log("Missing ReferenceAlias.", "EL_Movement")
		return false
	endif
	return JumpDirectlyTo(theAlias.GetReference(), toAlias.GetReference())
endfunction

bool function JumpDirectlyTo(ObjectReference theObject, ObjectReference toObject) Global
	if theObject == none || toObject == none
		EL_Utility.Log("Missing ObjectReference.", "EL_Movement")
		return false
	endif
	theObject.SetPosition(toObject.GetPositionX(), toObject.GetPositionY(), toObject.GetPositionZ())
	theObject.SetAngle(toObject.GetAngleX(), toObject.GetAngleY(), toObject.GetAngleZ())
	return true
endfunction
