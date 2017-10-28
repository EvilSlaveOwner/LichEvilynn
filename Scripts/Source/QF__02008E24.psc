;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF__02008E24 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DreamscapeKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DreamscapeKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RugMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RugMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoulStone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoulStone Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
Game.DisablePlayerControls(true)
SetObjectiveCompleted(220)
EL_BeginQuestAlignmentEvilynnEvilPart2.Start()
EL_BeginQuestEvil.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveDisplayed(5)
(Alias_Lynn as EL_ActorEquipBondageGear).Equip()
Game.GetPlayer().MoveTo(Bedroll)
(EL_SceneUtility as EL_SceneUtilityScript).DoFadeOut(0.0)
Bedroll.Activate(Game.GetPlayer())
Game.ForceFirstPerson()
Game.DisablePlayerControls(true)
string Message1 = "A sudden surge of power flashes through you, overwhelming your senses and you instantly lose consciousness ..."
string Message2 = "You regain consciousness in complete darkness.\n\nYou feel something pressed against your face. When you try to move your hands, you realize that your hands are bound with what feels like rope.\n\nYou silently move your writs to your mouth and begin working on the knot."
string Message3 = "You hear two voices.\n\n...one for each of us.\n\nThe other one is yours.\nTie her down and have fun!\n\nI will! Time to go play with my new little toy ..."
string Message4 = "You hear heavy footsteps approaching...\n\nIn a panic you work faster on the knot...\n\nYou manage to free your hands\nand remove the blindfold."
string Message5 = "With relief you see that you\nstill have all your gear!"
string Message6 = "You hear the door creaking open..."
Debug.MessageBox(Message1)
Utility.Wait(2.0)
Debug.MessageBox(Message2)
Utility.Wait(3.0)
Debug.MessageBox(Message3)
Utility.Wait(3.0)
Debug.MessageBox(Message4)
Utility.Wait(2.0)
(EL_SceneUtility as EL_SceneUtilityScript).DoFadeIn(0.0)
Debug.MessageBox(Message5)
Utility.Wait(1.0)
Debug.MessageBox(Message6)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
Game.DisablePlayerControls(true)
SetObjectiveDisplayed(120)
Alias_Evilynn.TryToDisable()
SetObjectiveCompleted(120)
EL_BeginQuestGood.Start()
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Game.DisablePlayerControls(true)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(200)
Alias_Lynn.TryToDisable()
Alias_Bandit1.TryToDisable()
Alias_Bandit2.TryToDisable()
SetStage(210)
(Alias_Lynn as EL_ActorState).ChangeState("")
Game.GetPlayer().AddToFaction(EL_PlayerEvil)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
Game.DisablePlayerControls(true)
Alias_Evilynn.TryToEnable()
Alias_Evilynn.GetActorRef().MoveTo(EL_EvilynnStartMarker)
Alias_Player.GetActorRef().MoveTo(EL_PlayerStartMarker)
EL_BeginQuestAlignmentEvilynnEvil.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
Game.GetPlayer().MoveTo(QuestEndMarker)
Alias_Player.GetActorRef().SetDontMove(false)
Alias_Player.GetActorRef().SetRestrained(false)
Alias_Lynn.GetActorRef().SetRestrained(false)
Game.EnablePlayerControls(true)
Utility.Wait(3)
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeIn(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Game.DisablePlayerControls(true)
SetObjectiveCompleted(200)
SetObjectiveCompleted(220)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Bandit1.GetActorRef().Enable()
Alias_Bandit2.GetActorRef().Enable()
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
Alias_Lynn.TryToEnable()
SoulStone.TryToDisable()
Alias_Lynn.GetActorRef().MoveTo(RugMarker)
debug.SendAnimationEvent(Alias_Lynn.GetActorRef(), "ZazAPC057")
(Alias_Lynn as EL_ActorState).ChangeState("Crying")
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
Alias_Evilynn.TryToEnable()
Alias_Evilynn.GetActorRef().MoveTo(EL_EvilynnStartMarker)
Alias_Player.GetActorRef().MoveTo(EL_PlayerStartMarker)
EL_BeginQuestAlignmentEvilynnGood.Start()
Game.DisablePlayerControls(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(40)
Alias_Lynn.GetActorRef().SetDontMove(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetObjectiveCompleted(40)
Game.DisablePlayerControls(true)
Alias_Bandit1.TryToDisable()
Alias_Bandit2.TryToDisable()
Alias_Lynn.TryToDisable()
SetObjectiveCompleted(100)
SetStage(110)
(Alias_Lynn as EL_ActorState).ChangeState("")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property EL_DreamscapeKey  Auto  

Armor Property Blindfold  Auto  
Armor Property BODY  Auto  
Message Property ChoiceMessage  Auto  
ObjectReference Property QuestEndMarker  Auto  
Faction Property EL_PlayerGood  Auto  
Faction Property EL_PlayerEvil  Auto  
ObjectReference Property BedrollMarker  Auto  
Quest Property EL_BeginQuestEvil  Auto  
Quest Property EL_BeginQuestGood  Auto  

Quest Property EL_SceneUtility  Auto  

Scene Property EL_BeginQuestAlignmentEvilynnGood  Auto



ReferenceAlias Property TortureEquipment  Auto  



ObjectReference Property Bedroll  Auto  

Scene Property EL_BeginQuestAlignmentEvilynnEvil  Auto  

Scene Property EL_BeginQuestAlignmentEvilynnEvilPart2  Auto  

ObjectReference Property RugMarker  Auto  

ReferenceAlias Property SoulStone  Auto  

ObjectReference Property EL_EvilynnStartMarker  Auto  

ObjectReference Property EL_PlayerStartMarker  Auto  
