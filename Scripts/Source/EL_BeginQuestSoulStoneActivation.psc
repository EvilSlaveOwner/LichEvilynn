Scriptname EL_BeginQuestSoulStoneActivation extends ObjectReference

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
		RegisterForSingleUpdate(2.0)
		PlayerRef.SetDontMove(true)
		Zap.RemoteCast(SoulStone, PlayerRef, PlayerRef)	
	EndIf
EndEvent

Event OnUpdate()
	EL_BeginQuest.Start()
	EL_BeginQuest.SetStage(5)
EndEvent

Quest property EL_BeginQuest Auto
Actor Property PlayerRef Auto
ObjectReference Property SoulStone Auto
Message Property EL_BeginQuestOuch Auto
Spell Property Zap Auto