;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname SF_EL_RapeSceneM1_V1_01_Scen_0519F454 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("ZazAnvilOfBrandingSlave_Enter")
(Victim01 as EL_ActorAnimationState).ChangeByName("WNC_Strappado_Enter")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("ZazAnvilOfBrandingSlave_Loop")
(Victim01 as EL_ActorAnimationState).ChangeByName("WNC_Strappado_Loop")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("ZapSpank01_A2_S3")
(Victim01 as EL_ActorAnimationState).ChangeByName("ZapSpank01_A1_S3")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("ZapSpank01_A2_S1")
(Victim01 as EL_ActorAnimationState).ChangeByName("ZapSpank01_A1_S1")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Victim01.GetActorRef().DispelSpell(ParaSpell)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("ZazAnvilOfBrandingSlave_Exit")
(Victim01 as EL_ActorAnimationState).ChangeByName("WNC_Strappado_Exit")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("ZapSpank01_A2_S2")
(Victim01 as EL_ActorAnimationState).ChangeByName("ZapSpank01_A1_S2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
(Mistress01 as EL_ActorAnimationState).ChangeByName("")
(Victim01 as EL_ActorAnimationState).ChangeByName("")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Mistress01  Auto  

ReferenceAlias Property Victim01  Auto  

SPELL Property ParaSpell  Auto  
