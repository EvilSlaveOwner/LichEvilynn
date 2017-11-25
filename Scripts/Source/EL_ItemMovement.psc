Scriptname EL_ItemMovement extends Quest  

float startScale = 0.0
float iPosX = -464.0000
float iPosY = 1376.0000
float iPosZ = 48.0000
float iAngleX = 0.0
float iAngleY = 0.0
float iAngleZ = 0.0
float mPosX = 0.0
float mPosY = 0.0
float mPosZ = 0.0
float mAngleX = 0.0
float mAngleY = 0.0
float mAngleZ = 0.0

Form[] items
string[] itemNames

event OnInit()
	items = new Form[100]
	itemNames = new string[100]

	itemNames[0] = "fork"
	items[0] = Game.GetFormFromFile(0x050E9839, "LichEvilynn.esp") as Form
	debug.Notification("[EL_ItemMovement] fork added: " + items[0].GetFormID())
	debug.trace("[EL_ItemMovement] fork added: " + items[0].GetFormID())
endevent

bool function SummonItem(string itemName, float afX, float afY, float afZ, float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0)
	iPosX = afX
	iPosY = afY
	iPosZ = afZ
	iAngleX = afXAngle
	iAngleY = afYAngle
	iAngleZ = afZAngle

	form newItemForm = GetItemByName(itemName)
	if newItemForm == None
		debug.Notification("[EL_ItemMovement] Failed to load " + itemName)
		debug.Trace("[EL_ItemMovement] Failed to load " + itemName)
		return false
	endif

	debug.Notification("[EL_ItemMovement] Creating item " + itemName)
	debug.Trace("[EL_ItemMovement] Creating item " + itemName)
	ObjectReference newItem = Game.GetPlayer().PlaceAtMe(newItemForm)
	newItem.SetPosition(iPosX, iPosY, iPosZ)
	newItem.SetAngle(iAngleX, iAngleY, iAngleZ)
	SetItem(newItem)
	return true
endfunction

Form function GetItemByName(string itemName)
	int totalItems = 100
	int i = 0
	while i < totalItems
		if itemName == itemNames[i]
			debug.Notification("[EL_ItemMovement] get item " + i + " is " + items[i].GetFormID())
			debug.Trace("[EL_ItemMovement] get item " + i + " is " + items[i].GetFormID())
			return items[i]
		endif
		i += 1
	endwhile
	return None
endfunction

function SetItem(ObjectReference item)
	debug.Notification("[EL_ItemMovement] set item " + item.GetFormID())
	debug.Trace("[EL_ItemMovement] set item " + item.GetFormID())
	ItemToMove = item
	FindPosition()
endfunction

function FindPosition()
	startScale = ItemToMove.GetScale()
	iPosX = ItemToMove.GetPositionX()
	iPosY = ItemToMove.GetPositionY()
	iPosZ = ItemToMove.GetPositionZ()
	iAngleX = ItemToMove.GetAngleX()
	iAngleY = ItemToMove.GetAngleY()
	iAngleZ = ItemToMove.GetAngleZ()
	
	mPosX = Marker1.GetPositionX()
	mPosY = Marker1.GetPositionY()
	mPosZ = Marker1.GetPositionZ()
	mAngleX = Marker1.GetAngleX()
	mAngleY = Marker1.GetAngleY()
	mAngleZ = Marker1.GetAngleZ()
endfunction

function Move()
	Debug.Notification("start item move")
	; ItemToMove.SetMotionType(ItemToMove.Motion_Keyframed)
	Utility.Wait(0.1)
	ItemToMove.TranslateTo(-490.5068, 1670.9381, 48.0000, iAngleX, iAngleY, iAngleZ, 25.0, 0)
	; ItemToMove.SetMotionType(ItemToMove.Motion_Dynamic, false)
endfunction

function MoveToMarker()
	Debug.Notification("start item move to marker")
	; ItemToMove.SetMotionType(ItemToMove.Motion_Keyframed)
	Utility.Wait(0.1)
	ItemToMove.TranslateTo(mPosX, mPosY, mPosZ, mAngleX, mAngleY, mAngleZ, 25.0, 0)
	; ItemToMove.SetMotionType(ItemToMove.Motion_Dynamic, false)
endfunction

function Reset()
	ItemToMove.SetPosition(iPosX, iPosY, iPosZ)
	ItemToMove.SetAngle(iAngleX, iAngleY, iAngleZ)
endfunction

ObjectReference Property Marker1  Auto
ObjectReference Property ItemToMove  Auto
