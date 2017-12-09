;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_EL_VicRenameScene2_051418F5 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
EL_Scene.StartScene(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
PlayerRef.GetBaseObject().SetName("Dolly")
GetOwningQuest().SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetObjectiveCompleted(10)
GetOwningQuest().SetObjectiveCompleted(20)
GetOwningQuest().SetStage(100)
EL_QuestQueue.Unlock()
EL_Scene.StopScene(0)
Utility.Wait(5.0)
(Player as EL_ActorSoundState).ChangeState("")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Alias Property Evilynn  Auto  

ReferenceAlias Property Player  Auto  
