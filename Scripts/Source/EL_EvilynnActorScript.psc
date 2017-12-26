Scriptname EL_EvilynnActorScript extends Actor  

EL_EvilynnActorScript Function GetApi() Global
	return Game.GetFormFromFile(0x05000D66, "LichEvilynn.esp") as EL_EvilynnActorScript
endfunction

int IsPossessingLastValue = 0
float property ghostAlpha auto
EFFECTSHADER PROPERTY EL_EvilynnGhostFX AUTO
SPELL PROPERTY EL_GhostAbility AUTO

; ///////////
; //ONLOAD
; ///////////
EVENT onLoad()
	SELF.addSpell(EL_GhostAbility)
	GhostFlash(0.3)			
	SELF.setGhost()
	SELF.Enable(true)
	GetDressed()
ENDEVENT

event OnInit()
	Gear = new Armor[7]
	Gear[0] = Gear1
	Gear[1] = Gear2
	Gear[2] = Gear3
	Gear[3] = Gear4
	Gear[4] = Gear5
	Gear[5] = Gear6
	Gear[6] = Gear7
endevent

event OnUpdate()
endevent

FUNCTION GhostFlash(FLOAT time)

	; //stop the effect to keep the particles
	EL_EvilynnGhostFX.stop(SELF)
	;SELF.setGhost()

	; //be invincible for x seconds
	utility.wait(time)
	
	; //return the ghost to normal
	;SELF.setGhost(FALSE)
	SetAlpha(ghostAlpha, true)
	EL_EvilynnGhostFX.play(SELF)
ENDFUNCTION

function GetDressed()
	int currItem = Gear.Length
	while currItem
		currItem -= 1
		if Gear[currItem] != none
			AddAndEquipItem(Gear[currItem])
		endif
	endwhile
endfunction

function AddAndEquipItem(Armor item)
	if GetItemCount(item) == 0
		AddItem(item, 1, true)
	endif
	EquipItem(item, true, true)
endfunction

Armor[] Gear
GlobalVariable Property EL_IsPossessing  Auto  
Armor Property Gear1 Auto
Armor Property Gear2 Auto
Armor Property Gear3 Auto
Armor Property Gear4 Auto
Armor Property Gear5 Auto
Armor Property Gear6 Auto
Armor Property Gear7 Auto