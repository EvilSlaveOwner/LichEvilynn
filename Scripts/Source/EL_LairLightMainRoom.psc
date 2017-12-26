Scriptname EL_LairLightMainRoom extends Quest  

EL_LairLightMainRoom Function Get() Global
	return Game.GetFormFromFile(0x05181FBD, "LichEvilynn.esp") as EL_LairLightMainRoom
endfunction

function Reset()
	EL_LairMainRoomLights.SetValueInt(0)
	EL_LairMainRoomCenterLights.SetValueInt(0)
	EL_LairMainRoomCellsLights.SetValueInt(0)
	UpdateLights()
	(EL_LightMR_003.GetReference() as ObjectReference).EnableNoWait(true)
endfunction

function Room(bool turnOn)
	if turnOn
		EL_LairMainRoomLights.SetValueInt(1)
		EL_LairMainRoomCenterLights.SetValueInt(0)
		EL_LairMainRoomCellsLights.SetValueInt(0)
	else
		EL_LairMainRoomLights.SetValueInt(0)
	endif
	UpdateLights()
endfunction

function Center(bool turnOn)
	if turnOn
		EL_LairMainRoomLights.SetValueInt(0)
		EL_LairMainRoomCenterLights.SetValueInt(1)
		EL_LairMainRoomCellsLights.SetValueInt(0)
	else
		EL_LairMainRoomCenterLights.SetValueInt(0)
	endif
	UpdateLights()
endfunction

function Cells(bool turnOn)
	if turnOn
		EL_LairMainRoomLights.SetValueInt(0)
		EL_LairMainRoomCenterLights.SetValueInt(0)
		EL_LairMainRoomCellsLights.SetValueInt(1)
	else
		EL_LairMainRoomCellsLights.SetValueInt(0)
	endif
	UpdateLights()
endfunction

function UpdateLights()
	Utility.Wait(0.3)
	EL_Utility.Log("Main lights: " + EL_LairMainRoomLights.GetValueInt(), "EL_LairLightMainRoom")
	EL_Utility.Log("Cell lights: " + EL_LairMainRoomCellsLights.GetValueInt(), "EL_LairLightMainRoom")
	EL_Utility.Log("Center lights: " + EL_LairMainRoomCenterLights.GetValueInt(), "EL_LairLightMainRoom")

	if EL_LairMainRoomLights.GetValueInt() == 1
		EL_Utility.Log("Turning on main lair room main lights.", "EL_LairLightMainRoom")
		(EL_LightMR_001.GetReference() as ObjectReference).EnableNoWait()
		(EL_LightMR_002.GetReference() as ObjectReference).EnableNoWait()
		(EL_LightMR_003.GetReference() as ObjectReference).EnableNoWait()
		(EL_LightMR_004.GetReference() as ObjectReference).EnableNoWait()
	else
		EL_Utility.Log("Turning off main lair room main lights.", "EL_LairLightMainRoom")
		(EL_LightMR_001.GetReference() as ObjectReference).DisableNoWait()
		(EL_LightMR_002.GetReference() as ObjectReference).DisableNoWait()
		(EL_LightMR_003.GetReference() as ObjectReference).DisableNoWait()
		(EL_LightMR_004.GetReference() as ObjectReference).DisableNoWait()
	endif
	if EL_LairMainRoomCenterLights.GetValueInt() == 1
		EL_Utility.Log("Turning on main lair room center lights.", "EL_LairLightMainRoom")
		(EL_LightCenter_001.GetReference() as ObjectReference).EnableNoWait()
		(EL_LightCenter_002.GetReference() as ObjectReference).EnableNoWait()
		(EL_LightCenter_003.GetReference() as ObjectReference).EnableNoWait()
	else
		EL_Utility.Log("Turning off main lair room center lights.", "EL_LairLightMainRoom")
		(EL_LightCenter_001.GetReference() as ObjectReference).DisableNoWait()
		(EL_LightCenter_002.GetReference() as ObjectReference).DisableNoWait()
		(EL_LightCenter_003.GetReference() as ObjectReference).DisableNoWait()
	endif
	if EL_LairMainRoomCellsLights.GetValueInt() == 1
		EL_Utility.Log("Turning on main lair room cell lights.", "EL_LairLightMainRoom")
		(EL_LightMR_Cell001.GetReference() as ObjectReference).EnableNoWait()
		(EL_LightMR_Cell002.GetReference() as ObjectReference).EnableNoWait()
	else
		EL_Utility.Log("Turning off main lair room cell lights.", "EL_LairLightMainRoom")
		(EL_LightMR_Cell001.GetReference() as ObjectReference).DisableNoWait()
		(EL_LightMR_Cell002.GetReference() as ObjectReference).DisableNoWait()
	endif
endfunction

GlobalVariable Property EL_LairMainRoomCellsLights  Auto
GlobalVariable Property EL_LairMainRoomCenterLights  Auto
GlobalVariable Property EL_LairMainRoomLights  Auto
ReferenceAlias Property EL_LightMR_001  Auto
ReferenceAlias Property EL_LightMR_002  Auto
ReferenceAlias Property EL_LightMR_003  Auto
ReferenceAlias Property EL_LightMR_004  Auto
ReferenceAlias Property EL_LightMR_Cell001  Auto
ReferenceAlias Property EL_LightMR_Cell002  Auto
ReferenceAlias Property EL_LightCenter_001  Auto
ReferenceAlias Property EL_LightCenter_002  Auto
ReferenceAlias Property EL_LightCenter_003  Auto
