Scriptname EL_ActorTiedUp extends ReferenceAlias  

State TieUp
	Function StartBehaviour()
		Actor victim = GetActorRef()
		victim.SetDontMove()
		If WearItem != None
			victim.AddItem(WearItem, 1, true)
			victim.EquipItem(WearItem, true)
		EndIf
		If WearItem2 != None
			victim.AddItem(WearItem2, 1, true)
			victim.EquipItem(WearItem2, true)
		EndIf
		RegisterForSingleUpdate(5)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Actor victim = GetActorRef()
		victim.SetDontMove(false)
		If WearItem != None
			victim.UnequipItem(WearItem, true)
			victim.RemoveItem(WearItem, 1, true)
		EndIf
		If WearItem2 != None
			victim.UnequipItem(WearItem2, true)
			victim.RemoveItem(WearItem2, 1, true)
		EndIf
	EndFunction
EndState

Function TieUp(String animation)
	Actor victim = GetActorRef()
	debug.SendAnimationEvent(victim, animation)
	behaviour = "TieUp"
EndFunction

Function Free()
	Actor victim = GetActorRef()
	debug.SendAnimationEvent(victim, "IdleForceDefaultState")
	behaviour = ""
EndFunction

Event OnUpdate()
	Actor victim = GetActorRef()
	if (victim != None)
		BehaviourOnUpdate()
	endif
EndEvent

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


Armor Property WearItem Auto
Armor Property WearItem2 Auto