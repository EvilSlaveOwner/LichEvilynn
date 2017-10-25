;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname SF_EL_BeginQuestAlignmentEvi_090775A6 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
string Message1 = "What in Oblivion?!!? Who are you?! Get out of my mind!"
Debug.MessageBox(Message1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeIn(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Game.GetPlayer().AddToFaction(EL_PlayerLastAlignmentChoice)
Utility.Wait(2)
Evilynn.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
string Message1 = "Your vision fogs and everything goes dark for you as you feel an immensely powerful entity invade your mind and body."
string Message2 = "You hear a voice in your mind, dripping with an evil you've never felt before."
Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
string Message1 = "What is it you want?\n\nHow do I get you out of my head?"
Debug.MessageBox(Message1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property EL_PlayerLastAlignmentChoice  Auto  

Actor Property Evilynn  Auto  
