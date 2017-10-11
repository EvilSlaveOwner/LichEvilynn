Scriptname LichEvilynnBeginQuestPlayerScript extends ReferenceAlias 

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	 Debug.Trace("Going to sleep...")
	Game.ForceFirstPerson()
	Game.GetPlayer().MoveTo(BedrollMarker)
	Game.GetPlayer().PlayIdle(WakeUp)
	UnregisterForSleep()
EndEvent

Idle Property WakeUp  Auto  
ObjectReference property BedrollMarker auto
