;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname QF_EL_VicTravelToEvilynnsLai_050D5085 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PathEvilynnSleepMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathEvilynnSleepMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathStopOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathStopOne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationBunny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationBunny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathSitMarkerBunny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathSitMarkerBunny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathLookAtOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathLookAtOne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bunny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bunny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathStart
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathStart Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationFurnitureBunny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationFurnitureBunny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathHunterBedroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathHunterBedroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationFurniturePlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationFurniturePlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathStandNearFire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathStandNearFire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathHunterCampLook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathHunterCampLook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Campfire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Campfire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PathEvilynnSitMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PathEvilynnSitMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Mid conversation with bunny/sara
;SetObjectiveCompleted(10)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EL_Utility.Log("Starting quest.", "EL_VicTravelToLair")
Alias_Bunny.TryToEnable()
Alias_Bunny.GetActorRef().SetDisplayName("Sara")
EL_Scene.StartScene(0)
Alias_PathHunterBedroll.TryToEnable()

SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
actor el = Alias_Player.GetActorRef().PlaceActorAtMe(EvilynnInvisibleBase)
Alias_Evilynn.ForceRefTo(el)
Utility.Wait(0.2)
EL_TravelToLairVicStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(30)
Utility.Wait(3.0)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Debug.Notification("start 3rd scene")
EL_Utility.WaitUntilGameTime(8)
Utility.Wait(1.5)
EL_Screen.FadeIn()
EL_Scene.StopScene(0)
EL_QuestQueue.Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; start trip to the lair...
SetObjectiveDisplayed(10)
EL_Utility.WaitUntilGameTime(19) ; change the time to 7pm.
Utility.Wait(0.1)
EL_Movement.AliasJumpDirectlyTo(Alias_Player, Alias_PathStart)
EL_Screen.FadeOut()
Utility.Wait(0.3)
actor el = Alias_Player.GetActorRef().PlaceActorAtMe(EvilynnInvisibleBase)
Alias_Evilynn.ForceRefTo(el)
Debug.MessageBox("This time when Evilynn invades, she settles in, and has full control of your body.\nYou try to struggle against her, but she ignores your efforts.\n\nYou watch, a passenger in your own body, as Evilynn looks for her old lair.\n\nHer anticipation rises as she heads towards a valley to the south of Ivarstead.")
Utility.Wait(0.1)
EL_TravelToLairVicMain.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Scene Property EL_TravelToLairVicStart  Auto  
Scene Property EL_TravelToLairVicMain  Auto  

Quest Property EL_TravelToLairVic  Auto  

ActorBase Property EvilynnInvisibleBase  Auto  
