;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname SF_EL_VicTravelToLairMorning_0514D451 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_5 in script SF_EL_VicTravelToLairMorning_0514D451
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Bunny.GetActorRef().SetLookAt(LairDoor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
LocationPlayer.ForceRefTo(TravelToLairMarker4.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
LocationPlayer.ForceRefTo(LairCastOnStone.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player.GetActorRef().EquipSpell(LairSummoned, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
LocationPlayer.ForceRefTo(TravelToLairMarker1.GetReference())
Debug.SendAnimationEvent(Bunny.GetRef(), "IdleStop")
Debug.SendAnimationEvent(Player.GetRef(), "IdleStop")
Utility.Wait(1.5)
EL_Screen.FadeIn()
Utility.Wait(0.3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
Debug.SendAnimationEvent(Bunny.GetRef(), "IdleStop")
Utility.Wait(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetObjectiveCompleted(70)
GetOwningQuest().SetStage(100)
Bunny.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ReferenceAlias Property Bunny Auto

ReferenceAlias Property LocationPlayer Auto
ReferenceAlias Property LairCastOnStone Auto
ReferenceAlias Property TravelToLairMarker1 Auto
ReferenceAlias Property TravelToLairMarker4 Auto
ReferenceAlias Property Player Auto
ReferenceAlias Property Evilynn Auto

SPELL Property LairSummoned  Auto  

ReferenceAlias Property LairDoor  Auto  
