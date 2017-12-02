Scriptname EL_DebugLever1 extends ObjectReference  

bool property isInPullPosition = True Auto

event OnLoad()
	SetDefaultState()
endevent

event OnReset()
	SetDefaultState()
endevent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
function SetDefaultState()
	if (isInPullPosition)
		playAnimation("FullPull")
		gotoState("pulledPosition")
	else
		playAnimation("FullPush")
		gotoState("pushedPosition")
	endif
endfunction


Auto state pulledPosition
	event onActivate (objectReference triggerRef)
		gotoState ("busy")
		isInPullPosition = False
		playAnimationandWait("FullPush","FullPushedUp")
		gotoState("pushedPosition")
		EL_LairDebug.GetApi().ToggleDebugLever1()
	endevent
endstate

state pushedPosition
	event onActivate (objectReference triggerRef)
		gotoState ("busy")
		isInPullPosition = True
		playAnimationandWait("FullPull","FullPulledDown")
		gotoState("pulledPosition")
		EL_LairDebug.GetApi().ToggleDebugLever1()
	endevent
endstate

state busy
	; This is the state when I'm busy animating
		event onActivate (objectReference triggerRef)
			;do nothing
		endevent
endstate
