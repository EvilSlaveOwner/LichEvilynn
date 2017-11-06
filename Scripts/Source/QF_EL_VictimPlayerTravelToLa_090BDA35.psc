;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_EL_VictimPlayerTravelToLa_090BDA35 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
debug.notification("find lair started")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
Utility.Wait(5)
SetObjectiveCompleted(10)
debug.notification("find lair finished")
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
