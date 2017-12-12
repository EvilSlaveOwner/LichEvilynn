Scriptname EL_ActorManageEquipment extends ReferenceAlias  

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