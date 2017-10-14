Scriptname EL_BeginQuestPlayerScript extends ReferenceAlias 

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	 Debug.Notification("Going to sleep...")
	Game.ForceFirstPerson()
	Game.GetPlayer().MoveTo(BedrollMarker)
	Game.GetPlayer().PlayIdle(WakeUp)
	LichEvilynnBeginQuest.SetStage(10)
	UnregisterForSleep()
EndEvent

Idle Property WakeUp  Auto  
ObjectReference property BedrollMarker auto
Quest property LichEvilynnBeginQuest Auto