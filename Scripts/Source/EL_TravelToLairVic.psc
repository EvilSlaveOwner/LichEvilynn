Scriptname EL_TravelToLairVic extends Quest  

EL_TravelToLairVic function Get() Global
	return Game.GetFormFromFile(0x050D5085, "LichEvilynn.esp") as EL_TravelToLairVic
endfunction