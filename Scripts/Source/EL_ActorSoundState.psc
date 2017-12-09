Scriptname EL_ActorSoundState extends ReferenceAlias  
; (ActorAlias as EL_ActorSoundState).ChangeState("Crying")

Sound EL_WeepingSnd
Sound EL_BreathingSnd
Sound EL_FearBreathingSnd
Sound EL_FlirtyLaughSnd
Sound EL_HappyWhistleSnd
Sound EL_InsaneLaughSnd
Sound EL_NormalLaughSnd
Sound EL_TortureSnd
Sound EL_ScreamingMixedSnd
Sound EL_ShortGiggleSnd
Sound EL_LongGiggleSnd
Sound EL_LoopGiggleSnd

int iEL_WeepingSnd
int iEL_BreathingSnd
int iEL_FearBreathingSnd
int iEL_FlirtyLaughSnd
int iEL_HappyWhistleSnd
int iEL_InsaneLaughSnd
int iEL_NormalLaughSnd
int iEL_TortureSnd
int iEL_ScreamingMixedSnd
int iEL_ShortGiggleSnd
int iEL_LongGiggleSnd
int iEL_LoopGiggleSnd

Faction EL_MakingSound




event OnInit()
	EL_MakingSound = Game.GetFormFromFile(0x051476B7, "LichEvilynn.esp") as Faction

	EL_ShortGiggleSnd = Game.GetFormFromFile(0x0514D44E, "LichEvilynn.esp") as Sound
	EL_LongGiggleSnd = Game.GetFormFromFile(0x0514D44F, "LichEvilynn.esp") as Sound
	EL_LoopGiggleSnd = Game.GetFormFromFile(0x0514D450, "LichEvilynn.esp") as Sound
	EL_BreathingSnd = Game.GetFormFromFile(0x050E3A85, "LichEvilynn.esp") as Sound
	EL_FearBreathingSnd = Game.GetFormFromFile(0x0503A7F, "LichEvilynn.esp") as Sound
	EL_FlirtyLaughSnd = Game.GetFormFromFile(0x051476B3, "LichEvilynn.esp") as Sound
	EL_HappyWhistleSnd = Game.GetFormFromFile(0x051476B4, "LichEvilynn.esp") as Sound
	EL_InsaneLaughSnd = Game.GetFormFromFile(0x051476B5, "LichEvilynn.esp") as Sound
	EL_NormalLaughSnd = Game.GetFormFromFile(0x051476B3, "LichEvilynn.esp") as Sound
	EL_ScreamingMixedSnd = Game.GetFormFromFile(0x050E3A81, "LichEvilynn.esp") as Sound
	EL_TortureSnd = Game.GetFormFromFile(0x050E3A83, "LichEvilynn.esp") as Sound
	EL_WeepingSnd = Game.GetFormFromFile(0x050949BD, "LichEvilynn.esp") as Sound
endevent

