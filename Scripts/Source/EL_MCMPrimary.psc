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
endFunction


state ADD_SCENE
	event OnSelectST()
		Debug.Notification("adding scene")
		; SetTextOptionValueST(true)
	endEvent

	event OnDefaultST()
		; SetTextOptionValueST(false)
	endEvent

	event OnHighlightST()
		SetInfoText("Add Scene to test")
	endEvent
endState

state CLEAN_NORTH
	event OnSelectST()
		EL_LairNorthDoorClutterEnabled = !EL_LairNorthDoorClutterEnabled
		Debug.Notification("CLEAN_NORTH SELECT")
		SetToggleOptionValueST(EL_LairNorthDoorClutterEnabled)
		if EL_LairNorthDoorClutterEnabled
			EL_LairNorthDoorClutter.Enable(true)
		else
			EL_LairNorthDoorClutter.Disable(true)
		endif
	endEvent

	event OnDefaultST()
		EL_LairNorthDoorClutterEnabled = true
		Debug.Notification("CLEAN_NORTH DEFAULT")
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
		Debug.Notification("CLEAN_NORTH SELECT")
		SetToggleOptionValueST(EL_LairEastDoorClutterEnabled)
		if EL_LairEastDoorClutterEnabled
			EL_LairEastDoorClutter.Enable(true)
		else
			EL_LairEastDoorClutter.Disable(true)
		endif
	endEvent

	event OnDefaultST()
		EL_LairEastDoorClutterEnabled = false
		Debug.Notification("CLEAN_EAST DEFAULT")
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
		Debug.Notification("CLEAN_WEST SELECT")
		SetToggleOptionValueST(EL_LairWestDoorClutterEnabled)
		if EL_LairWestDoorClutterEnabled
			EL_LairWestDoorClutter.Enable(true)
		else
			EL_LairWestDoorClutter.Disable(true)
		endif
	endEvent

	event OnDefaultST()
		EL_LairWestDoorClutterEnabled = false
		Debug.Notification("CLEAN_WEST DEFAULT")
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