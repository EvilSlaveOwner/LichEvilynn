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
	elseif page == "Victim Scenes"
		SetPageVictimScenes()
	elseif page == "Partner Scenes"
		SetPagePartnerScenes()
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
	AddTextOptionST("ADD_SCENE", "Add a Scene", "")
	AddTextOptionST("PLAY_SCENE", "Play a Scene", "")
	AddTextOptionST("TELEPORT_TO_START", "Teleport to Start", "")
endFunction

function SetPageVictimScenes()
	SetCursorFillMode(LEFT_TO_RIGHT)
	if EL_PlayerRole.GetValue() != 1
		AddTextOption("Player is not Evilynns Victim", "")
		return
	endif
	EL_TortureStore questStore = EL_VictimStore as EL_TortureStore
	int victimQuestCount = questStore.GetQuestCount()
	if victimQuestCount < 0
		AddTextOption("No quests loaded", "")
		return
	endif
	int x = 0
	string questInfo
	while x < victimQuestCount
		questInfo = ""
		questInfo = questInfo + questStore.GetNumActorsByIndex(x)
		questInfo = questInfo + " - " + questStore.GetInLairByIndex(x)
		questInfo = questInfo + " - " + questStore.GetLocationsByIndex(x)
		questInfo = questInfo + " - " + questStore.GetKeywordsByIndex(x)

		AddTextOption(questStore.GetNameByIndex(x), "")
		AddTextOption(questInfo, "")
		x = x + 1
	endwhile
	AddTextOption("", "")
endfunction

function SetPagePartnerScenes()
	SetCursorFillMode(LEFT_TO_RIGHT)
	if EL_PlayerRole.GetValue() != 2
		AddTextOption("Player is not Evilynns Partner", "")
		return
	endif
	EL_TortureStore questStore = EL_PartnerStore as EL_TortureStore
	int partnerQuestCount = questStore.GetQuestCount()
	if partnerQuestCount < 0
		AddTextOption("No quests loaded", "")
		return
	endif
	int x = 0
	string questInfo
	while x < partnerQuestCount
		questInfo = ""
		questInfo = questInfo + questStore.GetNumActorsByIndex(x)
		questInfo = questInfo + " - " + questStore.GetInLairByIndex(x)
		questInfo = questInfo + " - " + questStore.GetLocationsByIndex(x)
		questInfo = questInfo + " - " + questStore.GetKeywordsByIndex(x)

		AddTextOption(questStore.GetNameByIndex(x), "")
		AddTextOption(questInfo, "")
		x = x + 1
	endwhile
	AddTextOption("", "")
endfunction

state PLAY_SCENE
	event OnSelectST()
		EL_TortureStore questStore = EL_VictimStore as EL_TortureStore
		int questIndex = questStore.GetRandomQuestIndex()
		Quest curQuest = questStore.GetQuestByIndex(questIndex)
		curQuest.Start()
		EL_VicTortPlayBall
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
Quest Property EL_PartnerStore  Auto  
Quest Property EL_VictimStore  Auto 
Quest Property EL_VicTortPlayBall  Auto 
GlobalVariable Property EL_PlayerRole  Auto  
ObjectReference Property EL_AlignmentQuestMarker  Auto  

Actor Property PlayerRef  Auto  