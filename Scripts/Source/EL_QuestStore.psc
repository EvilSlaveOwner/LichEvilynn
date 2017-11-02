Scriptname EL_QuestStore extends Quest  

; When time comes to expant to hold more scenes...
; http://forums.bethsoft.com/topic/1583034-quick-questions-quick-answers-thread-63/page-3#entry24889636

int Property numActors auto
int maxQuests = 0
Quest[] quests


Event OnInit()
	quests = new Quest[128]
EndEvent

function AddQuest(Quest newQuest)
	if maxQuests == 128
		Debug.TraceAndBox("Maximum of 128 quests with " + numActors + " reached, quest not registered!", 1)
		return
	endif
	quests[maxQuests] = newQuest
	maxQuests = maxQuests + 1
endfunction

Quest function GetQuestByIndex(int index)
	if maxQuests < index
		Debug.TraceAndBox("Invalid quest index. " + index + " with " + numActors + " actors requested! Returning first quest", 1)
		if maxQuests > 0
			return GetQuestByIndex(1)
		else
			return None
		endif
	endif
	return quests[index]
endfunction

Quest function GetRandomQuest()
	int index = Utility.RandomInt(0, maxQuests - 1)
	return GetQuestByIndex(index)
endfunction