;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 66
Scriptname SF_EL_LairVicBunnyScene1Rape_051E5748 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;EL_Screen.FadeOut()
EL_LairVicBunnyScene1.Get().GoToSexLabStage(3)
Debug.MessageBox("Evilynn's pleasure is interrupted when Sara suddenly bites down hard.\n\nAgony radiates from your pussy as Sara sinks her teeth into your sensitive flesh.")
EL_CaptivesTats.SetTatOnActor(Bunny.GetActorRef(), "EL_Tears2")
EL_CaptivesTats.SetTatOnActor(Player.GetActorRef(), "EL_TorturedPussy")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Bunny.GetActorRef().ClearLookAt()
Player.GetActorRef().ClearLookAt()
EL_LairVicBunnyQuest.setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
EL_LairVicBunnyScene1.Get().FirstRape()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
Debug.MessageBox("Evilynn rips away from Sara's teeth.\nYou can't even scream when your flesh tears.\n")
EL_LairVicBunnyScene1.Get().EndAnimation(true)
Utility.Wait(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
EL_LairVicBunnyScene1.Get().GoToSexLabStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
Evilynn.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EL_LairVicBunnyQuest  Auto  

ReferenceAlias Property Bunny  Auto  

ReferenceAlias Property Player  Auto  

ReferenceAlias Property Evilynn  Auto  
