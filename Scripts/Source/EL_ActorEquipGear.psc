Scriptname EL_ActorEquipGear Extends ReferenceAlias

event OnLoad()
	GetDressed()
endevent

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

function GetDressed()
	int currItem = Gear.Length
	while currItem
		currItem -= 1
		if Gear[currItem] != none
			AddAndEquipItem(Gear[currItem] as Form)
		endif
	endwhile
	if Weapon1 != none
		AddAndEquipItem(Weapon1 as Form)
	endif
	if Weapon2 != none
		AddAndEquipItem(Weapon2 as Form)
	endif
endfunction

function Strip()
int currItem = Gear.Length
	while currItem
		currItem -= 1
		if Gear[currItem] != none
			RemoveAndUnEquipItem(Gear[currItem] as Form)
		endif
	endwhile
	if Weapon1 != none
		RemoveAndUnEquipItem(Weapon1 as Form)
	endif
	if Weapon2 != none
		RemoveAndUnEquipItem(Weapon2 as Form)
	endif
endfunction

function RemoveAndUnEquipItem(Form item)
	Actor theActor = Self.GetActorReference()
	theActor.UnEquipItem(item, true, true)
	theActor.RemoveItem(item, theActor.GetItemCount(item), true)	
endfunction

function AddAndEquipItem(Form item)
	Actor theActor = Self.GetActorReference()
	if theActor.GetItemCount(item) == 0
		theActor.AddItem(item, 1, true)
	endif
	theActor.EquipItem(item, true, true)
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
