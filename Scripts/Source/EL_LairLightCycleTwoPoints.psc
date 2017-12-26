Scriptname EL_LairLightCycleTwoPoints extends ReferenceAlias  

event OnInit()
	SetToPosition()
	Utility.Wait(0.2)
	MoveToNext()
	RegisterForSingleUpdate(5)
endevent

event OnUpdate()
	if IsInPosition() == false
		SetToPosition()
	endif
endevent

event OnTranslationFailed()
	SetToPosition()
	RegisterForSingleUpdate(0.2)
endevent

event OnTranslationComplete()
	RegisterForSingleUpdate(0.1)
endevent

bool function IsInPosition()
	if (afX[movingTo] - theLight.GetPositionX()) < 1
		return false
	endif
	if (afY[movingTo] - theLight.GetPositionY()) < 1
		return false
	endif
	if (afZ[movingTo] - theLight.GetPositionZ()) < 1
		return false
	endif
	return false
endfunction

function SetToPosition()
	theLight.SetPosition(afX[movingTo], afY[movingTo], afZ[movingTo])
	theLight.SetAngle(afAngleX[movingTo], afAngleY[movingTo], afAngleZ[movingTo])
endfunction

function MoveToNext()
	movingTo += 1
	if movingTo >= afX.length
		movingTo = 0
	endif
	theLight.SplineTranslateTo(afX[movingTo], afY[movingTo], afZ[movingTo], afAngleX[movingTo], afAngleY[movingTo], afAngleZ[movingTo], afTangentMagnitude[movingTo], afSpeed[movingTo])
endfunction

int movingTo = 0
ObjectReference Property theLight Auto
float[] Property afX Auto
float[] Property afY Auto
float[] Property afZ Auto
float[] Property afAngleX Auto
float[] Property afAngleY Auto
float[] Property afAngleZ Auto
float[] Property afTangentMagnitude Auto
float[] Property afSpeed Auto

