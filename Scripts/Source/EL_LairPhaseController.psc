Scriptname EL_LairPhaseController extends Quest  

event OnInit()
	RegisterForSingleUpdate(0.5)
endevent

event OnUpdate()
	PhaseOut()
endEvent

; Fetch EL_LairPhaseController API
EL_LairPhaseController function Get() Global
	return Game.GetFormFromFile(0x05167999, "LichEvilynn.esp") as EL_LairPhaseController
endfunction

function PhaseIn(float duration = 0.0)
	GoToState("PhasedIn")
	EL_Utility.Log("Phasing in called.", "EL_LairPhaseController")
	RunPhaseIn()
	if duration == -1
		return
	endif
	if duration < lairEntranceVisibleDuration
		duration = lairEntranceVisibleDuration
	endif
	RegisterForSingleUpdate(duration)
EndFunction

function PhaseOut()
	GoToState("PhasedOut")
	RunPhaseOut()
	EL_Utility.Log("Phasing out called.", "EL_LairPhaseController")
endFunction

state PhasedIn
	function PhaseIn(float duration = 0.0)
	EndFunction
	event OnUpdate()
		PhaseOut()
	endEvent
endstate

state PhasedOut
	function PhaseOut()
	EndFunction
	event OnUpdate()	
	endevent
endstate

Function RunPhaseIn()
	EL_Utility.Log("Phasing in the lair.", "EL_LairPhaseController")
	GoToState("PhasedIn")
	iLairPhaseSound = LairPhaseSound.Play(EL_LairGateStone)

	EL_LairPhaseStatus.SetValue(1.0)
	LairDoor.EnableNoWait(true)
	LairWallFloor.EnableNoWait(true)
	LairWallFront.EnableNoWait(true)
	LairWallLeft.EnableNoWait(true)
	LairWallRight.EnableNoWait(true)
	LairWallRoof.EnableNoWait(true)
EndFunction

Function RunPhaseOut()
	GoToState("PhasedOut")
	EL_Utility.Log("Phasing out the lair.", "EL_LairPhaseController")
	EL_LairPhaseStatus.SetValue(0.0)
	LairDoor.DisableNoWait(true)
	LairWallFloor.DisableNoWait(true)
	LairWallFront.DisableNoWait(true)
	LairWallLeft.DisableNoWait(true)
	LairWallRight.DisableNoWait(true)
	LairWallRoof.DisableNoWait(true)
	if iLairPhaseSound > 0
		Sound.StopInstance(iLairPhaseSound)
	endif
EndFunction

float Property lairEntranceVisibleDuration Auto
Actor Property PlayerREF Auto
GlobalVariable Property EL_LairPhaseStatus Auto
ObjectReference Property LairDoor Auto
ObjectReference Property LairWallFloor Auto
ObjectReference Property LairWallFront Auto
ObjectReference Property LairWallLeft Auto
ObjectReference Property LairWallRight Auto
ObjectReference Property LairWallRoof Auto
Sound Property LairPhaseSound  Auto  
int iLairPhaseSound
ObjectReference Property EL_LairGateStone  Auto  
