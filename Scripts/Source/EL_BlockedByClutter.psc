Scriptname EL_BlockedByClutter extends ObjectReference

bool property blocked = true auto hidden
bool property busy = false auto hidden
sound property barredSFX auto

objectReference blockingClutter

EVENT onCellLoad()
	blockingClutter = getLinkedRef()
endEVENT

EVENT onActivate(objectReference actronaut)
	if busy == TRUE
		return
	endif
	blocked = blockingClutter.IsEnabled()
	if blocked == true
		barredSFX.play(self)
		return
	endif
	
	if getState() == "busy"
		return
	endif

	SetOpen(!isOpen)
endEVENT
	
