Scriptname EL_RapeSceneM1_V1_01 extends Quest  

EL_RapeSceneM1_V1_01 Function Get() Global
	return Game.GetFormFromFile(0x051996BA, "LichEvilynn.esp") as EL_RapeSceneM1_V1_01
endfunction

Event OnInit()
	Center = new float[6]
	Offset = new float[6]
	EL_Utility.Log("Init", "EL_RapeSceneM1_V1_01")
EndEvent

Function TranslationComplete(Actor theActor)
	if (theActor == aMistress01)
		mistressInPosistion = 1
	elseif (theActor == aVictim01)
		victimInPosistion = 1
	endif
	if(victimInPosistion == 1 && mistressInPosistion == 1)
		(Self as Quest).SetStage(1)
		Utility.Wait(3)
		Rape_M1_V1_01.Start()
	endif
EndFunction

function SetLocation(float cX, float cY, float cZ, float aX = 0.0, float aY = 0.0, float aZ = 0.0)
	Center = new float[6]
	Center[0] = cX
	Center[1] = cY
	Center[2] = cZ
	Center[3] = aX
	Center[4] = aY
	Center[5] = aZ
endfunction

function UseRefLocation(ObjectReference theObject)
	Center = new float[6]
	Center[0] = theObject.GetPositionX()
	Center[1] = theObject.GetPositionY()
	Center[2] = theObject.GetPositionZ()
	Center[3] = theObject.GetAngleX()
	Center[4] = theObject.GetAngleY()
	Center[5] = theObject.GetAngleZ()
	EL_Utility.Log("New Loc: " + Center[0] + " " + Center[1] + " " + Center[2] + " " + Center[3] + " " + Center[4] + " " + Center[5], "EL_RapeSceneM1_V1_01")
endfunction

function SetNextQuest(Quest theQuest, int theStage)
	NextQuest = theQuest
	NextQuestStage = theStage
endfunction

function SetVictim(Actor theVictim)
	if PlayerRef == theVictim
		isPlayerForced = true
		PlayerInScene = true
	endif
	Victim01.ForceRefTo(theVictim)
	aVictim01 = theVictim
endfunction

function Position()
	(Mistress01 as EL_ActorMovementController).MoveTo(self, Center, Offset)
	(Victim01 as EL_ActorMovementController).MoveTo(self, Center, Offset)
endfunction

function SetMistress(Actor theMistress)
	if PlayerRef == theMistress
		PlayerInScene = true
		if (EL_PlayerRole.GetValue() as int) < 2 && EL_Possessed.Get().IsPlayerPosessed()
			isPlayerForced = true
		endif
	endif
	Mistress01.ForceRefTo(theMistress)
	aMistress01 = theMistress
endfunction

function StartScene()
	EL_Utility.Log("Starting Scene -- isPlayerInScene: " + PlayerInScene + " -- isPlayerForced: " + isPlayerForced, "EL_RapeSceneM1_V1_01")
	EL_LairScene.SceneStart(0, PlayerInScene, PlayerInScene)
	Victim01.GetActorRef().DispelSpell(ParaSpell)
	Utility.Wait(0.1)
	Position()
endfunction

function EndScene()
	if NextQuest != none && NextQuestStage >= 0
		NextQuest.SetStage(NextQuestStage)
	endif
	ResetScene()
endfunction

function ResetScene()
	isPlayerForced = false
	PlayerInScene = false
	SceenRunning = false
	NextQuest = none
	NextQuestStage = -1
	Mistress01.Clear()
	Victim01.Clear()
	aMistress01 = none
	aVictim01 = none
endfunction

float[] Center
float[] Offset
actor aMistress01
actor aVictim01
int victimInPosistion = 0
int mistressInPosistion = 0

Quest NextQuest = none
int NextQuestStage = 0

bool Property isPlayerForced = false Auto
bool Property PlayerInScene = false Auto
bool Property SceenRunning = false Auto

GlobalVariable Property EL_PlayerRole Auto
Actor Property PlayerRef Auto
ReferenceAlias Property Mistress01  Auto
ReferenceAlias Property Victim01  Auto
Scene Property Rape_M1_V1_01 Auto
SPELL Property ParaSpell  Auto  
