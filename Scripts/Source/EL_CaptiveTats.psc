Scriptname EL_CaptiveTats extends ReferenceAlias  

event OnInit()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_CaptiveMind")
endevent

function Initialize()
	ActiveTatName = new string[25]
	ActiveTatSection = new string[25]
	ActiveTatColor = new int[25]
	ActiveTatAlpha = new float[25]
	ActiveTatFadeTimeIncrement = new float[25]
	ActiveTatFadeAmountIncrement = new float[25]
	ActiveTatNextFadeTime = new float[25]
endfunction

function Capture()
	Initialize()
endfunction

function Maintenance()
	float time = Utility.GetCurrentGameTime()
	bool changesToApply = false
	int index = 0
	int count = ActiveTatName.length
	while index < count
		if ActiveTatName[index] != ""
			if ActiveTatNextFadeTime[index] < time
				changesToApply = true
				MaintenanceFadeTat(index)
			endif
		endif
	endwhile
	if changesToApply
		Actor theCaptive = GetActorRef()
		SlaveTats.synchronize_tattoos(theCaptive, true)
	endif
endfunction

function MaintenanceFadeTat(int index)
	Actor theCaptive = GetActorRef()
	if ActiveTatAlpha[index] > 0.10
		ActiveTatAlpha[index] = ActiveTatAlpha[index] - ActiveTatFadeAmountIncrement[index]
		ActiveTatNextFadeTime[index] = Utility.GetCurrentGameTime() + ActiveTatFadeTimeIncrement[index]
		SlaveTats.simple_add_tattoo(theCaptive, ActiveTatSection[index], ActiveTatName[index], ActiveTatColor[index], false, true, ActiveTatAlpha[index])
	else
		SlaveTats.simple_remove_tattoo(theCaptive, ActiveTatSection[index], ActiveTatName[index], false, true)
		ActiveTatName[index] = ""
	endif
endfunction

function AddTat(string section, string name, int color = 0, bool last = true, bool silent = false, float alpha = 1.0, float fadeTime = 1.0)
	Actor theCaptive = GetActorRef()
	if theCaptive == none
		return
	endif
	int index = ActiveTatName.find(name)
	if index == -1
		index = ActiveTatName.find("")
	endif
	bool success = SlaveTats.simple_add_tattoo(theCaptive, section, name, color, last, silent, alpha)
	if success == false
		EL_Utility.Log("Error adding slavetat" , "EL_CaptiveTats")
		return ; failed to add tat
	endif
	ActiveTatName[index] = name
	ActiveTatSection[index] = section
	ActiveTatColor[index] = color
	ActiveTatAlpha[index] = alpha
	ActiveTatFadeTimeIncrement[index] = fadeTime / 10 ; fade in 10% chunks, so each fade happens at 10% of the final  time.
	ActiveTatFadeAmountIncrement[index] = alpha / 10 ; fade amount is 10% of original
	ActiveTatNextFadeTime[index] = Utility.GetCurrentGameTime() + ActiveTatFadeTimeIncrement[index]
endfunction

function RemoveTat(string section, string name,  bool last = true, bool silent = false)
	Actor theCaptive = GetActorRef()
	if theCaptive == none
		return
	endif
	int index = ActiveTatName.find(name)
	if index == -1
		return
	endif
	ActiveTatName[index] = ""
	SlaveTats.simple_remove_tattoo(theCaptive, section, name, last, silent)
endfunction

string[] ActiveTatName
string[] ActiveTatSection
int[] ActiveTatColor
float[] ActiveTatAlpha
float[] ActiveTatFadeTimeIncrement
float[] ActiveTatFadeAmountIncrement
float[] ActiveTatNextFadeTime