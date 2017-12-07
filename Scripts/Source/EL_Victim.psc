Scriptname EL_Victim extends Quest  

event OnInit()
	string name = PlayerRef.GetBaseObject().GetName()
	if name != newName
		oldName = name
	endif
endevent

EL_Victim Function Get() Global
	return Game.GetFormFromFile(0x050A929E, "LichEvilynn.esp") as EL_Victim
endfunction

function ELSetStage(int stage) Global
	ELGetQuest().SetStage(stage)
endfunction

Quest function ELGetQuest() Global
	return Game.GetFormFromFile(0x050A929E, "LichEvilynn.esp") as Quest
endfunction

string newName = "Dolly"
string oldName
Actor Property PlayerRef Auto