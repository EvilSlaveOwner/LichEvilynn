;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_EL_VicRenameScene_051418F1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
EL_Scene.StopScene(0)
EL_QuestQueue.Unlock()
EL_QuestQueue.AddQuest(GetOwningQuest(), 20, 0, 0, 40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;EL_Movement.AliasJumpDirectlyTo(Alias_EvilynnInvisible, Alias_Player)
EL_Scene.StartScene(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ReferenceAlias Property Alias_EvilynnInvisible Auto
ReferenceAlias Property Alias_Player Auto
