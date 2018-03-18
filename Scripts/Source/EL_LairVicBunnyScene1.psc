Scriptname EL_LairVicBunnyScene1 extends Quest  

int BunnyStatus = 0

function FirstRape()
	Actor Player = Alias_Player.GetActorRef()
	Actor Bunny = Alias_Bunny.GetActorRef()

	EL_Captives.Capture(Player, true)
	EL_Captives.Capture(Bunny, true)

	EL_Captives.GetCaptiveScript(Player).SetAvanceQuestOnEnd(Self as Quest, 30)
	BunnyStatus = 1
	sslBaseAnimation theAnimation =  SexLabUtil.GetAPI().GetAnimationByRegistry("EL_LongFaceSit")
	sslThreadModel thread = SexLabUtil.GetAPI().NewThread()
	Thread.SetHook("LairVicBunnyRape1")
	RegisterForModEvent("HookStageEnd_LairVicBunnyRape1", "OnBunnyRape1StageEnd")
	RegisterForModEvent("HookStageEnd_AnimationEnding", "OnBunnyRape1StageEnd")
	thread.AddActor(Player)
	thread.AddActor(Bunny)
	thread.IsVictim(Bunny)
	thread.DisableRedress(Player)
	thread.DisableRedress(Bunny)
	thread.DisableRagdollEnd(Bunny, false)
	thread.AddAnimation(theAnimation)
	thread.CenterOnObject(Player)
	thread.StartThread()
	Utility.Wait(2.0)
	Debug.MessageBox("Evilynn shoves Sara to the ground and stands over her.\n\nIntimidated by Evilynn,\nSara timidly licks at your pussy.")
	EL_Utility.Log("Start Rape 1", "EL_LairVicBunnyScene1")
endfunction

event OnBunnyRape1StageEnd(int tid, bool HasPlayer)
	sslThreadController Thread = SexLabUtil.GetAPI().GetController(tid)
	Actor Bunny = Alias_Bunny.GetActorRef()
	if Thread.Stage == 1
		EL_Utility.Log("Stage 1 end", "EL_LairVicBunnyScene1")
		Debug.MessageBox("Evilynn grabs Sara's head and pulls her face into your pussy.\n\nYou can feel her pleasure build as she grinds against Sara's face.")
		EL_CaptivesTats.SetTatOnActor(Bunny, "EL_Tears1")
		return
	elseif Thread.Stage == 2
		EL_Utility.Log("Stage 2 end", "EL_LairVicBunnyScene1")
		UnRegisterForModEvent("HookStageEnd_LairVicBunnyRape1")
		UnRegisterForModEvent("HookStageEnd_AnimationEnding")
		BunnyBites()
	endif
endevent

function BunnyBites()
	if BunnyStatus != 1
		EL_Utility.Log("Error, BunnyBites and status code is " + BunnyStatus, "EL_LairVicBunnyScene1")
		return
	endif
	Actor Player = Alias_Player.GetActorRef()
	BunnyStatus = 2
	EL_CaptivesTats.SetTatOnActor(Player, "Red Pussy")
	Debug.MessageBox("Evilynn's pleasure is interrupted when Sara suddenly bites down hard.\n\nAgony radiates from your pussy as Sara sinks her teeth into your sensitive flesh.")
	Debug.MessageBox("With Evilynn in control, you can't even scream as she rips away from Sara's teeth.\nYou feel your flesh tear, and feel Evilynn's amusement at your pain.\n\nThis doesn't prevent her from grabbing Sara by the throat.\n\nWith a thought she summons a pillory, and forces Sara into place.")
	SetStage(30)
endfunction

ReferenceAlias Property Alias_Player  Auto  
ReferenceAlias Property Alias_Bunny  Auto  
