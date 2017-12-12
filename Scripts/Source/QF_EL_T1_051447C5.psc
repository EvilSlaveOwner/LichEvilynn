;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_EL_T1_051447C5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
EL_Utility.Log("start", "EL_T1")
utility.wait(5)
EL_T1Scene.Start()
EL_Utility.Log("end", "EL_T1")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
int i = 0
while i < 10
	Debug.MessageBox("Next is state: " + i)
	(Alias_Evilynn as EL_ActorAnimationState).ChangeState("Horny", i)
	Utility.Wait(7.0)
	(Alias_Evilynn as EL_ActorAnimationState).ChangeState("")
	i += 1
	if i == 10
		i = 0
	endif
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property EL_T1Scene  Auto  
