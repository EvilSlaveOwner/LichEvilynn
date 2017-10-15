;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF__02008E24 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lynn Auto
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

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; ends when the player kills both bandits...

SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; good guy route
SetObjectiveCompleted(40)
(Alias_Lynn as EL_ActorTiedUp).Free()
Alias_Lynn.GetActorReference().AllowPCDialogue(true)
Game.GetPlayer().MoveTo(QuestEndMarker)
Game.GetPlayer().AddToFaction(EL_PlayerGood)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; ends when the player makes the choice...
int choice = ChoiceMessage.show()
if choice == 0
  SetStage(100)
elseif choice == 1
   SetStage(200)
else 
   debug.messagebox("Lich Evilynn - Error Unknown Option Selected")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; ends when the player walks up to the girl...

SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Alias_Player.RegisterForSleep()
SetObjectiveCompleted(0)
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; one bandit attacks!
; ends when the bandit dies

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player went to sleep... woke up with no memory and an aching head
; player is in a dream
; ends when the player tries to open the door and overhears a conversation in the next room.

SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
(Alias_Lynn as EL_ActorTiedUp).TieUp("ZazAPC057")
Alias_Lynn.GetActorReference().AllowPCDialogue(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; bad guy route
SetObjectiveCompleted(40)
(Alias_Lynn as EL_ActorTiedUp).Free()
Game.GetPlayer().MoveTo(QuestEndMarker)
Game.GetPlayer().AddToFaction(EL_PlayerEvil)
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
