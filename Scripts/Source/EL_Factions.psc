Scriptname EL_Factions extends Quest  

; Fetch EL_Factions API
EL_Factions function Get() Global
	return Game.GetFormFromFile(0x05115A91, "LichEvilynn.esp") as EL_Factions
endfunction


; Actor Story State
Faction Property PotentialVictim Auto
Faction Property Posessed Auto
Faction Property IsCaptive Auto
Faction Property CaptiveInLair Auto
Faction Property WillingCaptive Auto

; Actor Scene State
Faction Property MakingSound Auto
Faction Property IsBusy Auto
Faction Property IsAgressor Auto
Faction Property IsVictim Auto

; Managing Scenes and Availiablilty
Faction Property PlayerSexEnd Auto
Faction Property IsInScene Auto
























