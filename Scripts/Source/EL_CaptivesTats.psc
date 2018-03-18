Scriptname EL_CaptivesTats extends Quest  

EL_Captives property Captives auto hidden

EL_CaptivesTats function Get() Global
	return Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_CaptivesTats
endfunction

EL_CaptiveTats function GetCaptiveTatsScript(Actor theCaptive) Global
	return EL_Captives.FindActorSlot(theCaptive) as EL_CaptiveTats
endfunction

function SetTatOnActor(Actor theCaptive, string theTat, bool last = true) Global
	if theCaptive == none || theTat == ""
		EL_Utility.Log("Error placing tatoo '" + theTat + "' on none captive" , "EL_CaptivesTats")
		return
	endif
	Get().RunSetTatOnActor(theCaptive, theTat, last)
endfunction

function RemoveTatFromActor(Actor theCaptive, string theTat, bool last = true) Global
	if theCaptive == none || theTat == ""
		EL_Utility.Log("Error removing tatoo '" + theTat + "' on none captive" , "EL_CaptivesTats")
		return
	endif
	Get().RunRemoveTatFromActor(theCaptive, theTat, last)
endfunction

string[] name
string[] section
int[] color
float[] alpha

event OnInit()
	Initialize()
endevent

function RunSetTatOnActor(Actor theCaptive, string theTat, bool last = true)
	int index = name.find(theTat)
	if index == -1
		EL_Utility.Log("Error loading tat for " + theCaptive.GetLeveledActorBase().GetName() , "EL_CaptivesTats")
		return
	endif
	ApplyTatByIndex(theCaptive, index, last)
endfunction

function RunRemoveTatFromActor(Actor theCaptive, string theTat, bool last = true)
	int index = name.find(theTat)
	if index == -1
		EL_Utility.Log("Error finding tat to remove for " + theCaptive.GetLeveledActorBase().GetName() , "EL_CaptivesTats")
		return
	endif
	EL_CaptiveTats captiveTats = EL_Captives.FindActorSlot(theCaptive) as EL_CaptiveTats
	captiveTats.RemoveTat(section[index], name[index], last, true)
endfunction

function ApplyTatByIndex(Actor theCaptive, int index, bool last = true)
	EL_CaptiveTats captiveTats = EL_Captives.FindActorSlot(theCaptive) as EL_CaptiveTats
	if captiveTats == none
		EL_Utility.Log("Error loading CaptiveTats for " + theCaptive.GetLeveledActorBase().GetName() + " actor not captured?" , "EL_CaptivesTats")
		return
	endif
	captiveTats.AddTat(section[index], name[index], color[index], last, true, alpha[index])
endfunction

function Initialize()
	EL_Captives CaptivesScript = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_Captives
	name = new string[100]
	section = new string[100]
	color = new int[100]
	alpha = new float[100]
	InitializeLichEvilynnTats()
	InitializeCaneTats()
endfunction

function InitializeLichEvilynnTats()
	string defaultSection = "Lich Evilynn"
	int defaultColor = 13112340
	float defaultAlpha = 1.0
	int index
	
	index = GetSlotIDOrNextEmpty("EL_AfterEffect1")
	name[index] = "EL_AfterEffect1"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_AfterEffect2")
	name[index] = "EL_AfterEffect2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_AfterEffect3")
	name[index] = "EL_AfterEffect3"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_AfterEffect4")
	name[index] = "EL_AfterEffect4"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_BatteredHead")
	name[index] = "EL_BatteredHead"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha

	index = GetSlotIDOrNextEmpty("EL_CutsMarks1")
	name[index] = "EL_CutsMarks1"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha

	index = GetSlotIDOrNextEmpty("EL_CutsMarks2")
	name[index] = "EL_CutsMarks2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_CutsMarks3")
	name[index] = "EL_CutsMarks3"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Dirt1")
	name[index] = "EL_Dirt1"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Dirt2")
	name[index] = "EL_Dirt2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Dirt3")
	name[index] = "EL_Dirt3"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Scarred1")
	name[index] = "EL_Scarred1"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Scarred2")
	name[index] = "EL_Scarred2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Scarred3")
	name[index] = "EL_Scarred3"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_SobHead1")
	name[index] = "EL_SobHead1"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_SobHead2")
	name[index] = "EL_SobHead2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Tears1")
	name[index] = "EL_Tears2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Tears2")
	name[index] = "EL_Tears2"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("EL_Tears3")
	name[index] = "EL_Tears3"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
endfunction

function InitializeCaneTats()
	string defaultSection = "Cane Marks"
	int defaultColor = 13112340
	float defaultAlpha = 1.0
	int index
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Ass - Thin")
	name[index] = "Cane Marks on Ass - Thin"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Ass - Thick")
	name[index] = "Cane Marks on Ass - Thick"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Back - Less")
	name[index] = "Cane Marks on Back - Less"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Back - More")
	name[index] = "Cane Marks on Back - More"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Back - Random")
	name[index] = "Cane Marks on Back - Random"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Ass")
	name[index] = "Cane Marks on Ass"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks on Tits")
	name[index] = "Cane Marks on Tits"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Red Pussy")
	name[index] = "Red Pussy"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Spanked Ass - Light")
	name[index] = "Spanked Ass - Light"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Spanked Ass - Dark")
	name[index] = "Spanked Ass - Dark"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Spanked Tits - Light")
	name[index] = "Spanked Tits - Light"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Spanked Tits - Dark")
	name[index] = "Spanked Tits - Dark"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Spanked Set - Light")
	name[index] = "Spanked Set - Light"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Spanked Set - Dark")
	name[index] = "Spanked Set - Dark"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks Random Set")
	name[index] = "Cane Marks Random Set"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
	
	index = GetSlotIDOrNextEmpty("Cane Marks Set")
	name[index] = "Cane Marks Set"
	section[index] = defaultSection
	color[index] = defaultColor
	alpha[index] = defaultAlpha
endfunction

int function GetSlotIDOrNextEmpty(string theName)
	int index = name.find(theName)
	if index == -1
		index = name.find("")
	endif
	return index
endfunction


