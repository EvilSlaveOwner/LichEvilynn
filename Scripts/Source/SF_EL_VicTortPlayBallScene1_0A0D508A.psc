;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname SF_EL_VicTortPlayBallScene1_0A0D508A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ObjectReference victimMarker = Alias_VictimMarker.GetReference()
actor camerman1 = CameraMarker1.PlaceActorAtMe(EL_GhostCamera)
actor victim1 = Alias_VictimOne.GetActorRef()
camerman1.SetLookAt(victim1, true)
Game.DisablePlayerControls(True, True,True,True, True,True, True, True)
SceneUtility.DoFadeOut(3.0)
SceneUtility.ForceMoveTo(camerman1, CameraMarker1)
SceneUtility.ForceMoveTo(victim1, victimMarker)

camerman1.StopTranslation() ; stop any existing translation that may be taking place

camerman1.SetPosition(CameraMarker1.GetPositionX(),CameraMarker1.GetPositionY(), CameraMarker1.GetPositionZ()) ; set position
camerman1.SetAngle(CameraMarker1.GetAngleX(), CameraMarker1.GetAngleY(), CameraMarker1.GetAngleZ()) ; set rotation
Game.SetCameraTarget(camerman1) ; set target
Game.ForceFirstPerson() ;toggle to first person. Force the game to update the camera when we..
Game.ForceThirdPerson() ;force third person
utility.wait(10)
camerman1.PathToReference(CameraMarker2, 10)
utility.wait(10)
camerman1.PathToReference(CameraMarker3, 10)
utility.wait(10)
Game.EnablePlayerControls()
Game.SetCameraTarget(victim1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Camera1 Auto
ReferenceAlias Property Alias_VictimOne Auto
ReferenceAlias Property Alias_VictimMarker Auto
ReferenceAlias Property Alias_AggressorOne Auto
Quest property EL_SceneUtility auto
ActorBase Property EL_GhostCamera  Auto 
EL_SceneUtilityScript property SceneUtility
EL_SceneUtilityScript function get()
    return (EL_SceneUtility as EL_SceneUtilityScript)
  endFunction
endProperty


ObjectReference Property CameraMarker1 Auto
ObjectReference Property CameraMarker2 Auto
ObjectReference Property CameraMarker3 Auto
