Scriptname EL_QuestManager extends Quest  

; valid quest types
; torture
; rape
; story

; valid requirements
; inLair

; running quests
quest[] RunningQuests
bool[] RunningQuestIsStopping
string[] RunningQuestsType
quest[] RunningMasterQuests
int[] RunningMaterQuestsSetStage
quest[] TryToStart
bool isLoaded = false
EL_QuestStore rape
EL_QuestStore story
EL_QuestStore torture

EL_Screen function Get() Global
	return Game.GetFormFromFile(0x050D21B8, "LichEvilynn.esp") as EL_Screen
endfunction

; fixes strange bug where a quest fragment can't update it's own quest stage without causing problems starting scenes.
function SetQuestStage(Quest theQuest, int stage) Global
	theQuest.SetStage(stage)
endfunction



function load()
	if isLoaded
		return
	endif
	RunningQuests = new quest[25]
	RunningQuestsType = new string[25]
	RunningMasterQuests = new quest[25]
	RunningMaterQuestsSetStage = new int[25]
	RunningQuestIsStopping = new bool[25]

	EL_QuestsRape.Start()
	EL_QuestsStory.Start()
	EL_QuestsTorture.Start()
	rape = (EL_QuestsRape as EL_QuestStore)
	story = (EL_QuestsStory as EL_QuestStore)
	torture = (EL_QuestsTorture as EL_QuestStore)
	isLoaded = true
	RegisterForSingleUpdate(5)
endfunction

event OnUpdate()
	int index = 0
	bool allNone = true
	int questsLength = RunningQuests.length
	string report = ""
	while index < questsLength
		report += "Q" + (index + 1) + "-"
		if RunningQuests[index] != None
			allNone = true
			report += RunningQuests[index].GetName() + "-" + RunningQuests[index].GetStage()
			EL_RegisterQuest questRegister = (RunningQuests[index] as EL_RegisterQuest)
			if questRegister.IsAtEndStage()
				if RunningQuestIsStopping[index]
					report += "-already-stopping"
				else
					report += "-end"
					EndQuest(index, RunningQuests[index])
				endif
			else
				report += "-skip"
			endif
		else
			report += "None"
		endif
		report += " / "
		index += 1
	endwhile
	if allNone != true
		debug.trace("[EL_QuestManager] OnUpdate Report: " + report)
	endif
	RegisterForSingleUpdate(5)
endevent

bool function EndQuest(int index, Quest TheQuest)
	RunningQuestIsStopping[index] = true ; avoid duplicate processing.
	debug.notification("[EL_QuestManager] quest end")
	TheQuest.Reset()
	TheQuest.SetStage(0)
	if RunningMasterQuests[index] != None
		debug.trace("[EL_QuestManager] setting master (" + RunningMasterQuests[index].GetName() + ") from stage " + (RunningMasterQuests[index].GetStage()) + " to stage " + RunningMaterQuestsSetStage[index])
		if RunningMasterQuests[index].GetStage() > RunningMaterQuestsSetStage[index]
			debug.trace("[EL_QuestManager] WARNING STAGE WAS: " + RunningMasterQuests[index].GetStage() + " CHANGED TO " + RunningMaterQuestsSetStage[index])
		endif
		RunningMasterQuests[index].SetStage(RunningMaterQuestsSetStage[index])
	endif
	RunningQuests[index] = None ; end first thing, so it's less likely to run into duplication problems.
	RunningQuestsType[index] = ""
	RunningMasterQuests[index] = None
	RunningMaterQuestsSetStage[index] = -1
	return true
endfunction

int function FindOpenQuest()
	int index = 0
	bool success = false
	int questsLength = RunningQuests.length
	while index < questsLength
		if RunningQuests[index] == None
			return index
		endif
		index += 1
	endwhile
	return -1
endfunction

bool function IsQuestSafeToStart(quest TheQuest)
	int index = 0
	int questsLength = RunningQuests.length
	while index < questsLength
		if TheQuest != None && RunningQuestIsStopping[index] != true && RunningQuests[index] == TheQuest
			debug.trace("[EL_QuestManager] quest (" + TheQuest.GetName() + ") already running!")
			return false
		endif
		index += 1
	endwhile
	return true
endfunction

