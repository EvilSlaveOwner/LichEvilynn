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
	AddTextOptionST("NA1", "Not currently in use", "")
endFunction

function SetPageOptions()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Options")
	AddEmptyOption()
	AddTextOptionST("NA2", "Not currently in use", "")
endFunction

function SetPageStatus()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Status")
	AddEmptyOption()
	int playerRole = EL_PlayerRole.GetValue() as int
	if playerRole == 0
		AddTextOption("Player Role", "Not Decided")
	elseif playerRole == 1
		AddTextOption("Player Role", "Evilynn's Victim")
	elseif playerRole == 2
		AddTextOption("Player Role", "Evilynn's Partner")
	endif
endFunction

function SetPageEvilynnsLair()
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("First Room")
	AddEmptyOption()
	AddToggleOptionST("EAST_WING_OPEN", "Open East Wing", EL_LairAccessController.GetApi().EastWingOpen())
	AddToggleOptionST("NORTH_WING_OPEN", "Open North Wing", EL_LairAccessController.GetApi().NorthWingOpen())
	AddToggleOptionST("WEST_WING_OPEN", "Open West Wing", EL_LairAccessController.GetApi().WestWingOpen())	
	AddToggleOptionST("SOUTH_WING_OPEN", "Open South Wing", EL_LairAccessController.GetApi().SouthWingOpen())
	AddEmptyOption()
	AddEmptyOption()
	AddToggleOptionST("FLOOR_TWO_OPEN", "Open Floor 2 (East)", EL_LairAccessController.GetApi().FloorTwoOpen())
	AddToggleOptionST("BASEMENT_OPEN", "Open Basements", EL_LairAccessController.GetApi().BasementOpen())
	AddToggleOptionST("FLOOR_THREE_OPEN", "Open Floor 3 (West)", EL_LairAccessController.GetApi().FloorThreeOpen())                                

endFunction

function SetPageDebug()
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("Debug & Tests")
	AddEmptyOption()
	AddTextOptionST("TELEPORT_TO_START", "Teleport to Intro Quest", "")
	AddToggleOptionST("SET_AS_VICTIM", "Set Player to Victim", EL_PlayerRole.GetValue() == 1)
	AddTextOptionST("TELEPORT_TO_LAIR", "Teleport to Lair", "")
	AddToggleOptionST("SET_AS_PARTNER", "Set Player to Partner", EL_PlayerRole.GetValue() == 2)
	AddEmptyOption()
	AddEmptyOption()
	AddToggleOptionST("SET_SHOW_NOTIFICATIONS", "Show Debug Notifications", EL_ShowDebugNotifications.GetValue() == 1)
	AddToggleOptionST("SET_SHOW_DEBUG", "Enable Debugging", EL_ShowDebugDialog.GetValue() == 1)
	AddToggleOptionST("SET_SHOW_DEBUG_LOGS", "Save Script Logs", EL_ShowDebugLogs.GetValue() == 1)
	; AddToggleOptionST("SET_ALLOW_CHEAT", "Allow Cheating", EL_AllowCheat.GetValue() == 1)
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


state SET_SHOW_NOTIFICATIONS
	event OnSelectST()
		EL_ShowDebugNotifications.SetValue(1)
	endEvent

	event OnDefaultST()
		EL_ShowDebugNotifications.SetValue(0)
	endEvent

	event OnHighlightST()
	endEvent
endState

state SET_SHOW_DEBUG_LOGS
	event OnSelectST()
		EL_ShowDebugLogs.SetValue(1)
	endEvent

	event OnDefaultST()
		EL_ShowDebugLogs.SetValue(0)
	endEvent

	event OnHighlightST()
	endEvent
endState

state SET_SHOW_DEBUG
	event OnSelectST()
		EL_ShowDebugDialog.SetValue(1)
	endEvent

	event OnDefaultST()
		EL_ShowDebugDialog.SetValue(0)
	endEvent

	event OnHighlightST()
	endEvent
endState
 
state SET_ALLOW_CHEAT
	event OnSelectST()
		EL_AllowCheat.SetValue(1)
	endEvent

	event OnDefaultST()
		EL_AllowCheat.SetValue(0)
	endEvent

	event OnHighlightST()
	endEvent
endState


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

state TELEPORT_TO_START
	event OnSelectST()
		PlayerREF.MoveTo(EL_AlignmentQuestMarker)
	endEvent
endState

state TELEPORT_TO_LAIR              
	event OnSelectST()
		PlayerREF.MoveTo(EL_LairEntranceMarker)
	endEvent
endState

state NORTH_WING_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().NorthWingOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().NorthWing(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().NorthWing(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in the east and west wings, check north end of long hallways")
	endEvent
endState

state SOUTH_WING_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().SouthWingOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().SouthWing(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().SouthWing(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in the east and west wings, check large southern rooms")
	endEvent
endState

state EAST_WING_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().EastWingOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().EastWing(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().EastWing(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in east side of main room")
	endEvent
endState

state WEST_WING_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().WestWingOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().WestWing(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().WestWing(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in west side of main room")
	endEvent
endState

state FLOOR_TWO_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().FloorTwoOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().FloorTwo(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().FloorTwo(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in south east corner of main room")
	endEvent
endState

state FLOOR_THREE_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().FloorThreeOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().FloorThree(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().FloorThree(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in south west corner of main room")
	endEvent
endState
	
state BASEMENT_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().BasementOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().Basement(open)
	endEvent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().Basement(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Located in entrance hallway. Two basements (east and west)")
	endEvent
endState


Quest Property EL_EvilynnsPartner  Auto  
Quest Property EL_EvilynnsVictim  Auto  
Quest Property EL_QuestsRape  Auto 
Quest Property EL_QuestsStory  Auto 
Quest Property EL_QuestsTorture  Auto 
GlobalVariable Property EL_PlayerRole  Auto 
GlobalVariable Property EL_AllowCheat  Auto 
GlobalVariable Property EL_ShowDebugDialog  Auto 
GlobalVariable Property EL_ShowDebugLogs  Auto 
GlobalVariable Property EL_ShowDebugNotifications  Auto 
ObjectReference Property EL_AlignmentQuestMarker  Auto
ObjectReference Property EL_LairEntranceMarker  Auto 
Actor Property PlayerRef  Auto 