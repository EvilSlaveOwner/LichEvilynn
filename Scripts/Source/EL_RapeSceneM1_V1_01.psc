Scriptname EL_RapeSceneM1_V1_01 extends Quest  

EL_RapeSceneM1_V1_01 Function Get() Global
	return Game.GetFormFromFile(0x051996BA, "LichEvilynn.esp") as EL_RapeSceneM1_V1_01
endfunction

function SetLocation(float cX, float cY, float cZ, float aX = 0.0, float aY = 0.0, float aZ = 0.0)
	centerX = cX
	centerY = cY
	centerZ = cZ
	angleX = aX
	angleY = aY
	angleZ = aZ
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
endfunction

function SetMistress(Actor theMistress)
	if PlayerRef == theMistress
		PlayerInScene = true
		if (EL_PlayerRole.GetValue() as int) < 2 && EL_Possessed.Get().IsPlayerPosessed()
			isPlayerForced = true
		endif
	endif
	Mistress01.ForceRefTo(theMistress)
endfunction

function StartScene()
	EL_Utility.Log("Starting Scene: " + PlayerInScene + "/" + isPlayerForced, "EL_RapeSceneM1_V1_01")
	(Self as Quest).SetStage(1)
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
endfunction

float centerX
float centerY
float centerZ
float angleX
float angleY
float angleZ


Quest NextQuest = none
int NextQuestStage = 0
bool isPlayerForced = false
bool PlayerInScene = false
bool SceenRunning = false

GlobalVariable Property EL_PlayerRole Auto
Actor Property PlayerRef Auto
ReferenceAlias Property Mistress01  Auto
ReferenceAlias Property Victim01  Auto