State Crying
	Function StartBehaviour()
		if (iEL_WeepingSnd > 0)
			Sound.StopInstance(iEL_WeepingSnd)
		endif
		iEL_WeepingSnd = EL_WeepingSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_WeepingSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State Breathing
	Function StartBehaviour()
		if (iEL_BreathingSnd > 0)
			Sound.StopInstance(iEL_BreathingSnd)
		endif
		iEL_BreathingSnd = EL_BreathingSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_BreathingSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State FearBreathing
	Function StartBehaviour()
		if (iEL_FearBreathingSnd > 0)
			Sound.StopInstance(iEL_FearBreathingSnd)
		endif
		iEL_FearBreathingSnd = EL_FearBreathingSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_FearBreathingSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State FlirtyLaugh
	Function StartBehaviour()
		if (iEL_FlirtyLaughSnd > 0)
			Sound.StopInstance(iEL_FlirtyLaughSnd)
		endif
		iEL_FlirtyLaughSnd = EL_FlirtyLaughSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_FlirtyLaughSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State HappyWhistle
	Function StartBehaviour()
		if (iEL_HappyWhistleSnd > 0)
			Sound.StopInstance(iEL_HappyWhistleSnd)
		endif
		iEL_HappyWhistleSnd = EL_HappyWhistleSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_HappyWhistleSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State InsaneLaugh
	Function StartBehaviour()
		if (iEL_InsaneLaughSnd > 0)
			Sound.StopInstance(iEL_InsaneLaughSnd)
		endif
		iEL_InsaneLaughSnd = EL_InsaneLaughSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_InsaneLaughSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State NormalLaugh
	Function StartBehaviour()
		if (iEL_NormalLaughSnd > 0)
			Sound.StopInstance(iEL_NormalLaughSnd)
		endif
		iEL_NormalLaughSnd = EL_NormalLaughSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_NormalLaughSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State ShortGiggle
	Function StartBehaviour()
		if (iEL_ShortGiggleSnd > 0)
			Sound.StopInstance(iEL_ShortGiggleSnd)
		endif
		iEL_ShortGiggleSnd = EL_ShortGiggleSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_ShortGiggleSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State LongGiggle
	Function StartBehaviour()
		if (iEL_LongGiggleSnd > 0)
			Sound.StopInstance(iEL_LongGiggleSnd)
		endif
		iEL_LongGiggleSnd = EL_LongGiggleSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_LongGiggleSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State LoopGiggle
	Function StartBehaviour()
		if (iEL_LoopGiggleSnd > 0)
			Sound.StopInstance(iEL_LoopGiggleSnd)
		endif
		iEL_LoopGiggleSnd = EL_LoopGiggleSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_LoopGiggleSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State Torture
	Function StartBehaviour()
		if (iEL_TortureSnd > 0)
			Sound.StopInstance(iEL_TortureSnd)
		endif
		iEL_TortureSnd = EL_TortureSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_TortureSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State ScreamingMixed
	Function StartBehaviour()
		if (iEL_ScreamingMixedSnd > 0)
			Sound.StopInstance(iEL_ScreamingMixedSnd)
		endif
		iEL_ScreamingMixedSnd = EL_ScreamingMixedSnd.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_MakingSound)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(iEL_ScreamingMixedSnd)
		GetActorReference().RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

Function ChangeState(string newState)
	if (newState == "Crying")
		behaviour = "Crying"
	elseif (newState == "Breathing")
		behaviour = "Breathing"
	elseif (newState == "FearBreathing")
		behaviour = "FearBreathing"
	elseif (newState == "FlirtyLaugh")
		behaviour = "FlirtyLaugh"
	elseif (newState == "HappyWhistle")
		behaviour = "HappyWhistle"
	elseif (newState == "InsaneLaugh")
		behaviour = "InsaneLaugh"
	elseif (newState == "NormalLaugh")
		behaviour = "NormalLaugh"
	elseif (newState == "ShortGiggle")
		behaviour = "ShortGiggle"
	elseif (newState == "LongGiggle")
		behaviour = "LongGiggle"
	elseif (newState == "LoopGiggle")
		behaviour = "LoopGiggle"
	elseif (newState == "Torture")
		behaviour = "Torture"
	elseif (newState == "ScreamingMixed")
		behaviour = "ScreamingMixed"
	elseif (newState == "")
		behaviour = ""
	else
		Debug.Notification("CHANGE ACTOR STATE: UNKNOWN STATE")
		behaviour = ""
	endif
EndFunction

; ### Behaviour Handling ###
String __behaviour = ""
String Property behaviour
	String Function get()
		return __behaviour
	EndFunction

	Function set(String value)
		__behaviour = value
		EndBehaviour()
		GoToState(__behaviour)
		StartBehaviour()
	EndFunction
EndProperty

Function StartBehaviour()
EndFunction

Function BehaviourOnUpdate()
EndFunction

Function EndBehaviour()
EndFunction

