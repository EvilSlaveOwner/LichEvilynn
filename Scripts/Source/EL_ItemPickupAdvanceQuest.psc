Scriptname EL_ItemPickupAdvanceQuest extends ObjectReference

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
        if (akNewContainer == Game.GetPlayer())
		if (RequiredStage > -1)
			if (TheQuest.GetStage() == RequiredStage)
	                TheQuest.SetStage (NewStage)
			endif
		else
			TheQuest.SetStage (NewStage)
		endif
        endif
EndEvent
 
Quest Property TheQuest  Auto
Int Property NewStage  Auto
Int Property RequiredStage Auto