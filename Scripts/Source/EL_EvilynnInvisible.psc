Scriptname EL_EvilynnInvisible extends Quest  

EL_EvilynnInvisible function Get() Global
	return Game.GetFormFromFile(0x0516799A, "LichEvilynn.esp") as EL_EvilynnInvisible
endfunction

actor function GetEvilynn(ReferenceAlias theTarget) Global
	return EL_EvilynnInvisible.Get().RunGetEvilynn(theTarget)
endfunction

function DeleteEvilynn() Global
	EL_EvilynnInvisible.Get().RunDeleteEvilynn()
endfunction

actor function RunGetEvilynn(ReferenceAlias theTarget)
	if Evilynn == none
		EL_Utility.Log("Creating invisible Evilynn.", "EL_EvilynnInvisible")
		Evilynn = theTarget.GetRef().PlaceAtMe(EL_EvilynnInvisibleBase, 1, false, true) as Actor
	endif
	if Evilynn == none
		EL_Utility.Log("Failed to create invisible Evilynn.", "EL_EvilynnInvisible")
		return none
	endif
	EL_Utility.Log("Moving invisible Evilynn, with 50 offest.", "EL_EvilynnInvisible")
	Evilynn.MoveTo(theTarget.GetRef(), 50.0, 50.0, 0.0)
	if Evilynn.IsDisabled()
		Evilynn.Enable()
		Utility.Wait(0.2)
	endif
	if FinishedFalling(theTarget)
		return Evilynn
	endif
	EL_Utility.Log("Trying again, no offset, 100 units higher.", "EL_EvilynnInvisible")
	Evilynn.MoveTo(theTarget.GetRef(), 0.0, 0.0, 100.0)
	if FinishedFalling(theTarget)
		return Evilynn
	endif
	EL_Utility.Log("Trying again, from 100 units higher, and offset the other way", "EL_EvilynnInvisible")
	Evilynn.MoveTo(theTarget.GetRef(), -50.0, -50.0, 100.0)
	if FinishedFalling(theTarget)
		return Evilynn
	endif
	EL_Utility.Log("Failed, just returning what we have", "EL_EvilynnInvisible")
	return Evilynn
endfunction

bool function FinishedFalling(ReferenceAlias theTarget)
	if Evilynn == none
		EL_Utility.Log("Cant check to see if none is falling, recreating at actor", "EL_EvilynnInvisible")
		Evilynn = theTarget.GetRef().PlaceAtMe(EL_EvilynnInvisibleBase, 1, false, true) as Actor
		Evilynn .Enable()
		Utility.Wait(0.3)
	endif
	int loops = 0
	float lastZ
	float currentZ = Evilynn.GetPositionZ()
	while (lastZ as int) != (currentZ as int) && loops < 4
		Utility.Wait(0.2)
		lastZ = currentZ
		currentZ = Evilynn.GetPositionZ()
		loops += 1
	endwhile
	if loops < 4
		return true
	endif
	EL_Utility.Log("Evilynn is still falling.", "EL_EvilynnInvisible")
	return false
endfunction

function RunDeleteEvilynn()
	; not creating persistant objects anyway.
	;EL_Utility.Log("Deleting invisible Evilynn.", "EL_EvilynnInvisible")
	;if Evilynn == none
	;	return
	;endif
	;Evilynn.DisableNoWait()
	;Evilynn.DeleteWhenAble()
	;Evilynn = none
endfunction

actor Evilynn
ActorBase Property EL_EvilynnInvisibleBase  Auto  