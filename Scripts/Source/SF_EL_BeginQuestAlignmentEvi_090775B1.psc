;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_EL_BeginQuestAlignmentEvi_090775B1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
string Message1 = "With very confusing and mixed feelings you realize that you enjoyed the orgasm as much as Evilynn did."
Debug.MessageBox(Message1)
Game.GetPlayer().RemoveFromFaction(EL_PlayerSexEnd)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
string Message1 = "You can somehow feel Evillynn's cruel grin in your mind."
Debug.MessageBox(Message1)
Utility.Wait(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
string Message1 = "You feel your arms begin to move and you realize that it is not you moving them.\n\nYou can feel your head dip and you can now see down your body.\n\nYou are unable to stop watching as your hands begin unbuckling and removing your armour and gear ..."
string Message2 = "It doesn't take long before you have been stripped naked.\n\nYou feel her enjoyment of the feel of your body as your hands softly glide over your skin as they move over your stomach to softly, gently stroke and cup your breasts.\n\nYou cannot help but enjoy the sensations, becoming aroused yourself."
string Message3 = "You watch one hand move down you body to you pussy,\nfeel your fingers gently part your lips\n\nfeel one of them begin stroking your clit."

Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
Utility.Wait(2)
Debug.MessageBox(Message3)
Utility.Wait(2)
(Alias_Player as EL_AlignmentForceMasturbationAlias).MasturbationEvil(Game.GetPlayer(), RugMarker1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Game.GetPlayer().AddToFaction(EL_PlayerLastAlignmentFG2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Alias Property Alias_Player  Auto  

ObjectReference Property RugMarker1  Auto  

Faction Property EL_PlayerSexEnd  Auto  

Faction Property EL_PlayerLastAlignmentFG2  Auto  
