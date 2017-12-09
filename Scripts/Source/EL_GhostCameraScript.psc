Scriptname EL_GhostCameraScript extends Actor

event onLoad()
	SetAlpha(0.0)	
	if PerkMuffledMovement != none
		AddPerk(PerkMuffledMovement)
	endif		
endevent

Perk Property PerkMuffledMovement  Auto  
