Scriptname EL_Utility extends Quest  

int property ToggleFreeCamera auto hidden

EL_Utility Function GetApi() Global
	return Game.GetFormFromFile(0x050EF5F2, "LichEvilynn.esp") as EL_Utility
endfunction

event OnInit()
	SetDefaults()
endevent

function SetDefaults()
	ToggleFreeCamera   = 81 ; NUM 3

	RegisterForKey(ToggleFreeCamera)
endfunction

; logging
function Log(string messageStr, string prefix = "EL_LichEvilynn") Global
	EL_Utility.GetApi().ELLog(messageStr, prefix)
endfunction

; log message
function ELLog(string messageStr, string prefix = "EL_LichEvilynn")
	string logLine = "[" + prefix + "] " + messageStr
	if EL_ShowDebugNotifications.GetValue() == 1
		Debug.Notification(logLine)
	endif
	if EL_ShowDebugLogs.GetValue() == 1
		Debug.Trace(logLine)
	endif
endfunction

; hotkeys
event OnKeyDown(int keyCode)
	if Utility.IsInMenuMode() || UI.IsMenuOpen("Console") || UI.IsMenuOpen("Loading Menu")
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