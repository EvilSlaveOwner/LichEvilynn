Scriptname EL_SceneUtilityScript extends Quest




;=================================


; OLD CODE, DO NOT USE



;=================================






















;**************************************
; Player and cameraman actors
;**************************************
Actor Property PlayerREF Auto
Actor Property CameramanREF Auto


ImageSpaceModifier Property FadeToBlack auto
ImageSpaceModifier Property FadeFromBlack auto
;**************************************
; Fade out the game and hold
; Once faded, you should move scene actors into place,
; move the cameraman into place, start music, or whatever else happens at the beginning of your scene,
; and then call DoFadeIn to fade back in
; Note that Game.FadeOutGame does not work on its own.
; The image space modifiers are required for a reliable smooth fadeout
; The call to Game.FadeOutGame here simply holds the screen at pure black
; I found that with ENB enabled, I cannot get pure black with the ImageSpaceModifier alone
; without ENB, the call to Game.FadeOutGame is not necessary
;**************************************
Function DoFadeOut(float time)
   FadeToBlack.Apply()
   Utility.Wait(time)
   Game.FadeOutGame(False,True,50, 1)
EndFunction

;**************************************
; Fade the game back in after a call to DoFadeOut
;**************************************
Function DoFadeIn(float time)
   Game.FadeOutGame(False,True,0.1, 0.1)
   FadeToBlack.PopTo(FadeFromBlack)
EndFunction
;**************************************
; Set up a static camera angle using the cameraman actor
; player controls should be completely disabled using Game.DisablePlayerControls
; The marker parameter should be set to an XMarkerHeading reference placed in the editor
; The actor should be set to ghost and have an alpha of 0 (in script)
; The actor should also be defined with the InvisibleRace race (on the actor dialog box)
; The camera can be animated from this position using TranslateToRef
;**************************************
Function StaticCameraman(ObjectReference marker)
   CameramanREF.StopTranslation() ; stop any existing translation that may be taking place
   CameramanREF.SetPosition(marker.X, marker.Y, marker.Z) ; set position
   CameramanREF.SetAngle(marker.GetAngleX(), marker.GetAngleY(), marker.GetAngleZ()) ; set rotation
   Game.SetCameraTarget(CameramanREF) ; set target
   Game.ForceFirstPerson() ;toggle to first person. Force the game to update the camera when we..
   Game.ForceThirdPerson() ;force third person
EndFunction

;**************************************
; Set up a static camera angle using the player actor.
; This version of the static cameraman has the advantage of allowing you to use
; first person view, but it cannot be animated.
; player controls should be completely disabled using Game.DisablePlayerControls
; The marker parameter should be set to an XMarkerHeading reference placed in the editor
; The player should be set to ghost and have an alpha of 0 (in script - and remember to set it back when the scene is done)
;**************************************
Function StaticPlayerCameraman(ObjectReference marker)
   PlayerREF.StopTranslation(); stop any existing translation that might already be taking place
   PlayerREF.SetPosition(marker.X, marker.Y, marker.Z) ;set position
   PlayerREF.SetAngle(marker.GetAngleX(), marker.GetAngleY(), marker.GetAngleZ()); set rotation
   Game.SetCameraTarget(PlayerREF) ;set target
   Game.ForceThirdPerson(); toggle to third person. Force the game to update the camera when we..
   Game.ForceFirstPerson(); force first person
EndFunction

;**************************************
; Force the actor immediately into the position and rotation of the specified marker
; Useful for moving scene actors into place before a camera cut
;**************************************
Function ForceMoveTo(Actor theActor, ObjectReference marker)
   theActor.StopTranslation() ;stop any existing translation that may be taking place
   theActor.SetPosition(marker.X, marker.Y, marker.Z) ;set the actors position to that of the marker
   theActor.SetAngle(marker.GetAngleX(), marker.GetAngleY(), marker.GetAngleZ()) ;set the actor's rotation to that of the marker
EndFunction


Function Example(Actor Actor1, Actor Actor2, Actor Actor3, Actor Actor4, ObjectReference Actor1Start, ObjectReference Actor2Start, ObjectReference Actor3Start, ObjectReference Actor4Start, ObjectReference FixCamera1, ObjectReference AnimCamera1, ObjectReference AnimCamera2, ObjectReference AnimCamera3, ObjectReference AnimCamera4, ObjectReference AnimCamera5, ObjectReference AnimCamera6, ObjectReference AnimCamera7)
	; Here's a script that calls upon those methods to create a short cutscene. It starts with a fixed camera, focusing on some actors walking into place. Then it cuts to another angle, pans around the actors and continues animating to show off a location in the world.

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; start cutscene
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	CameramanREF.Enable()
	CameramanREF.SetAlpha(0.0)
	CameramanREF.SetGhost(true)

	PlayerREF.SetAlpha(0.0)
	PlayerREF.SetGhost(true)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Disable all player controls
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Game.DisablePlayerControls(True, True,True,True, True,True, True, True)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Fade out
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DoFadeOut(3.0)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Move our actors into starting position.
	; These actors have been given AI packages that make
	; them behave how we want them to
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ForceMoveTo(Actor1, Actor1Start)
	ForceMoveTo(Actor2, Actor2Start)
	ForceMoveTo(Actor3, Actor3Start)
	ForceMoveTo(Actor4, Actor4Start)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Set up a static cutscene using the player camera
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	StaticPlayerCameraman(FixCamera1)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Start some music for the scene
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; SceneMusic.Add()

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Fade in
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DoFadeIn(3.0)

	Utility.Wait(12.0)


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;Fade out
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	DoFadeOut(3.0)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Move cameraman into position
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	StaticCameraman(AnimCamera1)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Fade in
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	DoFadeIn(3.0)

	; MyScene.Start(); for now I am only controlling actor dialogue with the quest scene

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Begin camera animation
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	CameramanREF.TranslateToRef(AnimCamera2, 50)
	Utility.Wait(10.0)

	CameramanREF.TranslateToRef(AnimCamera3, 200)
	Utility.Wait(13.0)

	CameramanREF.TranslateToRef(AnimCamera4, 200)
	Utility.Wait(4.0)

	CameramanREF.TranslateToRef(AnimCamera5, 200)
	Utility.Wait(4.0)

	CameramanREF.TranslateToRef(AnimCamera6, 200)
	Utility.Wait(3.0)

	CameramanREF.TranslateToRef(AnimCamera7, 200)
	Utility.Wait(3.0)

	DoFadeOut(2.5)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Re-enable the player
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	CameramanREF.SetGhost(false)
	CameramanREF.SetAlpha(1.0)
	CameramanREF.disable()

	PlayerREF.SetAlpha(1.0)
	PlayerREF.SetGhost(False)
	Game.SetCameraTarget( PlayerREF )
	Game.EnablePlayerControls()

	Utility.Wait(1.0)
	DoFadeIn(2.5)
EndFunction