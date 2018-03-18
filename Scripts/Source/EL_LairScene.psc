Scriptname EL_LairScene extends Quest  

EL_LairScene function Get(int theThread) Global
	if theThread == 0
		return Game.GetFormFromFile(0x0517351C, "LichEvilynn.esp") as EL_LairScene
	else
		EL_Utility.Log("Error fetching LairScene thread " + theThread + ".", "EL_LairScene")
	endif
endfunction

bool function SceneStart(int theThread, bool setIncludesPlayer = true, bool setLockPlayer = true) global
	return EL_LairScene.Get(theThread).RunSceneStart(setIncludesPlayer, setLockPlayer)
endfunction

bool function SceneStop(int theThread) global
	return EL_LairScene.Get(theThread).RunSceneStop()
endfunction

event OnInit()
	SetStartingVariables()
endevent

event OnUpdate()
	if Running
		RunOnUpdate()
		RegisterForSingleUpdate(0.2)
	endif
endevent

function RunOnUpdate()
endfunction

ObjectReference  function GetMistressMove(int num = 0)
	return MistressMove[num].GetReference()
endfunction

ObjectReference  function GetMistressStand(int num = 0)
	return MistressStand[num].GetReference()
endfunction

ObjectReference  function GetMistressLook(int num = 0)
	return MistressLook[num].GetReference()
endfunction

ObjectReference  function GetMistressUse(int num = 0)
	return MistressUse[num].GetReference()
endfunction

ObjectReference  function GetVictimMove(int num = 0)
	return VictimMove[num].GetReference()
endfunction

ObjectReference  function GetVictimStand(int num = 0)
	return VictimStand[num].GetReference()
endfunction

ObjectReference  function GetVictimLook(int num = 0)
	return VictimLook[num].GetReference()
endfunction

ObjectReference  function GetVictimUse(int num = 0)
	return VictimUse[num].GetReference()
endfunction

ObjectReference  function GetAttack(int num = 0)
	return Attack[num].GetReference()
endfunction

ObjectReference  function GetMistress(int num = 0)
	return Mistress[num].GetReference()
endfunction

ObjectReference  function GetVictim(int num = 0)
	return Victim[num].GetReference()
endfunction

function SetMistressLook(int num = 0, ObjectReference item)
	MistressLook[num].ForceRefTo(item)
endfunction

function SetMistressUse(int num = 0, ObjectReference item)
	MistressUse[num].ForceRefTo(item)
endfunction

function SetVictimLook(int num = 0, ObjectReference item)
	VictimLook[num].ForceRefTo(item)
endfunction

function SetVictimUse(int num = 0, ObjectReference item)
	VictimUse[num].ForceRefTo(item)
endfunction

function SetAttack(int num = 0, ObjectReference item)
	Attack[num].ForceRefTo(item)
endfunction

function SetMistress(int num = 0, ObjectReference item)
	EL_Utility.Log("Adding mistress " + num + " name " + item.GetBaseObject().GetName() + ".", "EL_Scene")
	Mistress[num].ForceRefTo(item)
endfunction
function SetVictim(int num = 0, ObjectReference item)
	SetStartingVariables()
	EL_Utility.Log("Adding victim " + num + " name " + item.GetBaseObject().GetName() + ".", "EL_Scene")
	Victim[num].ForceRefTo(item)
endfunction

