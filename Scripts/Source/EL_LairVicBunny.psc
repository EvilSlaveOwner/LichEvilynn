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

float[] function GetMainRoomCenter1() Global
	float[] mainRoom1 = new float[3]
	mainRoom1[0] = -65.0
	mainRoom1[1] = 2419.9707
	mainRoom1[2] = 0.0000
	return mainRoom1
endfunction

float[] function GetMainRoomCenter2() Global
	float[] mainRoom1 = new float[3]
	mainRoom1[0] = 65.0
	mainRoom1[1] = 2419.9707
	mainRoom1[2] = 0.0000
	return mainRoom1
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
