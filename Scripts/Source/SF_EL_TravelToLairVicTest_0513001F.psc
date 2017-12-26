;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 187
Scriptname SF_EL_TravelToLairVicTest_0513001F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_155
Function Fragment_155()
;BEGIN CODE
Alias_LocationFurnitureBunny.ForceRefTo(Alias_PathSitMarkerBunny.GetReference())
Alias_LocationFurniturePlayer.ForceRefTo(Alias_PathEvilynnSitMarker.GetReference())
Debug.SendAnimationEvent(Alias_Player.GetRef(), "IdleWarmHandsCrouched")
Utility.Wait(0.2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Alias_LocationPlayer.TryToClear()
EL_Movement.AliasJumpDirectlyTo(Alias_Bunny, Alias_PathStandNearFireBunny)
Alias_LocationPlayer.ForceRefTo(Alias_PathHunterCampLook.GetReference())
Utility.Wait(0.1)
Debug.SendAnimationEvent(Alias_Bunny.GetRef(), "IdleWarmHandsCrouched")
EL_Utility.Log("End main scene, phase 1.", "EL_TravelToLairVic")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Alias_Bunny.GetActorRef().SetHeadTracking()
(Alias_Player as EL_ActorSoundState).ChangeState("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_107
Function Fragment_107()
;BEGIN CODE
EL_Screen.FadeOut()
Utility.Wait(3.0)
Debug.MessageBox("Evilynn closes her eyes and  falls into a contented sleep.\n\nYou can hear yourself and Sara breathing, but even with Evilynn sleeping, you are completely helpless.\n\nYou try with all your might and, you can't even twitch an eyelid.")
Utility.Wait(3.0)
Debug.MessageBox("You spend hours laying in the dark, a captive in your own body.\n\nYour fury and terror keeping you awake.\n\nDreading what tomorrow will bring.")
Utility.Wait(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_103
Function Fragment_103()
;BEGIN CODE
Alias_LocationFurnitureBunny.ForceRefTo(Alias_PathHunterBedroll.GetReference())
Alias_LocationFurniturePlayer.ForceRefTo(Alias_PathEvilynnSleepMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
Debug.SendAnimationEvent(Alias_Bunny.GetRef(), "IdleStop")
GetOwningQuest().setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_147
Function Fragment_147()
;BEGIN CODE
Debug.SendAnimationEvent(Alias_Player.GetRef(), "IdleWarmHandsStanding")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_105
Function Fragment_105()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_105 in script SF_EL_TravelToLairVicTest_0513001F
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_140
Function Fragment_140()
;BEGIN CODE
Alias_LocationPlayer.ForceRefTo(Alias_PathStandNearFire.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_94
Function Fragment_94()
;BEGIN CODE
Alias_LocationFurniturePlayer.ForceRefTo(Alias_PathEvilynnSitMarker.GetReference())
Debug.SendAnimationEvent(Alias_Player.GetRef(), "IdleStop")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
GetOwningQuest().setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
GetOwningQuest().SetStage(15)
Alias_Bunny.GetActorRef().PlayIdle(IdleWarmHandsCrouched)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
EL_Utility.Log("Starting main scene.", "EL_TravelToLairVic")
Utility.Wait(0.3)
EL_Screen.FadeIn()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Alias_Campfire Auto
ReferenceAlias Property Alias_PathHunterBedroll Auto
ReferenceAlias Property Alias_PathStopOne Auto
ReferenceAlias Property Alias_PathSitMarkerBunny Auto
ReferenceAlias Property Alias_PathStart Auto
ReferenceAlias Property Alias_PathEvilynnSitMarker Auto
ReferenceAlias Property Alias_PathEvilynnSleepMarker Auto
ReferenceAlias Property Alias_PathLookAtOne Auto
ReferenceAlias Property Alias_Player Auto
ReferenceAlias Property Alias_Bunny Auto
ReferenceAlias Property Alias_PathStandNearFire Auto
ReferenceAlias Property Alias_PathHunterCampLook Auto
ReferenceAlias Property Alias_Evilynn Auto
ReferenceAlias Property Alias_PathStandNearFireBunny Auto

ReferenceAlias Property Alias_LocationBunny Auto
ReferenceAlias Property Alias_LocationFurnitureBunny Auto
ReferenceAlias Property Alias_LocationFurniturePlayer Auto
ReferenceAlias Property Alias_LocationPlayer Auto

Quest Property EL_TravelToLairVicQ  Auto 
ReferenceAlias Property Alias_PathEvilynnLayDown Auto

Idle Property IdleWarmHandsCrouched  Auto  
Idle Property IdleWarmHandsStanding  Auto  



Idle Property IdleStop  Auto  
