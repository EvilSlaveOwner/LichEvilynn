Scriptname EL_QuestStore extends Quest  

; When time comes to expant to hold more scenes...
; http://forums.bethsoft.com/topic/1583034-quick-questions-quick-answers-thread-63/page-3#entry24889636

int maxQuests = 0

; Quest information. A quest has the same index in all arrays.
Quest[] quests
string[] questsName ; quest name
int[] questsNumActors ; minimum actors required for the quest
bool[] questsInLair ; does the quest require the player to be in the lair (most quests should)
string[] questsLocations ; comma saraprated list of locations the quest is valid in, or an empty string for "all"
string[] questsKeywords ; comma saraprated list of keywords the quest requires, or an empty string for "none"

event OnInit()
	initValues()
endevent

function initValues()
	maxQuests = 0
	quests = new Quest[128]
	questsName = new string[128]
	questsNumActors = new int[128]
	questsInLair = new bool[128]
	questsLocations = new string[128]
	questsKeywords = new string[128]
endfunction

int function GetQuestCount()
	return maxQuests
endfunction

int function GetRandomQuestIndex()
	return Utility.RandomInt(0, maxQuests) - 1
endfunction

function AddQuest(Quest newQuest, string name, int numActors, bool inLair, string locations = "", string keywords = "")
	quests[maxQuests] = newQuest
	questsName[maxQuests] = name
	questsNumActors[maxQuests] = numActors
	questsInLair[maxQuests] = inLair
	questsLocations[maxQuests] = locations
	questsKeywords[maxQuests] = keywords
	maxQuests = maxQuests + 1
endfunction

Quest function GetQuestByIndex(int index)
	return quests[index]
endfunction

string function GetNameByIndex(int index)
	return questsName[index]
endfunction

int function GetNumActorsByIndex(int index)
	return questsNumActors[index]
endfunction

bool function GetInLairByIndex(int index)
	return questsInLair[index]
endfunction

string function GetLocationsByIndex(int index)
	return questsLocations[index]
endfunction

string function GetKeywordsByIndex(int index)
	return questsKeywords[index]
endfunction
