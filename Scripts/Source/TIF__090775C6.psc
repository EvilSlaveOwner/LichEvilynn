;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__090775C6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
string Message1 = "You hear Evilynn happily laugh, and her presence fades to the back of your mind."
Debug.MessageBox(Message1)
Game.GetPlayer().RemoveFromFaction(EL_PlayerLastAlignmentFG2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property EL_PlayerLastAlignmentFG2  Auto  
