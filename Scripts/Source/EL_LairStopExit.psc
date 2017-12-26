Scriptname EL_LairStopExit extends Quest  

ReferenceAlias[] victims
event OnInit()
	victims = new ReferenceAlias[2]
	victims[0] = Victim00
	victims[1] = Victim01
endevent

EL_LairStopExit function Get() Global
	return Game.GetFormFromFile(0x0518DB2C, "LichEvilynn.esp") as EL_LairStopExit
endfunction

function SetVictim(actor theVictim)
	if PlayerRef == theVictim
		EL_PlayerControl.Lock(false)
		PlayerMessage(theVictim)
	else
		VictimMessage(theVictim)
	endif
	ReferenceAlias slot = GetOpenAlias()
	if slot == none
		JustMoveToCenter(theVictim)
		return
	endif
	slot.ForceRefTo(theVictim)
endfunction

function PlayerMessage(Actor theVictim)
	Debug.MessageBox(EL_LairStopExitMessage)
endfunction

function VictimMessage(Actor theVictim)

endfunction

function SetMistress()
	Mistress.ForceRefTo(Evilynn.GetReference())
endfunction

function JustMoveToCenter(actor theVictim)
	theVictim.SetPosition(0.0, 2582.0, 0.0)
	theVictim.SetAngle(0.0, 0.0, 0.0)
endfunction

ReferenceAlias function GetOpenAlias()
	int iVictims = victims.length
	int iIndex = 0
	Actor theVictim = none
	while iIndex < iVictims
		theVictim = victims[iIndex].GetReference() as Actor
		if theVictim == none
			return victims[iIndex]
		endif
		iIndex += 1
	endwhile
	return none
endfunction

ReferenceAlias Property Evilynn  Auto
ReferenceAlias Property Player  Auto
ReferenceAlias Property Mistress  Auto
ReferenceAlias Property Victim00  Auto
ReferenceAlias Property Victim01  Auto
Actor Property PlayerRef Auto


Message Property EL_LairStopExitMessage  Auto  
