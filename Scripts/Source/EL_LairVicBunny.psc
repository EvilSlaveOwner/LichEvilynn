Scriptname EL_LairVicBunny extends Quest  

EL_LairVicBunny Function Get() Global
	return Game.GetFormFromFile(0x05158F94, "LichEvilynn.esp") as EL_LairVicBunny
endfunction

Actor function GetActor()
	return Alias_Bunny.GetActorReference()
endfunction

function SetActor(Actor newBunny)
	Alias_Bunny.ForceRefTo(newBunny)
endfunction

event OnInit()
	Gear = new Armor[7]
	Gear[0] = Gear1
	Gear[1] = Gear2
	Gear[2] = Gear3
	Gear[3] = Gear4
	Gear[4] = Gear5
	Gear[5] = Gear6
	Gear[6] = Gear7
endevent

function EquipStartingGear()
	EL_ActorManageEquipment bunnyGear = Alias_Bunny as EL_ActorManageEquipment
	int currItem = Gear.Length
	while currItem
		currItem -= 1
		if Gear[currItem] != none
			bunnyGear.AddAndEquipItem(Gear[currItem] as Form)
		endif
	endwhile
	if Weapon1 != none
		bunnyGear.AddAndEquipItem(Weapon1 as Form)
	endif
	if Weapon2 != none
		bunnyGear.AddAndEquipItem(Weapon2 as Form)
	endif
endfunction



;;;;;;;;;;;;;;;;;;;;;
;; Scene Locations ;;
;;;;;;;;;;;;;;;;;;;;;

float[] function GetFNorth() Global
	float[] fNorth = new float[3]
	fNorth[0] = 0.0
	fNorth[1] = 0.0
	fNorth[2] = 0.0
	return fNorth
endfunction

float[] function GetFWest() Global
	float[] fWest = new float[3]
	fWest[0] = 0.0
	fWest[1] = 0.0
	fWest[2] = -90.0
	return fWest
endfunction

float[] function GetFSouth() Global
	float[] fSouth = new float[3]
	fSouth[0] = 0.0
	fSouth[1] = 0.0
	fSouth[2] = -180.0
	return fSouth
endfunction

float[] function GetFEast() Global
	float[] fEast = new float[3]
	fEast[0] = 0.0
	fEast[1] = 0.0
	fEast[2] = 90.0
	return fEast
endfunction

float[] function GetStart1() Global
	float[] start1 = new float[3]
	start1[0] = 0.4810
	start1[1] = 268.1098
	start1[2] = 0.0000
	return start1
endfunction

float[] function GetStart2() Global
	float[] start2 = new float[3]
	start2[0] = 0.4810
	start2[1] = 80.4019
	start2[2] = 0.0000
	return start2
endfunction

float[] function GetMainRoom1() Global
	float[] mainRoom1 = new float[3]
	mainRoom1[0] = -2.9909
	mainRoom1[1] = 1769.7272
	mainRoom1[2] = 0.0000
	return mainRoom1
endfunction

float[] function GetMainLook1() Global
	float[] mainLook1 = new float[3]
	mainLook1[0] = -413.0741
	mainLook1[1] = 2259.9900
	mainLook1[2] = 0.0000
	return mainLook1
endfunction

float[] function GetMainLook2() Global
	float[] mainLook2 = new float[3]
	mainLook2[0] = 655.6280
	mainLook2[1] = 2414.2590
	mainLook2[2] = 0.0000
	return mainLook2
endfunction

float[] function GetCellLook1() Global
	float[] cellLook1 = new float[3]
	cellLook1[0] = 1020.3660
	cellLook1[1] = 2667.5361
	cellLook1[2] = 0.0000
	return cellLook1
endfunction

float[] function GetCellStab() Global
	float[] cellStab = new float[3]
	cellStab[0] = 1025.9379
	cellStab[1] = 2385.4214
	cellStab[2] = 0.0000
	return cellStab
endfunction

float[] function GetFallToInCell() Global
	float[] fallToInCell = new float[3]
	fallToInCell[0] = 1034.6597
	fallToInCell[1] = 3077.3765
	fallToInCell[2] = 0.0000
	return fallToInCell
endfunction

float[] function GetLookInCell() Global
	float[] lookInCell = new float[3]
	lookInCell[0] = 1018.9713
	lookInCell[1] = 2630.6194
	lookInCell[2] = 0.0000
	return lookInCell
endfunction







Armor[] Gear
Armor Property Gear1 Auto
Armor Property Gear2 Auto
Armor Property Gear3 Auto
Armor Property Gear4 Auto
Armor Property Gear5 Auto
Armor Property Gear6 Auto
Armor Property Gear7 Auto
Weapon Property Weapon1 Auto
Weapon Property Weapon2 Auto
ReferenceAlias Property Alias_Bunny  Auto  
