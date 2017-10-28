Scriptname EL_ActorState extends ReferenceAlias  
; (ActorAlias as EL_ActorState).ChangeState("Crying")

State Crying
	Function StartBehaviour()
		if (cryingSoundID > 0)
			Sound.StopInstance(cryingSoundID)
		endif
		cryingSoundID = CryingSound.Play(GetActorReference())
		GetActorReference().AddToFaction(EL_Crying)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Sound.StopInstance(cryingSoundID)
		GetActorReference().RemoveFromFaction(EL_Crying)
	EndFunction
EndState

Function ChangeState(string newState)
	if (newState == "Crying")
		behaviour = "Crying"
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

int cryingSoundID = 0
Faction Property EL_Crying  Auto  
Sound Property CryingSound  Auto  