Scriptname EL_RegisterQuest extends Quest

quest ThisQuest
bool isRegistered = false

event OnInit()
	if isRegistered
		return
	endif
	debug.trace("[EL_RegisterQuest] start OnInit")
	if isRegistered
		debug.trace("[EL_RegisterQuest] isRegistered")
		return
	endif
	ThisQuest = Self as Quest
	debug.trace("[EL_RegisterQuest] load quest manager")
	EL_QuestManager QuestManager = Game.GetFormFromFile(0x0A0D21B8, "LichEvilynn.esp") as EL_QuestManager
	if ThisQuest == None
		debug.trace("[EL_RegisterQuest] failed to set ThisQuest")
		return
	endif
	debug.trace("[EL_RegisterQuest] this quest set")
	if QuestManager == None
		debug.trace("[EL_RegisterQuest] EL_QuestManager missing, quest not registered: " + ThisQuest.GetName())
		return
	endif
	debug.trace("[EL_RegisterQuest] questmanager loaded")
	QuestManager.AddQuest(ThisQuest, QuestName, QuestType, PlayerMustBeFirstAgressor, PlayerMustBeFirstVictim, AgressorActorAliasIDs, VictimActorAliasIDs, Requirements)
	debug.trace("[EL_RegisterQuest] quest added")
	isRegistered = true
endevent

function MoveToResetStage()
	ThisQuest.SetStage(ResetStage)
endfunction

bool function IsAtEndStage()
	return ThisQuest.GetStage() == SafeToExitStage
endfunction

function SetAllAliases(actor[] victimActors, actor[] aggressiveActors)
	setAliases(VictimActorAliasIDs, victimActors)
	setAliases(AgressorActorAliasIDs, aggressiveActors)
endfunction

bool function setAliases(int[] aliasActorIDs, actor[] actors)
	int numActors = actors.length
	if actors.length > aliasActorIDs.length
		debug.trace("[EL_RegisterQuest] More actors than availiable alises, aborting")
		return false
	endif
	int index = 0
	bool success = false
	while index < numActors
		success = SetActorAlias(aliasActorIDs[index], actors[index])
		if success == false
			return false
		endif
		index += 1
	endwhile
	return true
endfunction

bool function SetActorAlias(int aliasNumber, Actor theActor = None)
	if aliasNumber < 0
		return true
	endif
	ReferenceAlias ref = (ThisQuest.GetAlias(aliasNumber) as ReferenceAlias)
	if ref == None
		debug.Trace("[EL_RegisterQuest] ref not found: " + aliasNumber)
		return false
	endif
	if theActor == None
		ref.Clear()
	else
		ref.ForceRefTo(theActor)
	endif
	return true
endfunction

Int property ResetStage = 1  auto ; first stage.. should reset all stages, then move to the real quest.
Int property SafeToExitStage = 1000  auto ; final stage, exit now
bool property PlayerMustBeFirstVictim = false auto ; only works if the player is the first victim (PlayerMustBeFirstAgressor must be false if this is true)
bool property PlayerMustBeFirstAgressor = false auto ; only works if the player is the first agressor (PlayerMustBeFirstVictim must be false if this is true)
string property QuestName auto ; name of quest in MCM
string property QuestType auto ; quest type (see docs for valid quest types)
int[] property AgressorActorAliasIDs auto ; list of the ID's for all quest agressor actor aliases
int[] property VictimActorAliasIDs auto ; list of the ID's for all quest victim actor aliases
string[] property Requirements auto ; requirements that must be met to trigger. (see docs for valid requirements, leave blank if no requirements)
