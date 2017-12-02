Scriptname EL_LairAccessController extends Quest  

; Fetch EL_LairAccessController API
EL_LairAccessController function GetApi() Global
	return Game.GetFormFromFile(0x0510CE1E, "LichEvilynn.esp") as EL_LairAccessController
endfunction

bool function NorthWingOpen()
	return !NorthWingWestEntranceCover.IsEnabled()
endfunction

bool function SouthWingOpen()
	return !SouthWingWestEntranceCover.IsEnabled()
endfunction

bool function EastWingOpen()
	return !MainEastDoorCover.IsEnabled()
endfunction

bool function WestWingOpen()
	return !MainWestDoorCover.IsEnabled()
endfunction

bool function FloorTwoOpen()
	return !MainSouthEastCover.IsEnabled()
endfunction

bool function FloorThreeOpen()
	return !MainSouthWestCover.IsEnabled()
endfunction

bool function BasementOpen()
	return !MainHallwayCover.IsEnabled()
endfunction

function NorthWing(bool open)
	if open
		NorthWingEastEntranceCover.Disable()
		NorthWingEastEntrance.Enable()
		NorthWingWestEntranceCover.Disable()
		NorthWingWestEntrance.Enable()
	else
		NorthWingEastEntranceCover.Enable()
		NorthWingEastEntrance.Disable()
		NorthWingWestEntranceCover.Enable()
		NorthWingWestEntrance.Disable()
	endif
endfunction

function SouthWing(bool open)
	if open
		SouthWingEastEntranceCover.Disable()
		SouthWingEastEntrance.Enable()
		SouthWingWestEntranceCover.Disable()
		SouthWingWestEntrance.Enable()
	else
		SouthWingEastEntranceCover.Enable()
		SouthWingEastEntrance.Disable()
		SouthWingWestEntranceCover.Enable()
		SouthWingWestEntrance.Disable()
	endif
endfunction

function EastWing(bool open)
	if open
		MainEastDoorCover.Disable()
		MainEastDoorExit.Enable()
	else
		MainEastDoorCover.Enable()
		MainEastDoorExit.Disable()
	endif
endfunction

function WestWing(bool open)
	if open
		MainWestDoorCover.Disable()
		MainWestDoorExit.Enable()
	else
		MainWestDoorCover.Enable()
		MainWestDoorExit.Disable()
	endif
endfunction

function FloorTwo(bool open)
	if open
		MainSouthEastCover.Disable()
		MainSouthEastExit.Enable()
	else
		MainSouthEastCover.Enable()
		MainSouthEastExit.Disable()
	endif
endfunction

function FloorThree(bool open)
	if open
		MainSouthWestCover.Disable()
		MainSouthWestExit.Enable()
	else
		MainSouthWestCover.Enable()
		MainSouthWestExit.Disable()
	endif
endfunction

function Basement(bool open)
	if open
		MainHallwayCover.Disable()
		MainHallwayBasementExits.Enable()
	else
		MainHallwayCover.Enable()
		MainHallwayBasementExits.Disable()
	endif
endfunction

ObjectReference Property NorthWingEastEntrance  Auto 
ObjectReference Property NorthWingEastEntranceCover  Auto 
ObjectReference Property NorthWingWestEntrance  Auto 
ObjectReference Property NorthWingWestEntranceCover  Auto 
ObjectReference Property SouthWingEastEntrance  Auto 
ObjectReference Property SouthWingEastEntranceCover  Auto 
ObjectReference Property SouthWingWestEntrance  Auto 
ObjectReference Property SouthWingWestEntranceCover  Auto 
ObjectReference Property MainHallwayCover  Auto  
ObjectReference Property MainHallwayBasementExits  Auto  
ObjectReference Property MainEastDoorCover  Auto  
ObjectReference Property MainEastDoorExit  Auto  
ObjectReference Property MainWestDoorCover  Auto  
ObjectReference Property MainWestDoorExit  Auto 
ObjectReference Property MainSouthEastCover  Auto  
ObjectReference Property MainSouthEastExit  Auto  
ObjectReference Property MainSouthWestCover  Auto  
ObjectReference Property MainSouthWestExit  Auto 