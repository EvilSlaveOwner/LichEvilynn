Scriptname LichEvilynnBeginQuestActivation extends ObjectReference  

Event onLoad()
    BlockActivation(true)
    setMotionType(Motion_Keyframed, FALSE)
    self.MoveToMyEditorLocation()
EndEvent

Event onCellAttach()
    BlockActivation(true)
    self.MoveToMyEditorLocation()
EndEvent

Event onLoadGame()
    BlockActivation(true)
    if (Self.Is3DLoaded())
        setMotionType(Motion_Keyframed, FALSE)
    Endif
    self.MoveToMyEditorLocation()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	If akActionRef == PlayerRef
		LichEvilynnBeginQuest.SetStage(changeStageTo)
	EndIf
EndEvent

Quest property LichEvilynnBeginQuest Auto
Int Property changeStageTo Auto
Actor Property PlayerRef Auto