function MoveMistressMove(int num, float[] posisition, float[] rotation)
		MoveMarker(GetMistressMove(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveMistressStand(int num, float[] posisition, float[] rotation)
		MoveMarker(GetMistressStand(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveMistressLook(int num, float[] posisition, float[] rotation)
		MoveMarker(GetMistressLook(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveMistressUse(int num, float[] posisition, float[] rotation)
		MoveMarker(GetMistressUse(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveVictimMove(int num, float[] posisition, float[] rotation)
		MoveMarker(GetVictimMove(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveVictimStand(int num, float[] posisition, float[] rotation)
		MoveMarker(GetVictimStand(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveVictimLook(int num, float[] posisition, float[] rotation)
		MoveMarker(GetVictimLook(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveVictimUse(int num, float[] posisition, float[] rotation)
		MoveMarker(GetVictimUse(num), posisition[0], posisition[1], posisition[2], rotation[0], rotation[1], rotation[2])
endfunction

function MoveMarker(ObjectReference marker, float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0)
	EL_Utility.Log("MoveMarker: " + marker.GetName() + " to " + toX + "," + toY + "," + toZ + " " + toAngleX + "," + toAngleY + "," + toAngleZ, "EL_LairScene" + threadID)
	marker.SetPosition(toX, toY, toZ)
	marker.SetAngle(toAngleX, toAngleY, toAngleZ)
endfunction



function SetStartingVariables()
	MistressMove = new ReferenceAlias[3]
	MistressMove[0] = Mistress0Move
	MistressMove[1] = Mistress1Move
	MistressMove[2] = Mistress2Move
	
	MistressStand = new ReferenceAlias[3]
	MistressStand[0] = Mistress0Stand
	MistressStand[1] = Mistress1Stand
	MistressStand[2] = Mistress2Stand
	
	MistressLook = new ReferenceAlias[3]
	MistressLook[0] = Mistress0Look
	MistressLook[1] = Mistress1Look
	MistressLook[2] = Mistress2Look
	
	MistressUse = new ReferenceAlias[3]
	MistressUse[0] = Mistress0Use
	MistressUse[1] = Mistress1Use
	MistressUse[2] = Mistress2Use
	
	VictimMove = new ReferenceAlias[6]
	VictimMove[0] = Victim0Move
	VictimMove[1] = Victim1Move
	VictimMove[2] = Victim2Move
	VictimMove[3] = Victim3Move
	VictimMove[4] = Victim4Move
	VictimMove[5] = Victim5Move
	
	VictimStand = new ReferenceAlias[6]
	VictimStand[0] = Victim0Stand
	VictimStand[1] = Victim1Stand
	VictimStand[2] = Victim2Stand
	VictimStand[3] = Victim3Stand
	VictimStand[4] = Victim4Stand
	VictimStand[5] = Victim5Stand
	
	VictimLook = new ReferenceAlias[6]
	VictimLook[0] = Victim0Look
	VictimLook[1] = Victim1Look
	VictimLook[2] = Victim2Look
	VictimLook[3] = Victim3Look
	VictimLook[4] = Victim4Look
	VictimLook[5] = Victim5Look
	
	VictimUse = new ReferenceAlias[6]
	VictimUse[0] = Victim0Use
	VictimUse[1] = Victim1Use
	VictimUse[2] = Victim2Use
	VictimUse[3] = Victim3Use
	VictimUse[4] = Victim4Use
	VictimUse[5] = Victim5Use

	Attack = new ReferenceAlias[3]
	Attack[0] = Attack0
	Attack[1] = Attack1
	Attack[2] = Attack2
	
	Mistress = new ReferenceAlias[2]
	Mistress[0] = Mistress0
	Mistress[1] = Mistress1
	
	Victim = new ReferenceAlias[3]
	Victim[0] = Victim0
	Victim[1] = Victim1
	Victim[2] = Victim2
endfunction

; Move
ReferenceAlias[] Property VictimMove Auto
ReferenceAlias Property Victim0Move Auto
ReferenceAlias Property Victim1Move Auto
ReferenceAlias Property Victim2Move Auto
ReferenceAlias Property Victim3Move Auto
ReferenceAlias Property Victim4Move Auto
ReferenceAlias Property Victim5Move Auto

; Stand
ReferenceAlias[] Property VictimStand  Auto
ReferenceAlias Property Victim0Stand Auto
ReferenceAlias Property Victim1Stand Auto
ReferenceAlias Property Victim2Stand Auto
ReferenceAlias Property Victim3Stand Auto
ReferenceAlias Property Victim4Stand Auto
ReferenceAlias Property Victim5Stand Auto


; Look
ReferenceAlias[] Property VictimLook Auto
ReferenceAlias Property Victim0Look Auto
ReferenceAlias Property Victim1Look Auto
ReferenceAlias Property Victim2Look Auto
ReferenceAlias Property Victim3Look Auto
ReferenceAlias Property Victim4Look Auto
ReferenceAlias Property Victim5Look Auto


; Use
ReferenceAlias[] Property VictimUse Auto
ReferenceAlias Property Victim0Use Auto
ReferenceAlias Property Victim1Use Auto
ReferenceAlias Property Victim2Use Auto
ReferenceAlias Property Victim3Use Auto
ReferenceAlias Property Victim4Use Auto
ReferenceAlias Property Victim5Use Auto


; Move
ReferenceAlias[] Property MistressMove Auto
ReferenceAlias Property Mistress0Move Auto
ReferenceAlias Property Mistress1Move Auto
ReferenceAlias Property Mistress2Move Auto


; Stand
ReferenceAlias[] Property MistressStand  Auto
ReferenceAlias Property Mistress0Stand Auto
ReferenceAlias Property Mistress1Stand Auto
ReferenceAlias Property Mistress2Stand Auto


; Look
ReferenceAlias[] Property MistressLook Auto
ReferenceAlias Property Mistress0Look Auto
ReferenceAlias Property Mistress1Look Auto
ReferenceAlias Property Mistress2Look Auto


; Use
ReferenceAlias[] Property MistressUse Auto
ReferenceAlias Property Mistress0Use Auto
ReferenceAlias Property Mistress1Use Auto
ReferenceAlias Property Mistress2Use Auto


; Attack
ReferenceAlias[] Property Attack Auto
ReferenceAlias Property Attack0 Auto
ReferenceAlias Property Attack1 Auto
ReferenceAlias Property Attack2 Auto

; Mistress
ReferenceAlias[] Property Mistress Auto
ReferenceAlias Property Mistress0  Auto  
ReferenceAlias Property Mistress1  Auto  

; Victim
ReferenceAlias[] Property Victim Auto
ReferenceAlias Property Victim0  Auto  
ReferenceAlias Property Victim1  Auto  
ReferenceAlias Property Victim2  Auto  

bool Property Running = false Auto
bool Property HasPlayer = false Auto
bool Property LockPlayer = false Auto
int Property threadID Auto
Actor Property PlayerREF Auto
GlobalVariable Property EL_PlayerInScene Auto

bool function RunSceneStart(bool setHasPlayer = true, bool setLockPlayer = true)
	if Running
		EL_Utility.Log("Error - " + threadID + " already running, unable to start.", "EL_Scene")
		return false
	endif
	Running = true
	HasPlayer = setHasPlayer
	LockPlayer = setLockPlayer
	if HasPlayer
		EL_PlayerInScene.SetValue(1.0)
	endif
	EL_Utility.Log("Starting scene " + threadID + ".", "EL_Scene")
	if LockPlayer
		EL_PlayerControl.Lock()
	endif
	RegisterForSingleUpdate(0.1)
	return true
endfunction

bool function RunSceneStop()
	if Running == false
		EL_Utility.Log("Stopping scene " + threadID + " failed, scene not running.", "EL_Scene")
		return false
	endif
	EL_Utility.Log("Stopping scene " + threadID + ".", "EL_Scene")
	if LockPlayer
		EL_PlayerControl.UnLock()
	endif
	HasPlayer = false
	LockPlayer = false
	if HasPlayer
		EL_PlayerInScene.SetValue(0.0)
	endif
	Running = false
	return true
endfunction


Faction Property  EL_IsInScene auto
