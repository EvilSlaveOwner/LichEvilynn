;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF__090A929E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
EL_VictimStore.Start()
EL_EvilynnStore.Start()
actor[] victims = new actor[1]
victims[0] = Alias_Player.GetActorRef()
actor[] aggressors = new actor[1]
aggressors[0] = Alias_Evilynn.GetActorRef()
(EL_MainQuestManager as EL_QuestManager).RandomVictimPlayerQuest((Self as Quest), 10, "torture",  victims, aggressors)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
debug.notification("moved to last stage! success!!!!")
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
debug.notification("moved to next stage!")
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
utility.wait(10)

actor[] victims = new actor[1]
victims[0] = Alias_Player.GetActorRef()
actor[] aggressors = new actor[1]
aggressors[0] = Alias_Evilynn.GetActorRef()
(EL_MainQuestManager as EL_QuestManager).RandomVictimPlayerQuest((Self as Quest), 20, "torture",  victims, aggressors)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EL_VictimStore  Auto  

Quest Property EL_EvilynnStore  Auto  

Quest Property EL_EvilynnsVictim  Auto  


Quest Property EL_MainQuestManager  Auto  
