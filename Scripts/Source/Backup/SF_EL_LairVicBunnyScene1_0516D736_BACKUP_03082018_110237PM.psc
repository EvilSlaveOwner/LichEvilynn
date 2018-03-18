;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 351
Scriptname SF_EL_LairVicBunnyScene1_0516D736 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_131
Function Fragment_131()
;BEGIN CODE
Bunny.GetActorRef().EvaluatePackage()
;Bunny.GetActorRef().KeepOffsetFromActor(Player.GetActorRef(), -50.0, -100.0, 0.0, afCatchUpRadius = 300.00, afFollowRadius = 50.0)
Player.GetActorRef().SetLookAt(Bunny.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_277
Function Fragment_277()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetMainRoomCenter1() , EL_LairVicBunny.GetFNorth())
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetFrontOfThrone() , EL_LairVicBunny.GetFNorth())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_155
Function Fragment_155()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoomSW() , EL_LairVicBunny.GetFEast())
EL_LairScene.Get(0).MoveVictimMove(2, EL_LairVicBunny.GetMainRoomChest() , EL_LairVicBunny.GetFNorth())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_297
Function Fragment_297()
;BEGIN CODE
(Bunny as EL_ActorAnimationState).ChangeByName("IdleExamine")
Utility.Wait(3.0)
(Bunny as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_136
Function Fragment_136()
;BEGIN CODE
;Debug.MessageBox("The dark and terrifying presence leaves your mind and you sob in relief.\n\nOr, at least you attempt to.\n\nTo your horror, you realize that you still can't move. Her presence has faded, and you still can't control your own body!")
;EL_Possessed.Get().ClearPosession()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_301
Function Fragment_301()
;BEGIN CODE
(Bunny as EL_ActorAnimationState).ChangeByName("IdleLookFar")
Utility.Wait(3.0)
(Bunny as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_348
Function Fragment_348()
;BEGIN CODE
Bunny.GetActorRef().ClearKeepOffsetFromActor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_197
Function Fragment_197()
;BEGIN CODE
Player.GetActorRef().PathToReference(Bunny.GetActorRef(), 0.75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_314
Function Fragment_314()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoomNW() , EL_LairVicBunny.GetFNorth())
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

;BEGIN FRAGMENT Fragment_173
Function Fragment_173()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("IdleSearchingChest")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
Bunny.GetActorRef().ClearLookAt()
Player.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_168
Function Fragment_168()
;BEGIN CODE
If Game.GetPlayer().IsWeaponDrawn()
    Game.GetPlayer().SheatheWeapon()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_134
Function Fragment_134()
;BEGIN CODE
EL_LairScene.Get(0).SetAttack(0, Bunny.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_316
Function Fragment_316()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoomNE() , EL_LairVicBunny.GetFNorth())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_180
Function Fragment_180()
;BEGIN CODE
Player.GetActorRef().SetLookAt(Bunny.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_346
Function Fragment_346()
;BEGIN CODE
Bunny.GetActorRef().KeepOffsetFromActor(Player.GetActorRef(), 0.0, -200.0, 0.0, afCatchUpRadius = 50.00, afFollowRadius = 50.0)
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetMainRoomEntrance1(),  EL_LairVicBunny.GetFNorth())
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoomEntrance2(),  EL_LairVicBunny.GetFNorth())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_295
Function Fragment_295()
;BEGIN CODE
(Bunny as EL_ActorAnimationState).ChangeByName("IdleExamine")
Utility.Wait(3.0)
(Bunny as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_279
Function Fragment_279()
;BEGIN CODE
Bunny.GetActorRef().ClearLookAt()
Player.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_263
Function Fragment_263()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoomSW() , EL_LairVicBunny.GetFNorth())
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Bunny.GetActorRef().ClearLookAt()
Player.GetActorRef().ClearLookAt()
getowningquest().setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_176
Function Fragment_176()
;BEGIN CODE
(Player as EL_ActorAnimationState).ChangeByName("")
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

ObjectReference Property Throne  Auto  

SPELL Property theSpell  Auto  

ObjectReference Property ToyChest  Auto  


WEAPON Property HuntingBow  Auto  

WEAPON Property IronDagger  Auto  
