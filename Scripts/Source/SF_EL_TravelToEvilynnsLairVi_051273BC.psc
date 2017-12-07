;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname SF_EL_TravelToEvilynnsLairVi_051273BC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
debug.messagebox("Scene start triggered")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
EL_Scene.StartScene(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
EL_Screen.FadeOut()
PlayerREF.MoveTo(Alias_PathStart.GetReference())
PlayerREF.TranslateToRef(Alias_PathStart.GetReference(), 100.0)
; Alias_PathHunterBedroll.TryToEnable()
; Alias_Bunny.GetActorReference().SetDisplayName("Melissa")
EL_Screen.FadeIn()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ReferenceAlias Property Alias_PathStart Auto
ReferenceAlias Property Alias_PathStopOne Auto
ReferenceAlias Property Alias_PathLookAtOne Auto
ReferenceAlias Property Alias_PathHunterCampLook Auto
Actor Property PlayerREF Auto
