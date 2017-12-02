Scriptname EL_LairDebug extends Quest  

; Fetch EL_LairDebug API
EL_LairDebug function GetApi() Global
	return Game.GetFormFromFile(0x0510CE1E, "LichEvilynn.esp") as EL_LairDebug
endfunction

ActorBase[] testActors

event OnInit()
	testActors = new ActorBase[5]
	testActors[0] = EL_TestActor01
	testActors[1] = EL_TestActor02
	testActors[2] = EL_TestActor03
	testActors[3] = EL_TestActor04
	testActors[4] = EL_TestActor05
endevent


function ToggleDebugLever1()
	Actor newVictim = DebugLever1Marker.PlaceAtMe(testActors[Utility.RandomInt(0, 4)], 1) as Actor
	newVictim.AddToFaction(EL_Factions.GetApi().IsVictim())
endfunction

ActorBase Property EL_TestActor01  Auto
ActorBase Property EL_TestActor02  Auto
ActorBase Property EL_TestActor03  Auto
ActorBase Property EL_TestActor04  Auto
ActorBase Property EL_TestActor05  Auto

ObjectReference Property DebugLever1  Auto
ObjectReference Property DebugLever2  Auto
ObjectReference Property DebugLever3  Auto

ObjectReference Property DebugLever1Marker  Auto
ObjectReference Property DebugLever2Marker  Auto
ObjectReference Property DebugLever3Marker  Auto

ObjectReference Property PainPitVictim1Start  Auto

