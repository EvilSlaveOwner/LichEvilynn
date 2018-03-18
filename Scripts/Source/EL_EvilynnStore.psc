Scriptname EL_EvilynnStore extends Quest  

EL_EvilynnStore Function Get() Global
	return Game.GetFormFromFile(0x060A929F, "LichEvilynn.esp") as EL_EvilynnStore
endfunction

Furniture property BaseMarker auto