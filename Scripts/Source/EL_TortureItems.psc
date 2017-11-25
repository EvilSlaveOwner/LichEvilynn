Scriptname EL_TortureItems extends Quest  

bool isRunning = false

float startScale = 0.0
float iPosX = 0.0
float iPosY = 0.0
float iPosZ = 0.0
float iAngleX = 0.0
float iAngleY = 0.0
float iAngleZ = 0.0

Form[] items
string[] itemNames

ObjectReference ItemToMove

event OnInit()
	items = new Form[100]
	itemNames = new string[100]
	int i = 0

	itemNames[i] = "fork"
	items[i] = Game.GetFormFromFile(0x050E983b, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "knife"
	items[i] = Game.GetFormFromFile(0x050E9839, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "knife_dew"
	items[i] = Game.GetFormFromFile(0x050E983c, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "hammer"
	items[i] = Game.GetFormFromFile(0x050EC70D, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "hook"
	items[i] = Game.GetFormFromFile(0x050EC712, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "hotiron"
	items[i] = Game.GetFormFromFile(0x050EC711, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "iron"
	items[i] = Game.GetFormFromFile(0x050EC710, "LichEvilynn.esp") as Form
	i += 1

	itemNames[i] = "torch"
	items[i] = Game.GetFormFromFile(0x050EC70E, "LichEvilynn.esp") as Form
	i += 1
endevent

bool function SummonItem(string itemName, float afX, float afY, float afZ, float scale = 1.0, float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0)
	if isRunning
		return false
	endif
	isRunning = true
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
	ItemToMove = Game.GetPlayer().PlaceAtMe(newItemForm)
	ItemToMove.SetPosition(iPosX, iPosY, iPosZ)
	ItemToMove.SetAngle(iAngleX, iAngleY, iAngleZ)

	return true
endfunction

Form function GetItemByName(string itemName)
	int totalItems = 100
	int i = 0
	while i < totalItems
		if itemName == itemNames[i]
			return items[i]
		endif
		i += 1
	endwhile
	return None
endfunction

function Move(float afX, float afY, float afZ, float speed = 25.0, float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0, float rSpeed = 0.0)
	Debug.Notification("start item move")
	ItemToMove.TranslateTo(afX, afY, afZ, afXAngle, afYAngle, afZAngle, speed, rSpeed)
endfunction

function MoveToMarker()
	;Debug.Notification("start item move to marker")
	; ItemToMove.SetMotionType(ItemToMove.Motion_Keyframed)
	;Utility.Wait(0.1)
	;ItemToMove.TranslateTo(mPosX, mPosY, mPosZ, mAngleX, mAngleY, mAngleZ, 25.0, 0)
	; ItemToMove.SetMotionType(ItemToMove.Motion_Dynamic, false)
endfunction

function MoveToReset(float speed = 25.0, float rSpeed = 0.0)
	Debug.Notification("start item reset move")
	ItemToMove.TranslateTo(iPosX, iPosY, iPosZ, iAngleX, iAngleY, iAngleZ, speed, rSpeed)
endfunction

function Reset()
	ItemToMove.SetPosition(iPosX, iPosY, iPosZ)
	ItemToMove.SetAngle(iAngleX, iAngleY, iAngleZ)
endfunction
