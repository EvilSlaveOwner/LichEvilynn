Scriptname EL_MCMPrimary extends SKI_ConfigBase  

bool EL_LairNorthDoorClutterEnabled
bool EL_LairEastDoorClutterEnabled
bool EL_LairWestDoorClutterEnabled

; SCRIPT VERSION ----------------------------------------------------------------------------------

int function GetVersion()
	return 1	; Default version
endFunction



; INITIALIZATION ----------------------------------------------------------------------------------

; @implements SKI_ConfigBase
event OnConfigInit()
	{Called when this config menu is initialized}
	pages[0] = "Options"
	pages[1] = "Status"
	pages[2] = "Evilynn's Lair"
	pages[3] = "Rape Quests"
	pages[4] = "Story Quests"
	pages[5] = "Torture Quests"
	pages[6] = "Debug & Tests"
	; ...
endEvent

; @implements SKI_QuestBase
event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}

	; ...
endEvent

event OnPageReset(string page)
	if page == ""
		SetPageHome()
	elseif page == "Options"
		SetPageOptions()
	elseif page == "Status"
		SetPageStatus()
	elseif page == "Evilynn's Lair"
		SetPageEvilynnsLair()
	elseif page == "Rape Quests"
		SetPageRapeQuests()
	elseif page == "Story Quests"
		SetPageStoryQuests()
	elseif page == "Torture Quests"
		SetPageTortureQuests()
	elseif page == "Debug & Tests"
		SetPageDebug()
	endif
endEvent

function SetPageHome()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Options")
	AddEmptyOption()
	AddTextOptionST("KILL_SWITCH1", "DO NOT PRESS THIS BUTTON", "")
endFunction

function SetPageOptions()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Options")
	AddEmptyOption()
	AddTextOptionST("KILL_SWITCH2", "DO NOT PRESS THIS BUTTON", "")
endFunction

function SetPageStatus()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Status")
	AddEmptyOption()
	AddTextOption("Player Role", EL_PlayerRole.GetValue())
	AddTextOption("1", "Player is Evilynn's Victim")
	AddTextOption("2", "Player is Evilynn's Partner")
endFunction

function SetPageEvilynnsLair()
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("First Room")
	AddEmptyOption()
	
	EL_LairNorthDoorClutterEnabled = EL_LairNorthDoorClutter.IsEnabled()
	EL_LairEastDoorClutterEnabled = EL_LairEastDoorClutter.IsEnabled()
	EL_LairWestDoorClutterEnabled = El_LairWestDoorClutter.IsEnabled()
	
	AddToggleOptionST("CLEAN_NORTH", "Clean North Area", EL_LairNorthDoorClutterEnabled)
	AddToggleOptionST("CLEAN_EAST", "Clean East Area", EL_LairEastDoorClutterEnabled)
	AddToggleOptionST("CLEAN_WEST", "Clean West Area", EL_LairWestDoorClutterEnabled)
endFunction

function SetPageDebug()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Debug & Tests")
	AddEmptyOption()
	AddTextOptionST("SET_AS_VICTIM", "Set Player to Victim", "")
	AddTextOptionST("SET_AS_PARTNER", "Set Player to Partner", "")
	
	AddTextOptionST("PLAY_SCENE", "Play a Scene", "")
	AddTextOptionST("TELEPORT_TO_START", "Teleport to Start", "")
endFunction

function SetPageRapeQuests()
	SetCursorFillMode(LEFT_TO_RIGHT)
	addQuestList(EL_QuestsRape as EL_QuestStore)
endfunction

function SetPageStoryQuests()
	SetCursorFillMode(LEFT_TO_RIGHT)
	addQuestList(EL_QuestsStory as EL_QuestStore)
endfunction

function SetPageTortureQuests()
	SetCursorFillMode(LEFT_TO_RIGHT)
	addQuestList(EL_QuestsTorture as EL_QuestStore)
endfunction

function addQuestList(EL_QuestStore questStore)
	int questCount = questStore.GetQuestCount()
	if questCount < 0
		AddTextOption("No quests loaded", "")
		return
	endif
	AddTextOption("Number\tName", "")
	AddTextOption("#V/#A\tIn Lair\tRequirements", "")
	int x = 0
	string questInfo
	while x < questCount
		questInfo = ""
		questInfo += questStore.GetNumVictimActorsByIndex(x) + "/" + questStore.GetNumAgressiveActorsByIndex(x) 
		questInfo += "\t" + questStore.GetInLairByIndex(x) as string
		questInfo += "\t" + questStore.GetRequirementsByIndex(x)
		AddTextOption( x + "\t" + questStore.GetNameByIndex(x), "")
		AddTextOption(questInfo, "")
		x = x + 1
	endwhile
