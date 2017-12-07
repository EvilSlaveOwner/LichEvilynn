Scriptname EL_PlayerControl extends Quest  

EL_PlayerControl function Get() Global
	return Game.GetFormFromFile(0x0513BB4E, "LichEvilynn.esp") as EL_PlayerControl
endfunction

function Lock(bool asGhost = true) Global
	EL_PlayerControl.Get().RunLockPlayer(asGhost)
endfunction

function UnLock() Global
	EL_PlayerControl.Get().RunUnLockPlayer()
endfunction

event OnInit()
	RegisterForSingleUpdate(0.4)
endevent

event OnUpdate()
	RunOnUpdate()
	RegisterForSingleUpdate(0.4)
endevent


auto state FREE
	function RunOnUpdate()
	endfunction
	function RunUnLockPlayer()
	endfunction
endstate

state LOCKED
	function RunOnUpdate()
		if Game.IsActivateControlsEnabled() == false
			return ; assuming that if activate is disabled, then all is good.
		endif
		EL_Utility.Log("Player was free... locking player again.", "EL_PlayerControl")
		GotoState("LOCKING")
		Game.EnableFastTravel(false)
		if lockAsGhost
			PlayerREF.SetGhost(true)
		endif
		Game.SetPlayerAIDriven(true)
		if Game.GetCameraState() == 0
			Game.ForceThirdPerson()
			Utility.wait(0.1)
		endif
		Game.DisablePlayerControls(abCamSwitch = true) ; lock controls and prevent camera switching.
		if PlayerREF.IsInCombat()
			PlayerREF.StopCombat()
		endif
		if PlayerREF.IsWeaponDrawn()
			PlayerREF.SheatheWeapon()
		endif
		if PlayerREF.IsSneaking()
			PlayerREF.StartSneaking()
		endif
		PlayerREF.ClearKeepOffsetFromActor()
		GotoState("LOCKED")
	endfunction
	function RunLockPlayer(bool asGhost = true)
	endfunction
endstate

state LOCKING
	function RunOnUpdate()
	endfunction
	function RunUnLockPlayer()
	endfunction
	function RunLockPlayer(bool asGhost = true)
	endfunction
endstate

state UNLOCKING
	function RunOnUpdate()
	endfunction
	function RunUnLockPlayer()
	endfunction
	function RunLockPlayer(bool asGhost = true)
	endfunction
endstate

function RunOnUpdate()
endfunction

function RunLockPlayer(bool asGhost = true)
	GotoState("LOCKING")
	EL_Utility.Log("Locking Player.", "EL_PlayerControl")
	lockAsGhost = asGhost
	; MiscUtil.SetFreeCameraState(false)
	Game.EnableFastTravel(false)
	if lockAsGhost
		PlayerREF.SetGhost(true)
	endif
	Game.SetPlayerAIDriven(true)
	if Game.GetCameraState() == 0
		Game.ForceThirdPerson()
		Utility.wait(0.1)
	endif
	Game.DisablePlayerControls(abCamSwitch = true) ; lock controls and prevent camera switching.
	if PlayerREF.IsInCombat()
		PlayerREF.StopCombat()
	endif
	if PlayerREF.IsWeaponDrawn()
		PlayerREF.SheatheWeapon()
	endif
	if PlayerREF.IsSneaking()
		PlayerREF.StartSneaking()
	endif
	PlayerREF.ClearKeepOffsetFromActor()
	GotoState("LOCKED")
endfunction

function RunUnLockPlayer()
	GotoState("UNLOCKING")
	EL_Utility.Log("Unlocking Player.", "EL_PlayerControl")
	; MiscUtil.SetFreeCameraState(false)
	Game.EnableFastTravel(true)
	Game.SetPlayerAIDriven(false)
	Game.EnablePlayerControls(abCamSwitch = true)
	PlayerREF.SetGhost(false) ; what exactly does set ghost do?
	GotoState("FREE")
endfunction

bool lockAsGhost = true
Actor Property PlayerREF Auto

