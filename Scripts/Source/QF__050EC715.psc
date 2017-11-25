;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF__050EC715 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(10, false)
SetObjectiveCompleted(20, false)
SetObjectiveDisplayed(10, false)
SetObjectiveDisplayed(20, false)
utility.wait(1)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_7 in script QF_EL_VicTortPlayBall_090BAB5A
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)
;debug.notification("start scene")
;EL_VicTortPlayBallScene1.Start()

debug.notification("start move player")
Game.DisablePlayerControls()
Actor player = Game.GetPlayer()
ObjectReference gotomarker = Game.GetFormFromFile(0x0509A760, "LichEvilynn.esp") as ObjectReference
ObjectReference xmh = Game.GetFormFromFile(0x050D5086, "LichEvilynn.esp") as ObjectReference
debug.notification("marker is " + xmh.GetFormID())
debug.trace("marker is " + xmh.GetFormID())


; place player in area
player.MoveTo(gotomarker)
player.PlaceAtMe(xmh)

; move reference to correct location
xmh.SetPosition(231.9404, 1.6022, 0.0000)
xmh.SetAngle(0.0, 0.0, 270.0000)
	
; move player to reference
player.PathToReference(xmh, 0.75)
player.SetAngle(0.0, 0.0, 270.0000)

debug.notification("start move test")
EL_TortureItems TI = Quest.GetQuest("EL_VicTortSimpleKnife") as EL_TortureItems
TI.SummonItem("knife", 164.8467, 0.9511, 84.2107, 1.0, 270.0, 0.0, 90.0)
while (true)
    TI.Move(216.8231, 0.9511, 84.2107, 25.0, 270.0000, 0.0, 90.0)
    Utility.Wait(15.0)
    TI.Reset()
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
debug.notification("end scene")
SetObjectiveCompleted(10)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest property EL_SceneUtility auto

EL_SceneUtilityScript property SceneUtility
EL_SceneUtilityScript function get()
    return (EL_SceneUtility as EL_SceneUtilityScript)
  endFunction
endProperty
ActorBase Property EL_GhostCamera  Auto  

Scene Property EL_VicTortPlayBallScene1  Auto  

