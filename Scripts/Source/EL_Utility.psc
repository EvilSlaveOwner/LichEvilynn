Scriptname EL_Utility extends Quest  

Actor PlayerRef
int property ToggleFreeCamera auto hidden
int property CancelScreenFade auto hidden
EL_Utility Function Get() Global
	return Game.GetFormFromFile(0x050EF5F2, "LichEvilynn.esp") as EL_Utility
endfunction

EL_Utility Function GetApi() Global
	return Game.GetFormFromFile(0x050EF5F2, "LichEvilynn.esp") as EL_Utility
endfunction

event OnInit()
	SetupSexLab()
	SetDefaults()
endevent

; sexlab stuff
sslSystemConfig Config
sslActorLibrary ActorLib
sslActorStats Stats
Faction sslAnimatingFaction
function SetupSexLab()
	; Reset function Libraries - SexLabQuestFramework
	if !Config || !ActorLib || !Stats
		Form SexLabQuestFramework = Game.GetFormFromFile(0xD62, "SexLab.esm")
		if SexLabQuestFramework
			Config   = SexLabQuestFramework as sslSystemConfig
			ActorLib = SexLabQuestFramework as sslActorLibrary
			Stats    = SexLabQuestFramework as sslActorStats
		endIf
	endIf
	sslAnimatingFaction = Config.AnimatingFaction
endfunction

function SetDefaults()
	PlayerRef = Game.GetPlayer()
	ToggleFreeCamera = 81 ; NUM 3
	CancelScreenFade = 1 ; Escape
	RegisterForKey(CancelScreenFade)
	RegisterForKey(ToggleFreeCamera)
endfunction

; Lock/Unlock Actor
function LockActor(Actor theActor)
	if !theActor
		return
	endIf
	ActorUtil.AddPackageOverride(theActor, EL_DoNothingInScene, 100, 1)
	theActor.SetFactionRank(EL_IsInScene, 1)
	theActor.EvaluatePackage()
	; Disable movement
	if theActor != PlayerRef
		theActor.SetRestrained(true)
		theActor.SetDontMove(true)
	endIf
	theActor.EvaluatePackage()
endfunction

function UnLockActor(Actor theActor)
	theActor.RemoveFromFaction(EL_IsInScene)
	ActorUtil.RemovePackageOverride(theActor, EL_DoNothingInScene)
	theActor.SetFactionRank(EL_IsInScene, 0)
	theActor.EvaluatePackage()
endfunction



; logging
function Log(string messageStr, string prefix = "EL_LichEvilynn") Global
	EL_Utility.GetApi().RunLog(messageStr, prefix)
endfunction

float function GetTimeIn(int days = 0, int hours = 0, int mins = 0) Global
	float fDays = days as float
	float fHours = hours as float
	float fMins = mins as float
	float time = Utility.GetCurrentGameTime() as float
	float newTime = time
	float newHours = 0.0
	newHours += fDays
	newHours = (fMins * (1.0/60.0)) + fHours
	newTime += (newHours / 24.0)
	Log("GetTimeIn / " + time + " / " + newTime, "EL_Utility")
	return newTime
endfunction

; USE BEFORE MOVING TO A NEW LOCATION SO THAT PACKAGES/ACTORS UPDATE CORRECTLY
; IF NOT, IT MAY CAUSE STRANGENESS BECAUSE OF PACKAGES RUNNING PAST EXPECTED END TIMES.
; BASICALLY, THIS ONLY ADJUSTS THE SUN, UNTIL SOMETHING HAPPENS TO TRIGGER AN UPDATE.
function WaitUntilGameTime(int waitTill) Global
	GlobalVariable GameHour = Game.GetForm(0x00000038) as GlobalVariable
	GameHour.SetValue(waitTill as float)
endfunction

; log message
function RunLog(string messageStr, string prefix = "EL_LichEvilynn")
	string logLine = "[" + prefix + "] " + messageStr
	if (EL_ShowDebugNotifications.GetValue() as int) == 1
		Debug.Notification(logLine)
	endif
	if (EL_ShowDebugLogs.GetValue() as int) == 1
		Debug.Trace(logLine)
	endif
endfunction

; hotkeys
event OnKeyDown(int keyCode)
	if Utility.IsInMenuMode() || UI.IsMenuOpen("Console") || UI.IsMenuOpen("Loading Menu")
		if keyCode != CancelScreenFade
			Log("Ignoring keyCode " + keyCode + ", in menu, console, or loading.", "EL_Utility")
		endif
		return
	endif
	if keyCode == CancelScreenFade
		EL_Screen.FadeIn()
	endIf
	if sslAnimatingFaction && PlayerRef.GetFactionRank(sslAnimatingFaction) >= 0
		return
	endif
	if keyCode == ToggleFreeCamera
		SafeToggleFreeCamera()
	endIf
endEvent

;;;;;;;;;;;;;;;;;;;
; camera controls ;
;;;;;;;;;;;;;;;;;;;
function SafeToggleFreeCamera()
	ForceThirdPerson()
	if Game.GetCameraState() != 3
		MiscUtil.SetFreeCameraSpeed(5.0)
	endIf
	Log("Toggle free camera.", "EL_Utility")
	MiscUtil.ToggleFreeCamera()
endfunction

; Toggle freefly camera.
function ToggleFreeCamera(bool stopTime = false) global native

; Set freefly cam speed.
function SetFreeCameraSpeed(float speed) global native

; Set current freefly cam state & set the speed if enabling
function SetFreeCameraState(bool enable, float speed = 10.0) global native

; Set third person camera
Function ForceThirdPerson() native global

; Set first person camera
Function ForceFirstPerson() native global

GlobalVariable Property EL_ShowDebugLogs  Auto 
GlobalVariable Property EL_ShowDebugNotifications  Auto 
Faction Property EL_IsInScene Auto
Package Property EL_DoNothingInScene Auto
 
Actor Property PlayerRef  Auto  
