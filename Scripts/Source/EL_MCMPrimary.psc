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
	pages[1] = "Status"
	pages[0] = "Options"
	pages[2] = "Evilynn's Lair"
	;pages[3] = "Rape Quests"
	;pages[4] = "Story Quests"
	;pages[5] = "Torture Quests"
	pages[3] = "Debug & Tests"
	; ...
endevent

; @implements SKI_QuestBase
event OnVersionUpdate(int a_version)
	{Called when a version update of this script has been detected}

	; ...
endevent

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
endevent

function SetPageHome()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Use at your own risk.")
	AddEmptyOption()
	AddHeaderOption("Only use with a backup save.")
	AddEmptyOption()
	AddHeaderOption("It's early alpha, expect bugs.")
	AddEmptyOption()
endFunction

function SetPageOptions()
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("Options")
	AddEmptyOption()
	AddToggleOptionST("SET_SHOW_NOTIFICATIONS", "Show Debug Notifications", (EL_ShowDebugNotifications.GetValue() as int) == 1)
	AddToggleOptionST("SET_SHOW_DEBUG", "Enable Debugging", (EL_ShowDebugDialog.GetValue() as int) == 1)
	AddToggleOptionST("SET_SHOW_DEBUG_LOGS", "Save Script Logs", (EL_ShowDebugLogs.GetValue() as int) == 1)
	AddToggleOptionST("SET_ALLOW_CHEAT", "Allow Cheating", (EL_AllowCheat.GetValue() as int) == 1)
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
	AddToggleOptionST("WEST_WING_OPEN", "Open West Wing", EL_LairAccessController.GetApi().WestWingOpen())	
	AddEmptyOption()
	AddEmptyOption()

	AddToggleOptionST("FLOOR_TWO_OPEN", "Open Floor 2 (East)", EL_LairAccessController.GetApi().FloorTwoOpen())
	AddToggleOptionST("BASEMENT_OPEN", "Open Basements", EL_LairAccessController.GetApi().BasementOpen())
	AddToggleOptionST("FLOOR_THREE_OPEN", "Open Floor 3 (West)", EL_LairAccessController.GetApi().FloorThreeOpen())     
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	
	AddToggleOptionST("SET_MAIN_LIGHTS", "Main Room Lights", EL_LairMainRoomLights.GetValueInt() == 1)
	AddToggleOptionST("SET_MAIN_CELL_LIGHTS", "Main Room Lights: Cell", EL_LairMainRoomCellsLights.GetValueInt() == 1)
	AddToggleOptionST("SET_MAIN_CENTER_LIGHTS", "Main Room Lights: Center", EL_LairMainRoomCenterLights.GetValueInt() == 1)
	AddEmptyOption()
endFunction

function SetPageDebug()
	SetCursorFillMode(LEFT_TO_RIGHT)
	AddHeaderOption("Debug & Tests - MAY BREAK GAME")
	AddEmptyOption()
	AddTextOptionST("TELEPORT_TO_START", "Teleport to Intro Quest", "")
	AddToggleOptionST("SET_AS_VICTIM", "Set Player to Victim", (EL_PlayerRole.GetValue()) as int == 1)
	AddTextOptionST("TELEPORT_TO_LAIR", "Teleport to Lair", "")
	AddToggleOptionST("SET_AS_PARTNER", "Set Player to Partner", (EL_PlayerRole.GetValue() as int) == 2)
	AddTextOptionST("UNLOCK_PLAYER", "Unlock Player (turn on movement)", "")
	AddToggleOptionST("DEBUG_SHORTCIRCUIT", "For Debugging only", (EL_Debug_ShortCircuit.GetValue() as int) == 1)
	AddEmptyOption()
	AddEmptyOption()
	AddHeaderOption("Skip to Quests (for testing ONLY)")
	AddEmptyOption()
	AddHeaderOption("Victim Path")
	AddHeaderOption("Partner Path")
	AddTextOptionST("START_RENAMEPLAYER", "Rename Player", "")
	AddEmptyOption()
	AddTextOptionST("START_GOTOLAIRVIC", "Go to Lair", "")
	AddEmptyOption()
	AddTextOptionST("START_LAIRVICBUNNY", "Sara arrives at lair", "")
	AddEmptyOption()
	AddTextOptionST("START_TAKEVICBUNNY", "Evilynn takes Sara", "")
	AddEmptyOption()
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
		EL_ShowDebugNotifications.SetValue(1.0)
	endevent

	event OnDefaultST()
		EL_ShowDebugNotifications.SetValue(0.0)
	endevent

	event OnHighlightST()
	endevent
endstate

state SET_SHOW_DEBUG_LOGS
	event OnSelectST()
		EL_ShowDebugLogs.SetValue(1.0)
	endevent

	event OnDefaultST()
		EL_ShowDebugLogs.SetValue(0.0)
	endevent

	event OnHighlightST()
	endevent
endstate

state DEBUG_SHORTCIRCUIT
	event OnSelectST()
		EL_Debug_ShortCircuit.SetValue(1.0)
	endevent

	event OnDefaultST()
		EL_Debug_ShortCircuit.SetValue(0.0)
	endevent

	event OnHighlightST()
	endevent
endstate

state SET_SHOW_DEBUG
	event OnSelectST()
		EL_ShowDebugDialog.SetValue(1.0)
	endevent

	event OnDefaultST()
		EL_ShowDebugDialog.SetValue(0.0)
	endevent

	event OnHighlightST()
	endevent
endstate
 
