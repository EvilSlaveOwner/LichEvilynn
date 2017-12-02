Scriptname EL_PainPit extends Quest  

; Fetch EL_PainPit API
EL_PainPit function GetApi() Global
	return Game.GetFormFromFile(0x05106DEE, "LichEvilynn.esp") as EL_PainPit
endfunction

; General Variables
bool isActive = false ; is currently animating

; Victim variables
bool[] victimInSlot
ReferenceAlias[] victims
ObjectReference[] victimsStart
ObjectReference[] victimsMarker
ObjectReference[] victimsVehicle
ReferenceAlias Property Victim1 Auto
ReferenceAlias Property Victim2 Auto
ReferenceAlias Property Victim3 Auto
ReferenceAlias Property Victim4 Auto
ObjectReference Property PainPitVictim1Start Auto
ObjectReference Property PainPitVictim2Start Auto
ObjectReference Property PainPitVictim3Start Auto
ObjectReference Property PainPitVictim4Start Auto
ObjectReference Property PainPitVictim1 Auto
ObjectReference Property PainPitVictim2 Auto
ObjectReference Property PainPitVictim3 Auto
ObjectReference Property PainPitVictim4 Auto
function setVictimData()
	victimInSlot = new bool[4]
	victims = new ReferenceAlias[4]
	victimsStart = new ObjectReference[4]
	victimsMarker = new ObjectReference[4]
	victimsVehicle = new ObjectReference[4]
	victims[0] = Victim1
	victims[1] = Victim2
	victims[2] = Victim3
	victims[3] = Victim4
	victimInSlot[0] = false
	victimInSlot[1] = false
	victimInSlot[2] = false
	victimInSlot[3] = false
	victimsStart[0] = PainPitVictim1Start
	victimsStart[1] = PainPitVictim2Start
	victimsStart[2] = PainPitVictim3Start
	victimsStart[3] = PainPitVictim4Start
	victimsMarker[0] = PainPitVictim1
	victimsMarker[1] = PainPitVictim2
	victimsMarker[2] = PainPitVictim3
	victimsMarker[3] = PainPitVictim4
endfunction

; Healing eye variables
; The healing eye heals the player when she gets below 10% health
; the healing heals for a random percentage of the players health
; the percentage healed is a random amount between minHeal and maxHeal
; healing spell is the spell used to heal
float minHeal = 0.05
float maxHeal = 0.25
float minHealth = 0.05
float maxHealth = 0.80
Spell Property HealingSpell Auto                                                                                                         
ObjectReference Property HealingEye Auto
; set healing eye data
function setHealingEyeData()
	; nothing currently
endfunction


; Flame Variables
; Flames include a lit gem that is enabled when the flame is on
; and a dark gem taht is enabled when the flame is off.
; When the flames are on, damagePerTic is the amount of damage (percentage)
; the victim takes every tic for each flame.
float damagePerTic = 0.01
ObjectReference Property Flame1 Auto
ObjectReference Property Flame2 Auto
ObjectReference Property Flame3 Auto
ObjectReference Property Flame4 Auto
ObjectReference Property Flame1Gem Auto
ObjectReference Property Flame2Gem Auto
ObjectReference Property Flame3Gem Auto
ObjectReference Property Flame4Gem Auto
ObjectReference Property Flame1GemDark Auto
ObjectReference Property Flame2GemDark Auto
ObjectReference Property Flame3GemDark Auto
ObjectReference Property Flame4GemDark Auto
ObjectReference[] flames
ObjectReference[] lightGems
ObjectReference[] darkGems

; set flame data
function setFlamesData()
	flames = new ObjectReference[4]
	lightGems = new ObjectReference[4]
	darkGems = new ObjectReference[4]
	flames[0] = Flame1
	flames[1] = Flame2
	flames[2] = Flame3
	flames[3] = Flame4
	lightGems[0] = Flame1Gem
	lightGems[1] = Flame2Gem
	lightGems[2] = Flame3Gem
	lightGems[3] = Flame4Gem
	darkGems[0] = Flame1GemDark
	darkGems[1] = Flame2GemDark
	darkGems[2] = Flame3GemDark
	darkGems[3] = Flame4GemDark
endfunction

function AddVictim(actor victim)

;; remove after test
	PlayerRef.SetDisplayName("Dolly", true)
;; remove after test
	
	string oldName = victim.GetDisplayName()
	string newName = oldName + " the Scared"
	victim.SetDisplayName(newName, true);
	EL_Utility.Log("Changed victim name from " + oldName + " to " + newName, "EL_PainPit")
	EL_Utility.Log("Trying to add new victim - " + newName, "EL_PainPit")
	int slot = NextVictimSlot()
	if slot == -1
		EL_Utility.Log("Victim not added. No open slots found for " + newName, "EL_PainPit")
		return
	endif
	victimInSlot[slot] = true
	victim.SetGhost()
	victim.SetHeadTracking(false)
	MoveVictimToStart(victim, slot)
	victimsVehicle[slot] = victim.PlaceAtMe(EL_GemDiamond, 1)
	victim.SetRestrained(true)
	victim.SetVehicle(victimsVehicle[slot])
	victims[slot].ForceRefTo(victim)
	Utility.Wait(1.0)
	StartHover(victim, slot)
	EL_Utility.Log(newName + " added in slot" + slot, "EL_PainPit")
endfunction

function MoveVictimToStart(Actor victim, int slot)
	bool victimArrived = victim.PathToReference(victimsStart[slot], 0.25)
	if !victimArrived
		EL_Utility.Log("Victim never arrived at marker.", "EL_PainPit")
	endif
	victim.MoveTo(victimsStart[slot]) ; force move to exact position either way.
endfunction

function StartHover(actor victim, int slot)
	; Debug.SendAnimationEvent(victim, "JumpFall")
	; victim.SetMotionType(victim.Motion_Keyframed)
	EL_Utility.Log("Moving up..", "EL_PainPit")
	victimsVehicle[slot].TranslateTo(victimsStart[slot].X + 50, victimsStart[slot].Y, victimsStart[slot].Z, victimsStart[slot].GetAngleX(), victimsStart[slot].GetAngleY(), victimsStart[slot].GetAngleZ(), 15, 0.0)
	EL_Utility.Log("Moving up finished!", "EL_PainPit")
	utility.wait(10.0) ; change to use OnTranslationComplete later... also check orbit link below!
	victimsVehicle[slot].TranslateTo(victimsMarker[slot].X, victimsMarker[slot].Y, victimsMarker[slot].Z, victimsMarker[slot].GetAngleX(), victimsMarker[slot].GetAngleY(), victimsMarker[slot].GetAngleZ(), 25, 0.0)
endfunction

; https://www.creationkit.com/index.php?title=Spatial_functions_and_snippets
; 

int function NextVictimSlot()
	return victimInSlot.find(false)
endfunction

event OnInit()
	setVictimData()
	setFlamesData()
	setHealingEyeData()
	; RegisterForSingleUpdate(2.0)
endevent


event OnUpdate()
	
endevent





Actor Property PlayerRef  Auto  

Form Property EL_GemDiamond  Auto  
