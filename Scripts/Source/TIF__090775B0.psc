;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__090775B0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(EL_PlayerLastAlignmentChoice)
GetOwningQuest().SetStage(110)
GetOwningQuest().SetObjectiveCompleted(200)
(EL_SceneUtility as EL_SceneUtilityScript).DoFadeOut(0.0)
Game.DisablePlayerControls(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property EL_PlayerLastAlignmentChoice  Auto  

Quest Property EL_SceneUtility  Auto  
