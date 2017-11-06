Scriptname EL_QuestStore extends Quest  

; When time comes to expant to hold more scenes...
; http://forums.bethsoft.com/topic/1583034-quick-questions-quick-answers-thread-63/page-3#entry24889636

int currentQuestCount = 0 ; 0 - 99 .. needs to error out after the 100th quest is added

; Quest information. A quest has the same index in all arrays.
Quest[] quests
string[] questsName ; quest name
bool[] questsInLair ; does the quest require the player to be in the lair (most quests should)
int[] questsNumVictims ; num vicitim actors required for the quest
int[] questsNumAgressors ; num agressive actors required for the quest
string[] questsRequirements ; list of requirements, or an empty string for "none"
bool[] PlayerMustBeFirstVictim ; first victim must be player
bool[] PlayerMustBeFirstAgressor ; first aggressor must be player

event OnInit()
	currentQuestCount = 0
	quests = new Quest[100]
	questsInLair = new bool[100]
	questsName = new string[100]
	questsNumVictims = new int[100]
	questsNumAgressors = new int[100]
	questsRequirements = new string[100]
	PlayerMustBeFirstVictim = new bool[100]
	PlayerMustBeFirstAgressor = new bool[100]
endevent

int function GetQuestCount()
	return currentQuestCount
endfunction

int function GetRandomQuestIndex()
	if currentQuestCount == 0
		return 0
	endif
	return Utility.RandomInt(1, currentQuestCount) - 1
endfunction

function AddQuest(quest newQuest, string newQuestName, bool newPlayerMustBeFirstAgressor, bool newPlayerMustBeFirstVictim, int newQuestsNumAgressors, int newQuestsNumVictims, string[] newRequirements)
	if currentQuestCount > 99
		Debug.trace("[EL_QuestStore].AddQuest maximum number of quests reached. Not adding " + newQuestName)
		return
	endif

	int index = currentQuestCount
	currentQuestCount += 1
	string requirementsString = JoinRequirements(newRequirements)

	quests[index] = newQuest
	questsInLair[index] = StringUtil.Find(requirementsString, "|inLair|") == -1
	questsName[index] = newQuestName
	questsNumVictims[index] = newQuestsNumVictims
	questsNumAgressors[index] = newQuestsNumAgressors
	questsRequirements[index] = requirementsString
	PlayerMustBeFirstVictim[index] = newPlayerMustBeFirstVictim
	PlayerMustBeFirstAgressor[index] = newPlayerMustBeFirstAgressor
	return
endfunction

string function JoinRequirements(string[] requirementsArray)
	string newRequirements = ""
	int count = requirementsArray.Length
	if count == 0
		return ""
	endif
	int index = 0
	while index < count
	   newRequirements += requirementsArray[index]
	   index += 1
	endwhile
	newRequirements += "|"
	return newRequirements
endfunction

Quest function GetQuestByIndex(int index)
	return quests[index]
endfunction

string function GetNameByIndex(int index)
	return questsName[index]
endfunction

int function GetNumVictimActorsByIndex(int index)
	return questsNumVictims[index]
endfunction

int function GetNumAgressiveActorsByIndex(int index)
	return questsNumAgressors[index]
endfunction

bool function GetInLairByIndex(int index)
	return questsInLair[index]
endfunction

bool function GetPlayerMustBeFirstVictimByIndex(int index)
	return PlayerMustBeFirstVictim[index]
endfunction

bool function GetPlayerMustBeFirstAgressorByIndex(int index)
	return PlayerMustBeFirstAgressor[index]
endfunction

string function GetRequirementsByIndex(int index)
	return questsRequirements[index]
endfunction
