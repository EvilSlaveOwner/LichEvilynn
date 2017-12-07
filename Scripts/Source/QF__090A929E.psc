;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF__090A929E Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
EL_VicRenameQuest.Start()
EL_VicRenameQuest.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted(0)
EL_VictimStore.Start()
EL_EvilynnStore.Start()
EL_Possessed.GetApi().SetPossessed(PlayerRef)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10)
Quest TravelToLair = Game.GetFormFromFile(0x050D5085, "LichEvilynn.esp") as Quest
EL_QuestQueue.AddQuest(TravelToLair, 0, 0, 0, 30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EL_VictimStore  Auto  

Quest Property EL_EvilynnStore  Auto  

Quest Property EL_MainQuestManager  Auto  

Actor Property PlayerRef  Auto  

Quest Property EL_VicRenameQuest  Auto  
