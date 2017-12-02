Scriptname EL_Partner extends Quest  

EL_Partner Function GetApi() Global
	return Game.GetFormFromFile(0x050A929D, "LichEvilynn.esp") as EL_Partner
endfunction