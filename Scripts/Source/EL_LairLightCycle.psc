Scriptname EL_LairLightCycle extends ObjectReference  

event OnInit()
	EL_Utility.Log("Light on init.", "EL_LairLightCycle")
	LightSpell = Game.GetFormFromFile(0x05181FC3, "LichEvilynn.esp") as Spell
endevent


event OnLoad()
	EL_Utility.Log("Light on load.", "EL_LairLightCycle")
	; SetAlpha(0.0)
	; AddSpell(LightSpell)
	SetToPosition()
	Utility.Wait(0.2)
	MoveToNext()
	RegisterForSingleUpdate(0.5)
endevent

event OnUpdate()
	EL_Utility.Log("Light on update.", "EL_LairLightCycle")
	if IsInPosition() == false
		SetToPosition()
	endif
	LightSpell.Cast(Self, Self)
endevent

event OnTranslationFailed()
	EL_Utility.Log("Light OnTranslationFailed.", "EL_LairLightCycle")
	SetToPosition()
	RegisterForSingleUpdate(0.2)
endevent

event OnTranslationComplete()
	EL_Utility.Log("Light OnTranslationComplete.", "EL_LairLightCycle")
	RegisterForSingleUpdate(0.1)
endevent

bool function IsInPosition()
	EL_Utility.Log("Light IsInPosition.", "EL_LairLightCycle")
	if (afX[movingTo] - GetPositionX()) < 1
		return false
	endif
	if (afY[movingTo] - GetPositionY()) < 1
		return false
	endif
	if (afZ[movingTo] - GetPositionZ()) < 1
		return false
	endif
	return false
endfunction

function SetToPosition()
	EL_Utility.Log("Light SetToPosition.", "EL_LairLightCycle")
	SetPosition(afX[movingTo], afY[movingTo], afZ[movingTo])
	SetAngle(afAngleX[movingTo], afAngleY[movingTo], afAngleZ[movingTo])
endfunction

function MoveToNext()
	EL_Utility.Log("Light MoveToNext.", "EL_LairLightCycle")
	movingTo += 1
	if movingTo >= afX.length
		movingTo = 0
	endif
	SplineTranslateTo(afX[movingTo], afY[movingTo], afZ[movingTo], afAngleX[movingTo], afAngleY[movingTo], afAngleZ[movingTo], afTangentMagnitude[movingTo], afSpeed[movingTo])
endfunction

int movingTo = 0
Spell Property LightSpell Auto
float[] Property afX Auto
float[] Property afY Auto
float[] Property afZ Auto
float[] Property afAngleX Auto
float[] Property afAngleY Auto
float[] Property afAngleZ Auto
float[] Property afTangentMagnitude Auto
float[] Property afSpeed Auto

