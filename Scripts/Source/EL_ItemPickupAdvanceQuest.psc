Scriptname EL_ItemPickupAdvanceQuest extends ObjectReference

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
        if (akNewContainer == Game.GetPlayer())
                TheQuest.SetStage (NewStage)
        endif
EndEvent
 
Quest Property TheQuest  Auto
Int Property NewStage  Auto