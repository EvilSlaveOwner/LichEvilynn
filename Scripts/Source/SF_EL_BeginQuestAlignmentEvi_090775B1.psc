;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname SF_EL_BeginQuestAlignmentEvi_090775B1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Game.GetPlayer().AddToFaction(EL_PlayerLastAlignmentFG2)
Evilynn.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Game.DisablePlayerControls(true)
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
Game.DisablePlayerControls(true)
(Alias_Player as EL_AlignmentForceMasturbationAlias).MasturbationEvil(Game.GetPlayer(), RugMarker1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Game.DisablePlayerControls(true)
string Message1 = "With very confusing and mixed feelings you realize that you enjoyed the orgasm as much as Evilynn did."
Debug.MessageBox(Message1)
Game.GetPlayer().RemoveFromFaction(EL_PlayerSexEnd)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Alias Property Alias_Player  Auto  

ObjectReference Property RugMarker1  Auto  

Faction Property EL_PlayerSexEnd  Auto  

Faction Property EL_PlayerLastAlignmentFG2  Auto  

Actor Property Evilynn  Auto  
