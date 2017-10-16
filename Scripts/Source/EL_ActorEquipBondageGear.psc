Scriptname EL_ActorEquipBondageGear extends ReferenceAlias  

State Equip
	Function StartBehaviour()
		Actor victim = GetActorRef()
		victim.SetDontMove()
		If WearItem1 != None
			victim.AddItem(WearItem1, 1, true)
			victim.EquipItem(WearItem1, true)
		EndIf
		If WearItem2 != None
			victim.AddItem(WearItem2, 1, true)
			victim.EquipItem(WearItem2, true)
		EndIf
		If WearItem3 != None
			victim.AddItem(WearItem3, 1, true)
			victim.EquipItem(WearItem3, true)
		EndIf
		If WearItem4 != None
			victim.AddItem(WearItem4, 1, true)
			victim.EquipItem(WearItem4, true)
		EndIf
		If WearItem5 != None
			victim.AddItem(WearItem5, 1, true)
			victim.EquipItem(WearItem5, true)
		EndIf
		If WearItem6 != None
			victim.AddItem(WearItem6, 1, true)
			victim.EquipItem(WearItem6, true)
		EndIf
		If WearItem7 != None
			victim.AddItem(WearItem7, 1, true)
			victim.EquipItem(WearItem7, true)
		EndIf
		; RegisterForSingleUpdate(5)
	EndFunction

	Function BehaviourOnUpdate()
		; nothing currently.
		; RegisterForSingleUpdate(5)
	EndFunction

	Function EndBehaviour()
		Actor victim = GetActorRef()
		victim.SetDontMove(false)
		If WearItem1 != None
			victim.UnequipItem(WearItem1, true)
			victim.RemoveItem(WearItem1, 1, true)
		EndIf
		If WearItem2 != None
			victim.UnequipItem(WearItem2, true)
			victim.RemoveItem(WearItem2, 1, true)
		EndIf
		If WearItem3 != None
			victim.UnequipItem(WearItem3, true)
			victim.RemoveItem(WearItem3, 1, true)
		EndIf
		If WearItem4 != None
			victim.UnequipItem(WearItem4, true)
			victim.RemoveItem(WearItem4, 1, true)
		EndIf
		If WearItem5 != None
			victim.UnequipItem(WearItem5, true)
			victim.RemoveItem(WearItem5, 1, true)
		EndIf
		If WearItem6 != None
			victim.UnequipItem(WearItem6, true)
			victim.RemoveItem(WearItem6, 1, true)
		EndIf
		If WearItem7 != None
			victim.UnequipItem(WearItem7, true)
			victim.RemoveItem(WearItem7, 1, true)
		EndIf
	EndFunction
EndState

Function Equip()
	behaviour = "Equip"
EndFunction

Function ClearEquip()
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


Armor Property WearItem1 Auto
Armor Property WearItem2 Auto
Armor Property WearItem3 Auto
Armor Property WearItem4 Auto
Armor Property WearItem5 Auto
Armor Property WearItem6 Auto
Armor Property WearItem7 Auto