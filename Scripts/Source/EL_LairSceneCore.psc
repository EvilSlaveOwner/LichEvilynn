Scriptname EL_LairSceneCore extends Quest  

EL_LairScene function Get(int theThread) Global
	if theThread = 0
		return Game.GetFormFromFile(0x0517351C, "LichEvilynn.esp") as EL_LairScene
	else
		EL_Utility.Log("Error fetching LairScene thread " + theThread + ".", "EL_LairScene")
	endif
endfunction

bool function SceneStart(int getThread, bool setIncludesPlayer = true, bool setLockPlayer = true) global
	return EL_LairScene.Get(getThread).RunStartScene(setIncludesPlayer, setLockPlayer)
endfunction

bool function SceneStop(int getThread) global
	return EL_LairScene.Get(getThread).RunStopScene()
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

function SetStartingVariables()
	
endfunction

; MoveTo
ReferenceAlias[] VicActorMoveTo
ReferenceAlias Property VicActor1MoveTo Auto
ReferenceAlias Property VicActor2MoveTo Auto
ReferenceAlias Property VicActor3MoveTo Auto
ReferenceAlias Property VicActor4MoveTo Auto
ReferenceAlias Property VicActor5MoveTo Auto
ReferenceAlias Property VicActor6MoveTo Auto
ReferenceAlias Property VicActor7MoveTo Auto
ReferenceAlias Property VicActor8MoveTo Auto
ReferenceAlias Property VicActor9MoveTo Auto

; Stand
ReferenceAlias VicActorStand  Auto
ReferenceAlias Property VicActor1Stand Auto
ReferenceAlias Property VicActor2Stand Auto
ReferenceAlias Property VicActor3Stand Auto
ReferenceAlias Property VicActor4Stand Auto
ReferenceAlias Property VicActor5Stand Auto
ReferenceAlias Property VicActor6Stand Auto
ReferenceAlias Property VicActor7Stand Auto
ReferenceAlias Property VicActor8Stand Auto
ReferenceAlias Property VicActor9Stand Auto

; Look
ReferenceAlias Property VicActor1LookAlias Auto
ReferenceAlias Property VicActor2LookAlias Auto
ReferenceAlias Property VicActor3LookAlias Auto
ReferenceAlias Property VicActor4LookAlias Auto
ReferenceAlias Property VicActor5LookAlias Auto
ReferenceAlias Property VicActor6LookAlias Auto
ReferenceAlias Property VicActor7LookAlias Auto
ReferenceAlias Property VicActor8LookAlias Auto
ReferenceAlias Property VicActor9LookAlias Auto

; Use
ReferenceAlias Property VicActor1UseAlias Auto
ReferenceAlias Property VicActor2UseAlias Auto
ReferenceAlias Property VicActor3UseAlias Auto
ReferenceAlias Property VicActor4UseAlias Auto
ReferenceAlias Property VicActor5UseAlias Auto
ReferenceAlias Property VicActor6UseAlias Auto
ReferenceAlias Property VicActor7UseAlias Auto
ReferenceAlias Property VicActor8UseAlias Auto
ReferenceAlias Property VicActor9UseAlias Auto

; Attack
ReferenceAlias Property Attack1Alias Auto
ReferenceAlias Property Attack2Alias Auto
ReferenceAlias Property Attack3Alias Auto

bool Running = false
bool HasPlayer = false
bool LockPlayer = false
int Property threadID Auto
Actor Property PlayerREF Auto
GlobalVariable Property EL_PlayerInScene Auto

bool function SceneStart(bool setHasPlayer = true, bool setLockPlayer = true)
	if SceneRunning
		EL_Utility.Log("Error - " + sceneThread + " already running, unable to start.", "EL_Scene")
		return false
	endif
	HasPlayer = setIncludesPlayer
	LockPlayer = setLockPlayer
	if HasPlayer
		EL_PlayerInScene.SetValue(1.0)
	endif
	EL_Utility.Log("Starting scene " + sceneThread + ".", "EL_Scene")
	if LockPlayer
		EL_PlayerControl.Lock()
	endif
	SceneRunning = true
	RegisterForSingleUpdate(0.1)
	return true
endfunction

bool function SceneStop()
	if SceneRunning == false
		EL_Utility.Log("Stopping scene " + sceneThread + " failed, scene not running.", "EL_Scene")
		return false
	endif
	EL_Utility.Log("Stopping scene " + sceneThread + ".", "EL_Scene")
	if LockPlayer
		EL_PlayerControl.UnLock()
	endif
	SceneRunning = false
	HasPlayer = false
	LockPlayer = false
	if HasPlayer
		EL_PlayerInScene.SetValue(0.0)
	endif
	return true
endfunction