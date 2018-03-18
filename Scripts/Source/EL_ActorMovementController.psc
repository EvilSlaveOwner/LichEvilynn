Scriptname EL_ActorMovementController extends ReferenceAlias  

Event OnInit()
	Loc = new float[6]
	Center = new float[6]
	Offsets = new float[6]
EndEvent

State Moving
	bool Function IsReady()
		return false
	EndFunction
	Event OnTranslationComplete()
		GoToState("FinishedMoving")
		EL_Utility.Log("Translation Complete For " + ActorRef.GetBaseObject().GetName(), "EL_ActorMovementController")
		Snap()
		(theQuest as EL_RapeSceneM1_V1_01).TranslationComplete(ActorRef)
	EndEvent
	bool Function MoveTo(Quest questScript, float[] NewCenter, float[] NewOffset)
		return false
	EndFunction
EndState

State FinishedMoving
	bool Function IsReady()
		return true
	EndFunction
	Event OnTranslationComplete()
		Snap()
	EndEvent
	bool Function MoveTo(Quest questScript, float[] NewCenter, float[] NewOffset)
		return false
	EndFunction
EndState


bool Function IsReady()
	return false
EndFunction

bool Function MoveTo(Quest questScript, float[] NewCenter, float[] NewOffset)
	GoToState("Moving")
	ActorRef = GetReference() as Actor
	theQuest = questScript
	Center = NewCenter
	Offsets = NewOffset
	Loc = Center
	;OffsetCoords(Loc, Center, Offsets)
	Lock()
	Snap()
	return true
EndFunction

function Snap()
	; Quickly move into place and angle if actor is off by a lot
	float distance = ActorRef.GetDistance(MarkerRef)
	if distance > 1000.0
		EL_Utility.Log(ActorRef.GetBaseObject().GetName() + " moved to", "EL_ActorMovementController")
		ActorRef.SetPosition(Loc[0], Loc[1], Loc[2])
		ActorRef.SetAngle(Loc[3], Loc[4], Loc[5])
		AttachMarker()
	elseIf distance > 2.0
		EL_Utility.Log(ActorRef.GetBaseObject().GetName() + " translated to", "EL_ActorMovementController")
		ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 100, 0.0)
		return ; OnTranslationComplete() will take over when in place
	endIf
	; Begin very slowly rotating a small amount to hold position
	EL_Utility.Log(ActorRef.GetBaseObject().GetName() + " start rotating", "EL_ActorMovementController")
	ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5]+0.01, 500.0, 0.0001)
endFunction

Function Lock()
	EL_Utility.Get().LockActor(ActorRef)
	if !MarkerRef
		MarkerRef = ActorRef.PlaceAtMe(EL_EvilynnStore.Get().BaseMarker)
		int cycle
		while !MarkerRef.Is3DLoaded() && cycle < 50
			Utility.Wait(0.1)
			cycle += 1
		endWhile
		if cycle
			EL_Utility.Log("Waited [" + cycle + "] cycles for MarkerRef[" + MarkerRef + "]", "EL_ActorMovementController")
		endIf
	endIf
	MarkerRef.Enable()
	ActorRef.StopTranslation()
	MarkerRef.SetPosition(Loc[0], Loc[1], Loc[2])
	MarkerRef.SetAngle(Loc[3], Loc[4], Loc[5])
	;MarkerRef.MoveTo(ActorRef)
	AttachMarker()
EndFunction

Function UnLock()
	ActorRef.StopTranslation()
	ActorRef.SetVehicle(none)
	EL_Utility.Get().UnLockActor(ActorRef)
EndFunction

Function Reset()
	UnLock()
	if MarkerRef
		MarkerRef.Disable()
		MarkerRef.Delete()
	endIf
	theQuest = none
	MarkerRef = none
	GoToState("")
EndFunction

Function AttachMarker()
	;ActorRef.TranslateTo(Loc[0], Loc[1], Loc[2], Loc[3], Loc[4], Loc[5], 50000, 0)
	;MarkerRef.SetPosition(ActorRef.GetPositionX(), ActorRef.GetPositionY(), ActorRef.GetPositionZ())
	;MarkerRef.SetAngle(ActorRef.GetAngleX(), ActorRef.GetAngleY(), ActorRef.GetAngleZ())
	ActorRef.SetVehicle(MarkerRef)
EndFunction

;function OffsetCoords(float[] Output, float[] CenterCoords, float[] OffsetBy) global native
;bool function IsInPosition(Actor CheckActor, ObjectReference CheckMarker, float maxdistance = 30.0) global native


ObjectReference MarkerRef
Actor property ActorRef auto hidden
Quest property theQuest Auto
float[] Property Loc  Auto
float[] Property Center  Auto
float[] Property Offsets  Auto
