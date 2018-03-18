;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_EL_LairVicBunnyScene1Ques_0516D735 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cell1Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cell1Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bunny
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bunny Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LairEntranceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LairEntranceMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.MessageBox("Moving to stage 30, punshment!")

;EL_Utility.Log("advancing main quest!", "EL_lairVicBunnyScene1Quest")
;(EL_LairVicBunny.Get() as Quest).SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
EL_LairVicBunnyScene1Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
EL_LairVicBunnyScene1.Get().EL_LairVicBunnyScene1Rape.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property EL_LairVicBunnyScene1Scene  Auto  

Quest Property EL_LairVicBunnyScene1Quest  Auto  
