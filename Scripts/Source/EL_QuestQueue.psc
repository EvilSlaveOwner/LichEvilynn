Scriptname EL_QuestQueue extends Quest  

EL_QuestQueue function Get() Global
	return Game.GetFormFromFile(0x051418F4, "LichEvilynn.esp") as EL_QuestQueue
endfunction

function AddQuest(quest theQuest, int theStage = 0, int startInDays = 0, int startInHours = 0, int startInMin = 0) Global
	EL_QuestQueue.Get().RunAddQuest(theQuest, theStage, startInDays, startInHours, startInMin);
endfunction

function Unlock() Global
	EL_QuestQueue.Get().RunUnlock()
endfunction

event OnInit()
	queuedQuests = new Quest[50] 
	queuedQuestStage = new int[50]
	queuedQuestStartTime = new float[50] 
	RegisterForSingleUpdate(5)
endevent

event OnUpdate()
	if CanStartQuest()
		CheckQuests()
	endif
	RegisterForSingleUpdate(5)
endevent


Quest[] queuedQuests
int[] queuedQuestStage
float[] queuedQuestStartTime

bool function CanStartQuest()
	if locked == true
		return false
	endif
	PlayerRef.GetCombatState()
	if PlayerRef.GetCombatState() != 0
		return false
	endif
	if EL_PlayerInScene.GetValue() != 0.0
		return false
	endif
	return true
endfunction

function CheckQuests()
	int numQuests = queuedQuests.Length
	int i = 0
	float currentTime = Utility.GetCurrentGameTime()
	while i < numQuests
		if queuedQuests[i] != none && queuedQuestStartTime[i] <= currentTime
				EL_Utility.Log("Starting quest " + i + " current time " + currentTime + " start time " + queuedQuestStartTime[i], "EL_QuestQueue")
			StartQuest(queuedQuests[i], queuedQuestStage[i])
			queuedQuests[i] = none
			return
		endif
		i += 1
	endwhile
endfunction

function StartQuest(quest theQuest, int theStage = 0)
	locked = true
	theQuest.Start()
	theQuest.SetStage(theStage)
endfunction

function RunUnlock()
	locked = false
endfunction

function RunAddQuest(quest theQuest, int theStage = 0, int startInDays = 0, int startInHours = 0, int startInMin = 0)
	EL_Utility.Log("Quest added to queue.", "EL_QuestQueue")
	float startTime = EL_Utility.GetTimeIn(startInDays, startInHours, startInMin)
	int nextSlot = queuedQuests.find(none)
	if nextSlot < 0
		EL_Utility.Log("Failed to queue, no slots open.", "EL_QuestQueue")
		return
	endif
	queuedQuests[nextSlot] = theQuest
	queuedQuestStage[nextSlot] = theStage
	queuedQuestStartTime[nextSlot] = startTime
endfunction

bool locked = false
Actor Property PlayerRef Auto
GlobalVariable Property EL_PlayerInScene Auto