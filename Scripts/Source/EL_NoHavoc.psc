Scriptname EL_NoHavoc extends ObjectReference  

EVENT onLoad()
    BlockActivation(true)
    setMotionType(Motion_Keyframed, FALSE)
    self.MoveToMyEditorLocation()
endEVENT

EVENT onCellAttach()
    BlockActivation(true)
    self.MoveToMyEditorLocation()
endEVENT

EVENT onLoadGame()
    BlockActivation(true)
    if (Self.Is3DLoaded())
        setMotionType(Motion_Keyframed, FALSE)
    Endif
    self.MoveToMyEditorLocation()
endEVENT