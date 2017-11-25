Scriptname EL_Captives extends Quest  

; Fetch Captives API
EL_Captives function GetApi() Global
	return Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_Captives
endfunction

; Send an actor to her cell.
function GoToCell(Actor captive) Global
	EL_CaptiveMovement.GetApi().GoToCell(captive)
endfunction

function AssignToCell(Actor captive, int cellNumber) Global
	EL_CaptiveMovement.GetApi().AssignToCell(captive, cellNumber)
endfunction