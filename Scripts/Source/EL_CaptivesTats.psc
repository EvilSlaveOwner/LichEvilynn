Scriptname EL_CaptivesTats extends Quest  

bool initalized = false
event OnInit()
	Initialize()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_CaptivesSexLab")
endevent

function OnGameLoad()
	if initalized == false
		Initialize()
	endif
endfunction

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

function Capture(Actor theCaptive)
endfunction

string[] name
string[] section
int[] color
float[] alpha
float[] fadeTime

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
	captiveTats.AddTat(section[index], name[index], color[index], last, true, alpha[index], fadeTime[index])
endfunction

function Initialize()
	initalized = true
	EL_Captives CaptivesScript = Game.GetFormFromFile(0x050F545D, "LichEvilynn.esp") as EL_Captives
	name = new string[100]
	section = new string[100]
	color = new int[100]
	alpha = new float[100]
	fadeTime = new float[100]
	InitializeLichEvilynnTats()
	InitializeCaneTats()
endfunction

function InitializeLichEvilynnTats()
	string defaultSection = "Lich Evilynn"
	int defaultColor = 13112340
	float defaultAlpha = 1.0
	float defaultFadeTime = 1.0
	
	SetTat("EL_TorturedPussy", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_AfterEffect1", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_AfterEffect2", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_AfterEffect3", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_AfterEffect4", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_BatteredHead", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_CutsMarks1", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_CutsMarks2", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_CutsMarks3", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_Dirt1", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_Dirt2", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_Dirt3", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_Scarred1", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_Scarred2", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("EL_Scarred3", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	
	SetTat("EL_SobHead1", defaultSection, defaultColor, 0.5, 0.5)
	SetTat("EL_SobHead2", defaultSection, defaultColor, 0.5, 0.5)
	SetTat("EL_Tears1", defaultSection, defaultColor, 0.5, 0.5)
	SetTat("EL_Tears2", defaultSection, defaultColor, 0.5, 0.5)
	SetTat("EL_Tears3", defaultSection, defaultColor, 0.5, 0.5)
endfunction

function InitializeCaneTats()
	string defaultSection = "Cane Marks"
	int defaultColor = 13112340
	float defaultAlpha = 1.0
	float defaultFadeTime = 1.0
	
	SetTat("Cane Marks on Ass - Thin", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks on Ass - Thick", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks on Back - Less", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks on Back - More", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks on Back - Random", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks on Ass", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks on Tits", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Red Pussy", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Spanked Ass - Light", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Spanked Ass - Dark", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Spanked Tits - Light", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Spanked Tits - Dark", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Spanked Set - Light", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Spanked Set - Dark", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks Random Set", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)
	SetTat("Cane Marks Set", defaultSection, defaultColor, defaultAlpha, defaultFadeTime)

endfunction

function SetTat(string theName, string theSection, int theColor, float theAlpha, float theFadeTime)
	int index = GetSlotIDOrNextEmpty(theName)
	name[index] = theName
	section[index] = theSection
	color[index] = theColor
	alpha[index] = theAlpha
	fadeTime[index] = theFadeTime
endfunction

int function GetSlotIDOrNextEmpty(string theName)
	int index = name.find(theName)
	if index == -1
		index = name.find("")
	endif
	return index
endfunction


