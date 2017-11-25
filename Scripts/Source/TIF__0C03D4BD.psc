;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0C03D4BD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(EL_PlayerLastAlignmentChoice)
Game.DisablePlayerControls(true)
GetOwningQuest().Setstage(220)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property EL_PlayerGood  Auto  

Faction Property EL_PlayerEvil  Auto  

Faction Property EL_PlayerLastAlignmentChoice  Auto  
