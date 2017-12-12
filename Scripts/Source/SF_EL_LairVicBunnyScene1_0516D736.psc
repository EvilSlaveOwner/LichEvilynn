;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 72
Scriptname SF_EL_LairVicBunnyScene1_0516D736 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
EL_LairMarkers.MovePlayer(3.2, 1790.4, 0, 0, 0, 90)
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

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdleNocturnal_LookRight")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
EL_Movement.JumpDirectlyTo(Bunny.GetRef(), EL_LairMarkers.GetBunnyMarker())
EL_LairMarkers.MoveBunny( 1023 , 2901 , 0, 0, 0, 0)
Utility.Wait(0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdleLookFar")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
EL_LairMarkers.MovePlayer( -147.6 , 1925.7 , 0, 0, 0, 45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
EL_LairMarkers.MoveBunny(3.5, 320, 0, 0, 0, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
EL_LairMarkers.MoveBunny( 1023 , 2701 , 0, 0, 0, 0)
EL_LairMarkers.SetLightningTarget(Bunny.GetActorRef())
EL_LairMarkers.MovePlayer( 1023 , 2301 , 0, 0, 0, 0)
Utility.Wait(0.3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("Cough")
Utility.Wait(1.0)
(Bunny as EL_ActorSoundState).ChangeState("")
EL_LairMarkers.MoveBunny(-113.5, -23.4, 0, 0, 0, 90)
Bunny.GetActorRef().SetLookAt(Player.GetActorRef())
Player.GetActorRef().SetLookAt(Bunny.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
Player.GetActorRef().SetLookAt(Cell1Door.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdleNocturnal_LookLeft")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
EL_LairMarkers.MovePlayer( 153.1130 , 1925.7 , 0, 0, 0, 45)
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(EL_LairVicBunny.Get() as Quest).SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
Player.GetActorRef().SetLookAt(Bunny.GetActorRef())
Utility.Wait(0.5)
(Player as EL_ActorAnimationState).ChangeByName("IdlePointClose")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
(Bunny as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EL_Screen.FadeOut()
Cell1Door.GetRef().SetOpen(true)
EL_Movement.AliasMoveDirectlyTo(Bunny, LairEntranceMarker, 100.0)
EL_Movement.AliasMoveDirectlyTo(Player, LairEntranceMarker)
Evilynn.TryToEnable()
Utility.Wait(2.0)
EL_Screen.FadeIn()
Utility.Wait(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
EL_LairMarkers.GetBunnyMarker().PushActorAway(Bunny.GetActorRef(), -200.00)
EL_LairMarkers.MovePlayer( 1023 , 2601 , 0, 0, 0, 0)
Utility.Wait(0.3)
Cell1Door.GetRef().SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdlePointFar_01")
Utility.Wait(3.0)
(Player as EL_ActorAnimationState).ChangeByName("")
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

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Player.GetActorRef().StartSneaking()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Player  Auto  

ReferenceAlias Property Evilynn  Auto  

ReferenceAlias Property Bunny  Auto  

ReferenceAlias Property LairEntranceMarker  Auto  

ReferenceAlias Property Cell1Door  Auto  
