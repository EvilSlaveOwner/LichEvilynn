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
