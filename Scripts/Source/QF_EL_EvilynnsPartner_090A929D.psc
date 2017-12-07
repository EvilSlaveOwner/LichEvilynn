;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_EL_EvilynnsPartner_090A929D Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0)
EL_PartnerStore.Start()
EL_EvilynnStore.Start()
EL_Possessed.GetApi().SetPossessed(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EL_PartnerStore  Auto  

Quest Property EL_EvilynnStore  Auto

Actor  Property PlayerRef Auto
