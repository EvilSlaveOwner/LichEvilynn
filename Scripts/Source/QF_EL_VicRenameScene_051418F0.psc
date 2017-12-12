;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_EL_VicRenameScene_051418F0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
EL_EvilynnInvisible.DeleteEvilynn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Evilynn.ForceRefTo(EL_EvilynnInvisible.GetEvilynn(Alias_Player))
Utility.Wait(0.1)
EL_VicRenameScene1.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Utility.Wait(2.0)
EL_Utility.Log("Starting rename quest.", "EL_VicRenameQuest")
Alias_Evilynn.ForceRefTo(EL_EvilynnInvisible.GetEvilynn(Alias_Player))
;EL_Movement.AliasJumpDirectlyTo(Alias_Evilynn, Alias_Player)
Utility.Wait(1.2)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_Evilynn.ForceRefTo(EL_EvilynnInvisible.GetEvilynn(Alias_Player))
Utility.Wait(0.1)
EL_Utility.Log("Starting rename quest part 2.", "EL_VicRenameQuest")
EL_VicRenameScene2.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
EL_EvilynnInvisible.DeleteEvilynn()
EL_QuestQueue.Unlock()
EL_EvilynnsVictim.SetStage(20)
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EL_EvilynnsVictim  Auto  

Scene Property EL_VicRenameScene1  Auto  

Scene Property EL_VicRenameScene2  Auto  

ActorBase Property EvilynnInvisibleBase  Auto  
