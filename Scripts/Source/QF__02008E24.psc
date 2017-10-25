;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname QF__02008E24 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RugMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RugMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DreamscapeKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DreamscapeKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alias_TortureEquipment
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alias_TortureEquipment Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
Alias_Evilynn.TryToDisable()
SetObjectiveCompleted(120)
EL_BeginQuestGood.Start()
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
Alias_Player.GetActorRef().SetRestrained(true)
string Message1 = "A sudden surge of power flashes through you, overwhelming your senses and you instantly lose consciousness ..."
string Message2 = "… you regain consciousness in complete darkness.\n\nYou feel something pressed against your face. When you try to move your hands, you realize that your hands are bound with what feels like rope.\n\nYou silently move your writs to your mouth and begin working on the knot."
string Message3 = "You hear two voices.\n\n...one for each of us.\n\nThe other one is yours.\nTie her down and have fun!\n\nI will! Time to go play with my new little toy ..."
string Message4 = "You hear heavy footsteps approaching...\n\nIn a panic you work faster on the knot...\n\nYou manage to free your hands\nand remove the blindfold.\nWith relief you see that you\nstill have all your gear!"
string Message5 = "You hear the door creaking open...\n\nThinking quickly you fake being unconscious until you hear the footsteps coming close enough ..."
Debug.MessageBox(Message1)
Utility.Wait(2.0)
Debug.MessageBox(Message2)
Utility.Wait(3.0)
Debug.MessageBox(Message3)
Utility.Wait(3.0)
Debug.MessageBox(Message4)
(EL_SceneUtility as EL_SceneUtilityScript).DoFadeIn(0.0)
Utility.Wait(2.0)
Debug.MessageBox(Message5)
Utility.Wait(1.0)
Game.GetPlayer().SetRestrained(false)
SetStage(10)
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
TortureEquipment.GetReference().Activate(Alias_Lynn.GetActorRef(), true)
Alias_Lynn.GetActorRef().SetRestrained(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
SetObjectiveDisplayed(200)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(220)
SetObjectiveCompleted(220)
SetStage(300)
EL_BeginQuestEvil.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
Alias_Evilynn.TryToEnable()
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
Utility.Wait(3)
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeIn(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
Alias_Evilynn.TryToEnable()
EL_BeginQuestAlignmentEvilynnGood.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetObjectiveCompleted(40)
Alias_Bandit1.TryToDisable()
Alias_Bandit2.TryToDisable()
Alias_Lynn.TryToDisable()
TortureEquipment.TryToDisable()
SetObjectiveCompleted(100)
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(200)
Alias_Lynn.TryToDisable()
Alias_Bandit1.TryToDisable()
Alias_Bandit2.TryToDisable()
TortureEquipment.TryToDisable()
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
SetObjectiveCompleted(220)
EL_BeginQuestAlignmentEvilynnEvilPart2.Start()
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
