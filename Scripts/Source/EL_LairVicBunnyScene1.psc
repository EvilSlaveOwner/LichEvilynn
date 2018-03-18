Scriptname EL_LairVicBunnyScene1 extends Quest  conditional

EL_LairVicBunnyScene1 function Get() Global
	return Game.GetFormFromFile(0x16D735, "LichEvilynn.esp") as EL_LairVicBunnyScene1
endfunction

sslThreadModel Thread
sslThreadController ThreadController
ReferenceAlias Property Alias_Player  Auto  
ReferenceAlias Property Alias_Bunny  Auto  
Scene Property EL_LairVicBunnyScene1Rape Auto
Scene Property EL_LairVicBunnyScene1Torture Auto
bool Property SexLabAnimationOver Auto hidden conditional

function FirstRape()
	SexLabAnimationOver = false
	Actor Player = Alias_Player.GetActorRef()
	Actor Bunny = Alias_Bunny.GetActorRef()
	
	EL_Captives.Capture(Player, true)
	EL_Captives.Capture(Bunny, true)

	; EL_Captives.GetCaptiveScript(Player).SetAvanceQuestOnEnd(Self as Quest, 30)

	sslBaseAnimation theAnimation =  SexLabUtil.GetAPI().GetAnimationByRegistry("EL_StoryLongFaceSit")
	Thread = SexLabUtil.GetAPI().NewThread()
	EL_RegisterForEvents("LairVicBunnyRape1")
	Thread.AddActor(Player)
	Thread.AddActor(Bunny, true)
	Thread.IsVictim(Bunny)
	Thread.DisableRedress(Player)
	Thread.DisableRedress(Bunny)
	Thread.DisableRagdollEnd(Bunny, false)
	Thread.AddAnimation(theAnimation)
	Thread.CenterOnObject(Player)
	ThreadController = Thread.StartThread()
	ThreadController.AutoAdvance = false
	EL_Utility.Log("Start Rape 1", "EL_LairVicBunnyScene1")
	Utility.Wait(2.0)
	; Debug.MessageBox("Evilynn shoves Sara to the ground.\nHer pussy close to Sara's face.\n\nIntimidated by Evilynn,\nSara timidly licks at your pussy.\n")
endfunction

function EL_RegisterForEvents(string HookName)
	Thread.SetHook(HookName)
	RegisterForModEvent("HookStageStart_" + HookName +"StageStart", "On" + HookName + "StageStart")
	RegisterForModEvent("HookStageEnd_" + HookName, "On" + HookName + "StageEnd")
	RegisterForModEvent("HookAnimationStart_" + HookName, "On" + HookName + "AnimationStart")
	RegisterForModEvent("HookAnimationEnd_" + HookName, "On" + HookName + "AnimationEnd")
endfunction

function EL_UnregisterForEvents(string HookName)
	UnregisterForModEvent("HookStageStart_" + HookName + "StageStart")
	UnregisterForModEvent("HookStageEnd_" + HookName)
	UnregisterForModEvent("HookAnimationStart_" + HookName)
	UnregisterForModEvent("HookAnimationEnd_" + HookName)
endfunction

event OnLairVicBunnyRape1AnimationStart(int tid, bool HasPlayer)
	SexLabAnimationOver = false
	EL_SexLabUtil.StopPlayerSceneControls(ThreadController)
endevent

event OnLairVicBunnyRape1AnimationEnd(int tid, bool HasPlayer)
	SexLabAnimationOver = true
	EL_UnregisterForEvents("LairVicBunnyRape1")
endevent

event OnLairVicBunnyRape1StageStart(int tid, bool HasPlayer)
	;EL_SexLabUtil.StopPlayerSceneControls(ThreadController)
endevent

event OnLairVicBunnyRape1StageEnd(int tid, bool HasPlayer)
	;EL_SexLabUtil.StopPlayerSceneControls(ThreadController)
endevent
	
function GoToSexLabStage(int stage)
	ThreadController.GoToStage(stage)
endfunction

function EndAnimation(bool quickly)
	ThreadController.EndAnimation(quickly)
	SexLabAnimationOver = true
endfunction

function BunnyBites()
	Actor Player = Alias_Player.GetActorRef()
	Actor Bunny = Alias_Bunny.GetActorRef()

	EL_CaptivesTats.SetTatOnActor(Bunny, "EL_Tears2")
	EL_CaptivesTats.SetTatOnActor(Player, "EL_TorturedPussy")
	Debug.MessageBox("Evilynn's pleasure is interrupted when Sara suddenly bites down hard.\n\nAgony radiates from your pussy as Sara sinks her teeth into your sensitive flesh.")

	; Debug.MessageBox("With Evilynn in control, you can't even scream as she rips away from Sara's teeth.\nYou feel your flesh tear, and feel Evilynn's amusement at your pain.\n\nThis doesn't prevent her from grabbing Sara by the throat.\n\nWith a thought she summons a pillory, and forces Sara into place.")
	;SetStage(30)
endfunction



