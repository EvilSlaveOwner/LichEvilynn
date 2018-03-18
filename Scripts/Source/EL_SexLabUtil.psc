Scriptname EL_SexLabUtil extends Quest  

event OnInit()
	allActors = new Actor[50]
	allStrapons = new Form[50]
endevent

EL_SexLabUtil function Get() Global
	return Game.GetFormFromFile(0x061B6AB2, "LichEvilynn.esp") as EL_SexLabUtil
endfunction

function OnGameLoad()
	allActors = new Actor[50]
	allStrapons = new Form[50]
	RegisterForModEvent("HookAnimationStarting", "OnAnimationStarting")
	RegisterForModEvent("HookAnimationEnd", "OnAnimationEnd")
	RegisterForModEvent("SexLabLoadStrapons", "OnLoadStrapons")
	EL_Utility.Log("Registered for sexlab events", "EL_SexLabUtil")
endfunction

event OnLoadStrapons()
	SexLabConfig.LoadStrapon("LichEvilynn.esp", 0x1BF70E)
endevent

event OnAnimationStarting(int tid, bool HasPlayer)
	EL_Utility.Log("SexLab AnimationStarting", "EL_SexLabUtil")
	sslThreadController Thread = SexLabUtil.GetAPI().GetController(tid)
	Actor[] theActors = Thread.Positions
	form Strapon
	int numActors = theActors.length
	int i = 0
	while i < numActors
		if theActors[i] != none
			Strapon = GetCorrectStrapOn(theActors[i])
			if Strapon
				SetStraponForActor(theActors[i], Strapon)			
			endif
		endif
		i = i + 1
	endwhile
endevent

event OnAnimationEnd(int tid, bool HasPlayer)
	EL_Utility.Log("SexLab AnimationEnd", "EL_SexLabUtil")
	sslThreadController Thread = SexLabUtil.GetAPI().GetController(tid)
	Actor[] theActors = Thread.Positions
	int numActors = theActors.length
	int i = 0
	while i < numActors
		if theActors[i] != none
			ClearStraponForActor(theActors[i])			
		endif
		i = i + 1
	endwhile
endevent

function SetStraponForActor(Actor theActor, Form Strapon)
	int allActorID = allActors.find(theActor)
	if allActorID < 0
		allActorID = allActors.find(none)
	endif
	if allActorID < 0
		EL_Utility.Log("No open actor slot, bailing.", "EL_SexLabUtil")
		return
	endif
	allActors[allActorID] = theActor
	allStrapons[allActorID] = Strapon
	theActor.AddItem(Strapon, 1, true)
	EL_Utility.Log("Using strapon " + strapon.GetName() + " for " + theActor.GetLeveledActorBase().GetName() , "EL_SexLabUtil")
endfunction

function ClearStraponForActor(Actor theActor)
	int allActorID = allActors.find(theActor)
	if allActorID < 0
		EL_Utility.Log(theActor.GetLeveledActorBase().GetName() + " not found in allActors, bailing.", "EL_SexLabUtil")
		return
	endif
	theActor.RemoveItem(allStrapons[allActorID], 1, true)
	EL_Utility.Log("Removeing strapon " + allStrapons[allActorID].GetName() + " from " + theActor.GetLeveledActorBase().GetName() , "EL_SexLabUtil")
	allActors[allActorID] = none
	allStrapons[allActorID] = none
endfunction

form function GetCorrectStrapOn(Actor theActor)
	int strapOnRank = theActor.GetFactionRank(EL_HasMagicStrapon) 
	form strapon
	if strapOnRank > 0
		return AddMagicStrapon(theActor, strapOnRank)
	else
		return GetRandomStrapon(theActor)
	endif
endfunction

form function AddMagicStrapon(Actor theActor, int strapOnRank)
	form Strapon = Game.GetFormFromFile(0x1BF70E, "LichEvilynn.esp")
	if theActor.GetItemCount(Strapon) > 0
		return none
	endif
	return Strapon
endfunction

form function GetRandomStrapon(Actor theActor)
	if SexLabUtil.GetAPI().HasStrapon(theActor)
		return none
	endif
	form MagicStrapon = Game.GetFormFromFile(0x1BF70E, "LichEvilynn.esp")
	form Strapon = none
	int times = 15
	bool looking = true
	while looking && times < 20 
		Strapon = SexLabConfig.GetStrapon()
		if Strapon == none
			return none
		endif
		looking = Strapon == MagicStrapon
		times = times + 1
	endwhile
	return Strapon
endfunction

Form[] allStrapons
Actor[] allActors
Faction Property EL_HasMagicStrapon  Auto  
sslSystemConfig property SexLabConfig auto