bool function PrepQuestToRun(quest TheQuest)
	debug.trace("[EL_QuestManager] testing IsQuestSafeToStart")
	bool isStarted = false
	if TheQuest.IsStarting()
		debug.trace("[EL_QuestManager] is starting")
		isStarted = true
	elseif TheQuest.IsStopping()
		debug.trace("[EL_QuestManager] is stopping, restarting")
		isStarted = TheQuest.Start()
	elseif TheQuest.IsStopped()
		debug.trace("[EL_QuestManager] is stopped, restarting")
		isStarted = TheQuest.Start()
	elseif TheQuest.IsRunning()
		debug.trace("[EL_QuestManager] is running")	
		isStarted = true
	else
		debug.trace("[EL_QuestManager] unknown quest status, returning false")
		return false
	endif
	if isStarted == false
		debug.trace("[EL_QuestManager] quest failed to start")
	endif
	TheQuest.Reset()
	TheQuest.SetStage(0)
	Utility.Wait(1.0) ; give quests a sec to run
	return true
endfunction

bool function StartQuest(quest TheQuest, string type, quest master, int newMasterStage, actor[] victimActors, actor[] aggressiveActors)
	bool success
	if IsQuestSafeToStart(TheQuest) == false
		debug.trace("[EL_QuestManager] is quest not safe to start")
		return false
	endif
	if master == None
		debug.trace("[EL_QuestManager] failed to startquest, missing master quest")
		return false ; failed to start quest.
	endif
	int nextQuestIndex = FindOpenQuest()
	if nextQuestIndex < 0
		debug.trace("[EL_QuestManager] no open quests slots")
		return false
	endif
	RunningQuests[nextQuestIndex] = TheQuest
	RunningQuestsType[nextQuestIndex] = type
	RunningMasterQuests[nextQuestIndex] = master
	RunningMaterQuestsSetStage[nextQuestIndex] = newMasterStage
	RunningQuestIsStopping[nextQuestIndex] = false
	success = PrepQuestToRun(TheQuest)
	if success == false
		return false
	endif
	EL_RegisterQuest questRegister = (TheQuest as EL_RegisterQuest)	
	questRegister.SetAllAliases(victimActors, aggressiveActors)
	questRegister.MoveToResetStage()
	return true
endfunction

EL_QuestStore function GetCorrectStore(string QuestType)
	if QuestType ==  "rape"
		;Debug.trace("[EL_QuestManager].GetCorrectStore returning rape quest")
		return rape
	elseif QuestType ==  "story"
		;Debug.trace("[EL_QuestManager].GetCorrectStore returning story quest")
		return story
	elseif QuestType ==  "torture"
		;Debug.trace("[EL_QuestManager].GetCorrectStore returning torture quest")
		return torture
	endif
	Debug.trace("[EL_QuestManager].GetCorrectStore invalid quest type")
	return None
endfunction

function RandomVictimPlayerQuest(quest MasterQuest, int newMasterStage, string QuestType, actor[] victimActors, actor[] aggressiveActors)
	RandomQuest(MasterQuest, newMasterStage, QuestType, false, true, victimActors, aggressiveActors)
endfunction

function RandomAggressivePlayerQuest(quest MasterQuest, int newMasterStage, string QuestType, actor[] victimActors, actor[] aggressiveActors)
	RandomQuest(MasterQuest, newMasterStage, QuestType, true, false, victimActors, aggressiveActors)
endfunction

function RandomQuest(quest MasterQuest, int newMasterStage, string QuestType, bool PlayerMustBeFirstAgressor, bool PlayerMustBeFirstVictim, actor[] victimActors, actor[] aggressiveActors)
	load()
	EL_QuestStore store = GetCorrectStore(QuestType)
	if store == None
		Debug.trace("[EL_QuestManager].RandomQuest aborting")
		return
	endif
	int index = store.GetRandomQuestIndex()
	if index < 0
		Debug.trace("[EL_QuestManager].RandomQuest aborting, invalid quest index")
		return
	endif
	quest TheQuest = store.GetQuestByIndex(index)
	if TheQuest == None
		Debug.trace("[EL_QuestManager].RandomQuest aborting, invalid quest")
		return
	endif
	Debug.trace("[EL_QuestManager].RandomQuest starting quest " + TheQuest.GetName())
	StartQuest(TheQuest, QuestType, MasterQuest, newMasterStage, victimActors, aggressiveActors)
endfunction

function AddQuest(quest TheQuest, string QuestName, string QuestType, bool PlayerMustBeFirstAgressor, bool PlayerMustBeFirstVictim, int[] AgressorActorAliasIDs, int[] VictimActorAliasIDs, string[] Requirements)
	load()
	EL_QuestStore store = GetCorrectStore(QuestType)
	if store == None
		Debug.trace("[EL_QuestManager].AddQuest aborting")
		return
	endif
	store.AddQuest(TheQuest, QuestName, PlayerMustBeFirstAgressor, PlayerMustBeFirstVictim, AgressorActorAliasIDs.length, VictimActorAliasIDs.length, Requirements)
endfunction

Quest Property EL_QuestsRape Auto
Quest Property EL_QuestsStory Auto
Quest Property EL_QuestsTorture Auto
