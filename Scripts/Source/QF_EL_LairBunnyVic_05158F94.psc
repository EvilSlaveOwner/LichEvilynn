;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_EL_LairBunnyVic_05158F94 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LairEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LairEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bunny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bunny Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Notification("Start Lair Bunny Vic!")
EL_Scene.StartScene(0)
EL_Screen.FadeOut()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.MessageBox("Sara heads into the building, excitement shining in her eyes.\n\nYour eyes, under Evilynn's control, follow Sara, as she opens the door and heads inside.\n\nYou can feel amusement, anticipation, and lust radiating from Evilynn as follows sara into her lair.")
Alias_Bunny.TryToEnable()
((Self as Quest) as EL_LairVicBunny).EquipStartingGear()
Utility.Wait(1.0)
EL_Movement.AliasMoveDirectlyTo(Alias_Player, Alias_LairEntranceMarker)
EL_Movement.AliasMoveDirectlyTo(Alias_Bunny, Alias_LairEntranceMarker, 100.0)
Utility.Wait(2.0)
EL_Screen.FadeIn()
EL_Scene.StopScene(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
