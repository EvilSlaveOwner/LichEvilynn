;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 153
Scriptname SF_EL_LairVicBunnyScene1_0516D736 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_142
Function Fragment_142()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("Crying")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_146
Function Fragment_146()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("")
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

;BEGIN FRAGMENT Fragment_144
Function Fragment_144()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("Crying")
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

;BEGIN FRAGMENT Fragment_136
Function Fragment_136()
;BEGIN CODE
Debug.MessageBox("The dark and terrifying presence leaves your mind and you sob in relief.\n\nOr, at least you attempt to.\n\nTo your horror, you realize that you still can't move. Her presence has faded, and you still can't control your own body!")
EL_Possessed.Get().ClearPosession()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_140
Function Fragment_140()
;BEGIN CODE
EL_Movement.MoveDirectlyTo(Evilynn.GetReference(), Throne)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
EL_LairScene.Get(0).MoveVictimMove(0, EL_LairVicBunny.GetMainRoomCenter1() , EL_LairVicBunny.GetFNorth())
EL_LairScene.Get(0).MoveVictimMove(1, EL_LairVicBunny.GetMainRoomCenter2() , EL_LairVicBunny.GetFNorth())
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
getowningquest().setstage(20)
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

;BEGIN FRAGMENT Fragment_149
Function Fragment_149()
;BEGIN CODE
(Bunny as EL_ActorSoundState).ChangeState("")
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Player  Auto  

ReferenceAlias Property Evilynn  Auto  

ReferenceAlias Property Bunny  Auto  

ReferenceAlias Property LairEntranceMarker  Auto  

ReferenceAlias Property Cell1Door  Auto  


SPELL Property EL_BoltHarmless  Auto  

ObjectReference Property Throne  Auto  
