;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_EL_RapeSceneA1_V1_01_Simp_051996BA Extends Quest Hidden

;BEGIN ALIAS PROPERTY Mistress01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mistress01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EL_Utility.Log("Start", "EL_RapeSceneM1_V1_01")
EL_Scene.StartScene(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
EL_Utility.Log("Reset", "EL_RapeSceneM1_V1_01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
EL_RapeSceneM1_V1_01.Get().EndScene()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property Rape_M1_V1_01  Auto  
