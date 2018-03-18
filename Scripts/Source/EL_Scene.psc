Scriptname EL_Scene extends Quest  

EL_Scene function Get(int getThread) Global
	if getThread == 0
		return Game.GetFormFromFile(0x051244F2, "LichEvilynn.esp") as EL_Scene
	endif
	EL_Utility.Log("Error fetching scene thread " + getThread + ".", "EL_Scene")
endfunction

bool function StartScene(int getThread, bool setIncludesPlayer = true, bool setLockPlayer = true) global
	return EL_Scene.Get(getThread).RunStartScene(setIncludesPlayer, setLockPlayer)
endfunction

bool function StopScene(int getThread) global
	return EL_Scene.Get(getThread).RunStopScene()
endfunction

event OnInit()
endevent

event OnUpdate()
	if SceneRunning
		RunOnUpdate()
		RegisterForSingleUpdate(0.1)
	endif
endevent

function RunOnUpdate()
endfunction

bool function RunStartScene(bool setIncludesPlayer = true, bool setLockPlayer = true)
	includesPlayer = setIncludesPlayer
	lockPlayer = setLockPlayer
	if includesPlayer
		EL_PlayerInScene.SetValue(1.0)
	endif
	EL_Utility.Log("Starting scene " + sceneThread + ".", "EL_Scene")
	if SceneRunning
		EL_Utility.Log("Error - " + sceneThread + " already running, unable to start.", "EL_Scene")
		return false
	endif
	if lockPlayer
		EL_PlayerControl.Lock()
	endif
	SceneRunning = true
	RegisterForSingleUpdate(0.1)
	return true
endfunction

bool function RunStopScene()
	if includesPlayer
		EL_PlayerInScene.SetValue(0.0)
	endif
	EL_Utility.Log("Stopping scene " + sceneThread + ".", "EL_Scene")
	if SceneRunning == false
		EL_Utility.Log("Stopping scene " + sceneThread + " failed, scene not running.", "EL_Scene")
		return false
	endif
	if lockPlayer
		EL_PlayerControl.UnLock()
	endif
	SceneRunning = false
	includesPlayer = false
	lockPlayer = false
	return true
endfunction

bool SceneRunning = false
bool includesPlayer = false
bool lockPlayer = false
int Property sceneThread Auto
Actor Property PlayerREF Auto
GlobalVariable Property EL_PlayerInScene Auto

