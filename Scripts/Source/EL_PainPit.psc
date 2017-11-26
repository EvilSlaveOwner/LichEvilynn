Scriptname EL_PainPit extends Quest  

; Fetch CaptiveMovement API
EL_PainPit function GetApi() Global
	return Game.GetFormFromFile(0x05106DEE, "LichEvilynn.esp") as EL_PainPit
endfunction

ObjectReference[] flames
ObjectReference[] lightGems
ObjectReference[] darkGems
event OnInit()
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

	
	RegisterForSingleUpdate(2.0)
endevent
int flameToUpdate = 0
Event OnUpdate()
	ObjectReference flame
	string toggleMessage = "from on to off"
	if flames[flameToUpdate].IsDisabled()
		toggleMessage = "from off to on"
	endif
	EL_Utility.Log("Flame " + flameToUpdate + " toggle " + toggleMessage, "EL_PainPit")
	ToggleFlame(flameToUpdate)
	flameToUpdate += 1
	if flameToUpdate > 3
		flameToUpdate = 0
	endif
    RegisterForSingleUpdate(3)
endevent

function ToggleFlame(int flameNumber)
	if flames[flameNumber].IsDisabled()
		lightGems[flameNumber].Enable(false)
		darkGems[flameNumber].Disable(false)
		flames[flameNumber].Enable(false)
	else
		darkGems[flameNumber].Enable(false)
		lightGems[flameNumber].Disable(false)
		flames[flameNumber].Disable(false)
	endif
endfunction

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