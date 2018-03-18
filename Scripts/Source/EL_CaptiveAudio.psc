Scriptname EL_CaptiveAudio extends ReferenceAlias  

event OnInit()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_CaptiveAudio")
endevent

function Initialize()
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
	EL_ChokeSnd = Game.GetFormFromFile(0x0516D749, "LichEvilynn.esp") as Sound
	EL_CoughSnd = Game.GetFormFromFile(0x0516D74A, "LichEvilynn.esp") as Sound
	theCaptive = GetActorReference()
endfunction

function Maintenance()
endfunction

function Capture()
	Initialize()
endfunction



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
Sound EL_ChokeSnd
Sound EL_CoughSnd

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
int iEL_ChokeSnd
int iEL_CoughSnd

Faction EL_MakingSound

Actor theCaptive

State Choke
	Function StartBehaviour()
		if (iEL_ChokeSnd > 0)
			Sound.StopInstance(iEL_ChokeSnd)
		endif
		iEL_ChokeSnd = EL_ChokeSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_ChokeSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State Cough
	Function StartBehaviour()
		if (iEL_CoughSnd > 0)
			Sound.StopInstance(iEL_CoughSnd)
		endif
		iEL_CoughSnd = EL_CoughSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_CoughSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState


State Crying
	Function StartBehaviour()
		if (iEL_WeepingSnd > 0)
			Sound.StopInstance(iEL_WeepingSnd)
		endif
		iEL_WeepingSnd = EL_WeepingSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_WeepingSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State Breathing
	Function StartBehaviour()
		if (iEL_BreathingSnd > 0)
			Sound.StopInstance(iEL_BreathingSnd)
		endif
		iEL_BreathingSnd = EL_BreathingSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_BreathingSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State FearBreathing
	Function StartBehaviour()
		if (iEL_FearBreathingSnd > 0)
			Sound.StopInstance(iEL_FearBreathingSnd)
		endif
		iEL_FearBreathingSnd = EL_FearBreathingSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_FearBreathingSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State FlirtyLaugh
	Function StartBehaviour()
		if (iEL_FlirtyLaughSnd > 0)
			Sound.StopInstance(iEL_FlirtyLaughSnd)
		endif
		iEL_FlirtyLaughSnd = EL_FlirtyLaughSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_FlirtyLaughSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State HappyWhistle
	Function StartBehaviour()
		if (iEL_HappyWhistleSnd > 0)
			Sound.StopInstance(iEL_HappyWhistleSnd)
		endif
		iEL_HappyWhistleSnd = EL_HappyWhistleSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_HappyWhistleSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State InsaneLaugh
	Function StartBehaviour()
		if (iEL_InsaneLaughSnd > 0)
			Sound.StopInstance(iEL_InsaneLaughSnd)
		endif
		iEL_InsaneLaughSnd = EL_InsaneLaughSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_InsaneLaughSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State NormalLaugh
	Function StartBehaviour()
		if (iEL_NormalLaughSnd > 0)
			Sound.StopInstance(iEL_NormalLaughSnd)
		endif
		iEL_NormalLaughSnd = EL_NormalLaughSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_NormalLaughSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State ShortGiggle
	Function StartBehaviour()
		if (iEL_ShortGiggleSnd > 0)
			Sound.StopInstance(iEL_ShortGiggleSnd)
		endif
		iEL_ShortGiggleSnd = EL_ShortGiggleSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_ShortGiggleSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State LongGiggle
	Function StartBehaviour()
		if (iEL_LongGiggleSnd > 0)
			Sound.StopInstance(iEL_LongGiggleSnd)
		endif
		iEL_LongGiggleSnd = EL_LongGiggleSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_LongGiggleSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State LoopGiggle
	Function StartBehaviour()
		if (iEL_LoopGiggleSnd > 0)
			Sound.StopInstance(iEL_LoopGiggleSnd)
		endif
		iEL_LoopGiggleSnd = EL_LoopGiggleSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_LoopGiggleSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State Torture
	Function StartBehaviour()
		if (iEL_TortureSnd > 0)
			Sound.StopInstance(iEL_TortureSnd)
		endif
		iEL_TortureSnd = EL_TortureSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_TortureSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
	EndFunction
EndState

State ScreamingMixed
	Function StartBehaviour()
		if (iEL_ScreamingMixedSnd > 0)
			Sound.StopInstance(iEL_ScreamingMixedSnd)
		endif
		iEL_ScreamingMixedSnd = EL_ScreamingMixedSnd.Play(theCaptive)
		theCaptive.AddToFaction(EL_MakingSound)
	EndFunction
	Function EndBehaviour()
		Sound.StopInstance(iEL_ScreamingMixedSnd)
		theCaptive.RemoveFromFaction(EL_MakingSound)
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
	elseif (newState == "Choke")
		behaviour = "Choke"
	elseif (newState == "Cough")
		behaviour = "Cough"
	elseif (newState == "")
		behaviour = ""
	else
		EL_Utility.Log("CHANGE ACTOR STATE: UNKNOWN STATE", "EL_CaptiveAudio")
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