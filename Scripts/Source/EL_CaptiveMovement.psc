Scriptname EL_CaptiveMovement extends Quest  

; Fetch CaptiveMovement API
EL_CaptiveMovement function GetApi() Global
	return Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptiveMovement
endfunction

function GoToCell(actor captive)
	EL_Utility.Log("Sending captive " + zbfUtil.GetObjectName(captive) + " to her cell.", "EL_CaptiveMovement")
	ObjectReference marker = GetActorCellMarker(captive)
	if marker == none
		return
	endif
	EL_Utility.Log("Start " + zbfUtil.GetObjectName(captive) + " pathing to reference.", "EL_CaptiveMovement")
	bool pathedToCell = captive.PathToReference(marker, 0.5)
	if pathedToCell
		EL_Utility.Log("Start " + zbfUtil.GetObjectName(captive) + " pathing successful.", "EL_CaptiveMovement")
		return
	endif
	EL_Utility.Log("Start " + zbfUtil.GetObjectName(captive) + " pathing failed, moving directly there.", "EL_CaptiveMovement")
	captive.MoveTo(marker)
endfunction

ObjectReference function GetActorCellMarker(actor captive)
	if captive.GetFactionRank(EL_CaptiveBelongsInCell01) >= 0
		return LairCellMarker01
	elseif captive.GetFactionRank(EL_CaptiveBelongsInCell02) >= 0
		return LairCellMarker02
	elseif captive.GetFactionRank(EL_CaptiveBelongsInCell03) >= 0
		return LairCellMarker03
	elseif captive.GetFactionRank(EL_CaptiveBelongsInCell04) >= 0
		return LairCellMarker04
	elseif captive.GetFactionRank(EL_CaptiveBelongsInCell05) >= 0
		return LairCellMarker05
	endif
	EL_Utility.Log("Captive " + zbfUtil.GetObjectName(captive) + " does not have a cell marker.", "EL_CaptiveMovement")
	return None
endfunction

Faction function GetFactionForCellNumber(int cellNumber)
	if cellNumber == 1
		return EL_CaptiveBelongsInCell01
	elseif cellNumber == 2
		return EL_CaptiveBelongsInCell02
	elseif cellNumber == 3
		return EL_CaptiveBelongsInCell03
	elseif cellNumber == 4
		return EL_CaptiveBelongsInCell04
	elseif cellNumber == 5
		return EL_CaptiveBelongsInCell05
	endif
	return None
endfunction

function RemoveFromAllCellFactions(Actor captive)
	faction currentFaction
	int cellNumber = 1
	bool continueCheckingFactions = true
	while continueCheckingFactions
		currentFaction = GetFactionForCellNumber(cellNumber)
		if currentFaction != None
			captive.RemoveFromFaction(currentFaction)
		else
			continueCheckingFactions = false
		endif
		cellNumber = cellNumber + 1
	endwhile
endfunction

function AssignToCell(actor captive, int cellNumber)
	Faction cellFaction = GetFactionForCellNumber(cellNumber)
	if cellFaction == None
		EL_Utility.Log("Unable to locate faction for " + cellNumber + ".", "EL_CaptiveMovement")
		return
	endif
	RemoveFromAllCellFactions(captive)
	EL_Utility.Log("Assigning captive " + zbfUtil.GetObjectName(captive) + " to cell faction.", "EL_CaptiveMovement")
	captive.AddToFaction(cellFaction)
	captive.SetFactionRank(cellFaction, 1)
endfunction


ObjectReference Property LairCellMarker01  Auto
ObjectReference Property LairCellMarker02  Auto
ObjectReference Property LairCellMarker03  Auto
ObjectReference Property LairCellMarker04  Auto
ObjectReference Property LairCellMarker05  Auto
Faction Property EL_CaptiveBelongsInCell01  Auto  
Faction Property EL_CaptiveBelongsInCell02  Auto  
Faction Property EL_CaptiveBelongsInCell03  Auto  
Faction Property EL_CaptiveBelongsInCell04  Auto  
Faction Property EL_CaptiveBelongsInCell05  Auto  