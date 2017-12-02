Scriptname EL_Factions extends Quest  

; Fetch EL_Factions API
EL_Factions function GetApi() Global
	return Game.GetFormFromFile(0x05115A91, "LichEvilynn.esp") as EL_Factions
endfunction

; Actor is a Potential Victim
Faction function Victim()
	return EL_PotentialVictim
endfunction

; Actor is posessed by Evilynn
Faction function Posessed()
	return EL_Posessed
endfunction

; SexLap scene ended (used for scripts to know when a scene is over)
Faction function PlayerSexEnd()
	return EL_PlayerSexEnd
endfunction

; Single use in alignment quest
Faction function PlayerLastAlignmentFG2()
	return EL_PlayerLastAlignmentFG2
endfunction

; Single use in alignment quest
Faction function PlayerLastAlignmentChoice()
	return EL_PlayerLastAlignmentChoice
endfunction

; Actor is leaving cell.
Faction function LeaveCell()
	return EL_LeaveCell
endfunction

; Actor is victim
Faction function IsVictim()
	return EL_IsVictim
endfunction

; Actor is in a scene.
Faction function IsInScene()
	return EL_IsInScene
endfunction

; currently in her cell.
Faction function IsInCell()
	return EL_IsInCell
endfunction

; Currently a captive, but has not given in
; will try to escape.
Faction function IsCaptive()
	return EL_IsCaptive
endfunction

; Currently busy - in scene/pose/script
Faction function IsBusy()
	return EL_IsBusy
endfunction

; Is the agressor in Scenes.
Faction function IsAgressor()
	return EL_IsAgressor
endfunction

; Is going to cell.
Faction function GoToCell()
	return EL_GoToCell
endfunction

; Crying souund effect
Faction function Crying()
	return EL_Crying
endfunction

; belongs in cell 01 in the main prison room of the lair.
Faction function CaptiveBelongsInCell01()
	return EL_CaptiveBelongsInCell01
endfunction

; belongs in cell 02 in the main prison room of the lair.
Faction function CaptiveBelongsInCell02()
	return EL_CaptiveBelongsInCell02
endfunction

; belongs in cell 03 in the main prison room of the lair.
Faction function CaptiveBelongsInCell03()
	return EL_CaptiveBelongsInCell03
endfunction

; belongs in cell 04 in the main prison room of the lair.
Faction function CaptiveBelongsInCell04()
	return EL_CaptiveBelongsInCell04
endfunction

; belongs in cell 05 in the main prison room of the lair.
Faction function CaptiveBelongsInCell05()
	return EL_CaptiveBelongsInCell05
endfunction

Faction Property EL_PotentialVictim Auto
Faction Property EL_Posessed Auto
Faction Property EL_PlayerSexEnd Auto
Faction Property EL_PlayerLastAlignmentFG2 Auto
Faction Property EL_PlayerLastAlignmentChoice Auto
Faction Property EL_LeaveCell Auto
Faction Property EL_IsVictim Auto
Faction Property EL_IsInScene Auto
Faction Property EL_IsInCell Auto
Faction Property EL_IsCaptive Auto
Faction Property EL_IsBusy Auto
Faction Property EL_IsAgressor Auto
Faction Property EL_GoToCell Auto
Faction Property EL_Crying Auto
Faction Property EL_CaptiveBelongsInCell01 Auto
Faction Property EL_CaptiveBelongsInCell02 Auto
Faction Property EL_CaptiveBelongsInCell03 Auto
Faction Property EL_CaptiveBelongsInCell04 Auto
Faction Property EL_CaptiveBelongsInCell05 Auto





