endfunction

state SET_AS_VICTIM
	event OnSelectST()
		EL_PlayerRole.SetValue(1)
		EL_EvilynnsVictim.Start()
	endEvent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endEvent

	event OnHighlightST()
	endEvent
endState

state SET_AS_PARTNER
	event OnSelectST()
		EL_PlayerRole.SetValue(2)
		EL_EvilynnsPartner.Start()
	endEvent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endEvent

	event OnHighlightST()
	endEvent
endState

state PLAY_SCENE
	event OnSelectST()
		EL_QuestStore questStore = EL_QuestsTorture as EL_QuestStore
		;int questIndex = questStore.GetRandomQuestIndex()
		;Quest curQuest = questStore.GetQuestByIndex(questIndex)
		;curQuest.Start()
	endEvent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endEvent

	event OnHighlightST()
	endEvent
endState

state TELEPORT_TO_START
	event OnSelectST()
		PlayerREF.MoveTo(EL_AlignmentQuestMarker)
	endEvent
endState


state CLEAN_NORTH
	event OnSelectST()
		EL_LairNorthDoorClutterEnabled = !EL_LairNorthDoorClutterEnabled
		SetToggleOptionValueST(EL_LairNorthDoorClutterEnabled)
		if EL_LairNorthDoorClutterEnabled
			EL_LairNorthDoorClutter.Enable(true)
		else
			EL_LairNorthDoorClutter.Disable(true)
		endif
	endEvent

	event OnDefaultST()
		EL_LairNorthDoorClutterEnabled = true
		SetToggleOptionValueST(EL_LairNorthDoorClutterEnabled)
		if EL_LairNorthDoorClutterEnabled
			EL_LairNorthDoorClutter.Enable(true)
		else
			EL_LairNorthDoorClutter.Disable(true)
		endif
	endEvent

	event OnHighlightST()
		SetInfoText("Clean north side of room")
	endEvent
endState

state CLEAN_EAST
	event OnSelectST()
		EL_LairEastDoorClutterEnabled = !EL_LairEastDoorClutterEnabled
		SetToggleOptionValueST(EL_LairEastDoorClutterEnabled)
		if EL_LairEastDoorClutterEnabled
			EL_LairEastDoorClutter.Enable(true)
		else
			EL_LairEastDoorClutter.Disable(true)
		endif
	endEvent

	event OnDefaultST()
		EL_LairEastDoorClutterEnabled = false
		SetToggleOptionValueST(EL_LairEastDoorClutterEnabled)
		if EL_LairEastDoorClutterEnabled
			EL_LairEastDoorClutter.Enable(true)
		else
			EL_LairEastDoorClutter.Disable(true)
		endif
	endEvent

	event OnHighlightST()
		SetInfoText("Clean east side of room")
	endEvent
endState

state CLEAN_WEST
	event OnSelectST()
		EL_LairWestDoorClutterEnabled = !EL_LairWestDoorClutterEnabled
		SetToggleOptionValueST(EL_LairWestDoorClutterEnabled)
		if EL_LairWestDoorClutterEnabled
			EL_LairWestDoorClutter.Enable(true)
		else
			EL_LairWestDoorClutter.Disable(true)
		endif
	endEvent

	event OnDefaultST()
		EL_LairWestDoorClutterEnabled = false
		SetToggleOptionValueST(EL_LairWestDoorClutterEnabled)
		if EL_LairWestDoorClutterEnabled
			EL_LairWestDoorClutter.Enable(true)
		else
			EL_LairWestDoorClutter.Disable(true)
		endif
	endEvent

	event OnHighlightST()
		SetInfoText("Clean west side of room")
	endEvent
endState


ObjectReference Property EL_LairNorthDoorClutter  Auto  
ObjectReference Property EL_LairEastDoorClutter  Auto  
ObjectReference Property El_LairWestDoorClutter  Auto 
Quest Property EL_EvilynnsPartner  Auto  
Quest Property EL_EvilynnsVictim  Auto  
Quest Property EL_QuestsRape  Auto 
Quest Property EL_QuestsStory  Auto 
Quest Property EL_QuestsTorture  Auto 
GlobalVariable Property EL_PlayerRole  Auto  
ObjectReference Property EL_AlignmentQuestMarker  Auto  
Actor Property PlayerRef  Auto 