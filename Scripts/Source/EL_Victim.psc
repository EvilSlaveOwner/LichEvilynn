Scriptname EL_Victim extends Quest  

EL_Victim Function GetApi() Global
	return Game.GetFormFromFile(0x050A929E, "LichEvilynn.esp") as EL_Victim
endfunction