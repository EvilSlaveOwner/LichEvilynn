Scriptname EL_CaptiveTats extends ReferenceAlias  

event OnInit()
	Initialize()
endevent

function Initialize()
	ActiveTats = new string[25]
endfunction

function AddTat(string section, string name, int color = 0, bool last = true, bool silent = false, float alpha = 1.0)
	Actor theCaptive = GetActorRef()
	if theCaptive == none
		return
	endif
	int index = ActiveTats.find(name)
	if index == -1
		index = ActiveTats.find("")
	endif
	ActiveTats[index] = name
	SlaveTats.simple_add_tattoo(theCaptive, section, name, color, last, silent, alpha)
endfunction

function RemoveTat(string section, string name,  bool last = true, bool silent = false)
	Actor theCaptive = GetActorRef()
	if theCaptive == none
		return
	endif
	int index = ActiveTats.find(name)
	if index == -1
		return
	endif
	ActiveTats[index] = ""
	SlaveTats.simple_remove_tattoo(theCaptive, section, name, last, silent)
endfunction

string[] ActiveTats