;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_EL_VicTortPlayBall_090BAB5A Extends Quest Hidden

;BEGIN ALIAS PROPERTY CameraMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CameraMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CameraMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CameraMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimOne Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CameraMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CameraMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AggressorOne
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AggressorOne Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_7 in script QF_EL_VicTortPlayBall_090BAB5A
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10, false)
SetObjectiveCompleted(20, false)
SetObjectiveDisplayed(10, false)
SetObjectiveDisplayed(20, false)
utility.wait(20)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest property EL_SceneUtility auto

EL_SceneUtilityScript property SceneUtility
EL_SceneUtilityScript function get()
    return (EL_SceneUtility as EL_SceneUtilityScript)
  endFunction
endProperty
ActorBase Property EL_GhostCamera  Auto  

Scene Property EL_VicTortPlayBallScene1  Auto  
