;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0C03D4BF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(EL_PlayerEvil)
GetOwningQuest().SetStage(110)
Game.GetPlayer().AddToFaction(EL_PlayerGood)
Evilynn.EvaluatePackage()
GetOwningQuest().SetObjectiveCompleted(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property EL_PlayerEvil  Auto  

Faction Property EL_PlayerGood  Auto  

Actor Property Evilynn  Auto  