state SET_ALLOW_CHEAT
	event OnSelectST()
		EL_AllowCheat.SetValue(1.0)
	endevent

	event OnDefaultST()
		EL_AllowCheat.SetValue(0.0)
	endevent

	event OnHighlightST()
	endevent
endstate


state SET_AS_VICTIM
	event OnSelectST()
		EL_PlayerRole.SetValue(1.0)
		EL_EvilynnsVictim.Start()
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state UNLOCK_PLAYER
	event OnSelectST()
		EL_PlayerControl.UnLock()
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state START_GOTOLAIRVIC
	event OnSelectST()
		EL_PlayerRole.SetValue(1.0)
		EL_Possessed.GetApi().SetPossessed(PlayerRef)
		EL_TravelToLairVic.Get().Start()
		EL_TravelToLairVic.Get().SetStage(0)
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state START_RENAMEPLAYER
	event OnSelectST()
		EL_PlayerRole.SetValue(1.0)
		EL_Possessed.GetApi().SetPossessed(PlayerRef)
		EL_VicRename.Get().Start()
		EL_VicRename.Get().SetStage(0)
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state START_LAIRVICBUNNY
	event OnSelectST()
		EL_PlayerRole.SetValue(1.0)
		EL_Possessed.GetApi().SetPossessed(PlayerRef)
		EL_LairVicBunny.Get().Start()
		EL_LairVicBunny.Get().SetStage(0)
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state START_TAKEVICBUNNY
event OnSelectST()
		EL_PlayerRole.SetValue(1.0)
		EL_Possessed.GetApi().SetPossessed(PlayerRef)
		EL_LairVicBunny.Get().Start()
		EL_LairVicBunny.Get().SetStage(19)
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state SET_AS_PARTNER
	event OnSelectST()
		EL_PlayerRole.SetValue(2.0)
		EL_EvilynnsPartner.Start()
	endevent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endevent

	event OnHighlightST()
	endevent
endstate

state TELEPORT_TO_START
	event OnSelectST()
		PlayerREF.MoveTo(EL_AlignmentQuestMarker)
	endevent
endstate

state TELEPORT_TO_LAIR              
	event OnSelectST()
		PlayerREF.MoveTo(EL_LairEntranceMarker)
	endevent
endstate

state SET_MAIN_LIGHTS
	event OnSelectST()
		bool on = !EL_LairMainRoomLights.GetValueInt() == 1
		SetToggleOptionValueST(on)
		EL_LairLightMainRoom.Get().Room(on)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairLightMainRoom.Get().Room(false)
	endevent
endstate

state SET_MAIN_CELL_LIGHTS
	event OnSelectST()
		bool on = !EL_LairMainRoomCellsLights.GetValueInt() == 1
		SetToggleOptionValueST(on)
		EL_LairLightMainRoom.Get().Cells(on)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairLightMainRoom.Get().Cells(false)
	endevent
endstate

state SET_MAIN_CENTER_LIGHTS
	event OnSelectST()
		bool on = !EL_LairMainRoomCenterLights.GetValueInt() == 1
		SetToggleOptionValueST(on)
		EL_LairLightMainRoom.Get().Center(on)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairLightMainRoom.Get().Center(false)
	endevent
endstate

state EAST_WING_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().EastWingOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().EastWing(open)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().EastWing(false)
	endevent

	event OnHighlightST()
		SetInfoText("Located in east side of main room")
	endevent
endstate

state WEST_WING_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().WestWingOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().WestWing(open)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().WestWing(false)
	endevent

	event OnHighlightST()
		SetInfoText("Located in west side of main room")
	endevent
endstate

state FLOOR_TWO_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().FloorTwoOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().FloorTwo(open)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().FloorTwo(false)
	endevent

	event OnHighlightST()
		SetInfoText("Located in south east corner of main room")
	endevent
endstate

state FLOOR_THREE_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().FloorThreeOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().FloorThree(open)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().FloorThree(false)
	endevent

	event OnHighlightST()
		SetInfoText("Located in south west corner of main room")
	endevent
endstate
	
state BASEMENT_OPEN
	event OnSelectST()
		bool open = !EL_LairAccessController.GetApi().BasementOpen()
		SetToggleOptionValueST(open)
		EL_LairAccessController.GetApi().Basement(open)
	endevent

	event OnDefaultST()
		SetToggleOptionValueST(false)
		EL_LairAccessController.GetApi().Basement(false)
	endevent

	event OnHighlightST()
		SetInfoText("Located in entrance hallway. Two basements (east and west)")
	endevent
endstate


Quest Property EL_EvilynnsPartner  Auto  
Quest Property EL_EvilynnsVictim  Auto  
Quest Property EL_QuestsRape  Auto 
Quest Property EL_QuestsStory  Auto 
Quest Property EL_QuestsTorture  Auto 
GlobalVariable Property EL_PlayerRole  Auto 
GlobalVariable Property EL_AllowCheat  Auto 
GlobalVariable Property EL_ShowDebugDialog  Auto 
GlobalVariable Property EL_Debug_ShortCircuit Auto
GlobalVariable Property EL_ShowDebugLogs  Auto 
GlobalVariable Property EL_ShowDebugNotifications  Auto 
GlobalVariable Property EL_LairMainRoomLights  Auto
GlobalVariable Property EL_LairMainRoomCellsLights  Auto
GlobalVariable Property EL_LairMainRoomCenterLights  Auto
ObjectReference Property EL_AlignmentQuestMarker  Auto
ObjectReference Property EL_LairEntranceMarker  Auto 
Actor Property PlayerRef  Auto 