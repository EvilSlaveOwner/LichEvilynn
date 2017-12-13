;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 133
Scriptname SF_EL_LairVicBunnyScene1_0516D736 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdleLookFar")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetMainLook1() , EL_LairVicBunny.GetFWest())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoom1(), EL_LairVicBunny.GetFNorth())
(Player as EL_ActorAnimationState).ChangeByName("IdleTake")
Cell1Door.GetRef().SetOpen(true)
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetStart1() , EL_LairVicBunny.GetFNorth())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetMainRoom1() , EL_LairVicBunny.GetFNorth())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
getowningquest().setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_95
Function Fragment_95()
;BEGIN CODE
EL_Possessed.Get().ClearPosession(Player.GetActorRef())
EL_LairScene.Get(0).MoveMistressMove(0, EL_LairVicBunny.GetLookInCell(), EL_LairVicBunny.GetFNorth())
EL_Movement.MoveDirectlyTo(Evilynn.GetRef(), EL_LairScene.Get(0).GetMistressMove(0))
Evilynn.GetActorRef().SetLookAt(Bunny.GetActorRef())
(Bunny as EL_ActorSoundState).ChangeState("FearBreathing")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
Player.GetActorRef().SetLookAt(Bunny.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetLookInCell() , EL_LairVicBunny.GetFNorth())
Player.GetActorRef().EquipSpell(EL_BoltHarmless, 1)
EL_BoltHarmless.Cast(Player.GetRef(), Bunny.GetRef())
EL_LairScene.Get(0).GetVictimMove(1).PushActorAway(Bunny.GetActorRef(), -100.00)
Utility.Wait(0.5)
Player.GetActorRef().UnequipSpell(EL_BoltHarmless, 1)
Cell1Door.GetRef().SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetCellLook1() , EL_LairVicBunny.GetFEast())
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetCellStab() , EL_LairVicBunny.GetFEast())
EL_LairScene.Get(0).SetAttack(0, Bunny.GetActorRef())
Utility.Wait(0.3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_92
Function Fragment_92()
;BEGIN CODE
Bunny.GetActorRef().SetLookAt(Player.GetActorRef())
EL_Movement.RotateToFace(Player.GetActorRef(), Bunny.GetActorRef(), 50.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("Cough")
Utility.Wait(1.0)
(Bunny as EL_ActorSoundState).ChangeState("")
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetStart2() , EL_LairVicBunny.GetFEast())
Bunny.GetActorRef().SetLookAt(Player.GetActorRef())
Player.GetActorRef().SetLookAt(Bunny.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
EL_LairScene.Get(0).SetAttack(0, Bunny.GetActorRef())
Player.GetActorRef().SetLookAt(Bunny.GetActorRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_102
Function Fragment_102()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("Crying")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdlePointClose")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
Player.GetActorRef().SetLookAt(Cell1Door.GetRef(), true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdleLookFar")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetMainLook2() , EL_LairVicBunny.GetFEast())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
(Bunny as EL_ActorAnimationState).ChangeByName("IdleExamine")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
(Bunny as EL_ActorAnimationState).ChangeByName("")
EL_Movement.RotateToFace(Player.GetActorRef(), Bunny.GetActorRef(), 50.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
EL_Movement.JumpDirectlyTo(Bunny.GetRef(), EL_LairMarkers.GetBunnyMarker())
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetFallToInCell() , EL_LairVicBunny.GetFSouth())
Utility.Wait(0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_105
Function Fragment_105()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("Crying")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EL_Screen.FadeOut()
EL_Movement.AliasMoveDirectlyTo(Bunny, LairEntranceMarker, 100.0)
EL_Movement.AliasMoveDirectlyTo(Player, LairEntranceMarker)
Evilynn.TryToEnable()
Utility.Wait(2.0)
EL_Screen.FadeIn()
Utility.Wait(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Player.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_104
Function Fragment_104()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
Player.GetActorRef().SetLookAt(Bunny.GetActorRef())
EL_Movement.RotateToFace(Player.GetActorRef(), Bunny.GetActorRef(), 50.0)
Utility.Wait(1.5)
(Player as EL_ActorAnimationState).ChangeByName("IdleWave")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
EL_Movement.RotateToFace(Player.GetActorRef(), Cell1Door.GetRef(), 50.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_129
Function Fragment_129()
;BEGIN CODE
Bunny.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_131
Function Fragment_131()
;BEGIN CODE
Bunny.GetActorRef().SetLookAt(Player.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Player  Auto  

ReferenceAlias Property Evilynn  Auto  

ReferenceAlias Property Bunny  Auto  

ReferenceAlias Property LairEntranceMarker  Auto  

ReferenceAlias Property Cell1Door  Auto  


SPELL Property EL_BoltHarmless  Auto  
