;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_EL_Test_050EF5E0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BondageBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BondageBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Evilynn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Evilynn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgressorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgressorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Agressor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Agressor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Stage 0
Actor victim = Alias_Player.GetActorReference()
Actor agressor = Alias_Evilynn.GetActorReference()
bool actorsBusy = false
if victim.GetFactionRank(EL_IsBusy) >= 0
	actorsBusy = true
	debug.notification("Victim is busy")
endif
if agressor.GetFactionRank(EL_IsBusy) >= 0
	actorsBusy = true
	debug.notification("Agressor is busy")
endif
if actorsBusy == false
	debug.notification("Resetting Factions")
	victim.AddToFaction(EL_IsBusy)
	agressor.AddToFaction(EL_IsBusy)
	victim.RemoveFromFaction(EL_IsInScene)
	agressor.RemoveFromFaction(EL_IsInScene)
	SetStage(10)
else
	debug.notification("Actor Busy, skipping scene")
	SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Stage 10
ObjectReference bed = Alias_BondageBed.GetReference()
Actor victim = Alias_Player.GetActorReference()
Actor agressor = Alias_Evilynn.GetActorReference()
Game.DisablePlayerControls(true)
;MiscUtil.SetFreeCameraState(true)

if Game.GetCameraState() != 3
	MiscUtil.SetFreeCameraSpeed(10.0)
endIf
MiscUtil.ToggleFreeCamera()

victim.UnequipAll()
agressor.UnequipAll()
zbfBondageShell.GetApi().SetFaceAnimation(victim, 1, 80)
victim.MoveTo(Alias_VictimMarker.GetReference())
agressor.MoveTo(Alias_AgressorMarker.GetReference())
utility.wait(0.2)
zbfUtil.FaceObject(agressor, bed)
zbfUtil.FaceObject(victim, bed)
bed.Activate(victim, false)
utility.wait(0.2)
Alias_Agressor.ForceRefTo(agressor)
Utility.wait(0.2)
Alias_Agressor.TryToEvaluatePackage()
Utility.wait(0.2)


debug.notification("Waiting for scene to play")
float StageStop = Utility.GetCurrentRealTime() + 30
while StageStop > Utility.GetCurrentRealTime()
  Utility.wait(2)
  debug.notification("Scene is playing " + (StageStop - Utility.GetCurrentRealTime()))
endwhile

Utility.wait(1)
Debug.SendAnimationEvent(victim, "IdleForceDefaultState")
Debug.SendAnimationEvent(agressor, "IdleForceDefaultState")
Utility.wait(2)
MiscUtil.SetFreeCameraState(false)
Game.EnablePlayerControls(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Faction Property EL_IsInScene  Auto  

Faction Property EL_IsBusy  Auto  
