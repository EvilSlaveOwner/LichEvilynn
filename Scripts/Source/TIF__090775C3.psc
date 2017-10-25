;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__090775C3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
string Message1 = "You feel a feathery touch across your mind"
string Message2 = "You suddenly realize that you now know the location of Evilynn's old lair."
Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
Utility.Wait(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
