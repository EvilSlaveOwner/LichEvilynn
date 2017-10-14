Scriptname EL_BeginQuestActivation extends ObjectReference  

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
		Zap.RemoteCast(SoulStone, PlayerRef, PlayerRef)
		EL_BeginQuestOuch.Show()
		EL_BeginQuest.Start()
	EndIf
EndEvent

Quest property EL_BeginQuest Auto
Actor Property PlayerRef Auto
Actor Property SoulStone Auto
Message Property EL_BeginQuestOuch Auto
Spell Property Zap Auto
