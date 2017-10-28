Scriptname EL_AlignmentForceMasturbationAlias extends ReferenceAlias  

SexLabFramework Property SexLab Auto

Function MasturbationGood(Actor victim, ObjectReference CenterOn)
	sslBaseAnimation[] AnimationList = SexLab.GetAnimationsByTags(1, "Solo,F", "", true);
	sslThreadModel thread = SexLab.NewThread()
	thread.AddActor(victim)
	thread.IsVictim(victim)
	thread.SetAnimations(AnimationList)
	thread.CenterOnObject(CenterOn)
	thread.SetHook("GoodMasturbation")
	RegisterForModEvent("HookAnimationEnd_GoodMasturbation", "goodAnimEndEventHandler")
	thread.StartThread()
EndFunction

Event goodAnimEndEventHandler(int tid, bool HasPlayer)
	Game.DisablePlayerControls(true)
	Game.GetPlayer().AddToFaction(EL_PlayerSexEnd)
EndEvent

Function MasturbationEvil(Actor victim, ObjectReference CenterOn)
	sslBaseAnimation[] AnimationList = SexLab.GetAnimationsByTags(1, "Solo,F", "", true);
	sslThreadModel thread = SexLab.NewThread()
	thread.AddActor(victim)
	thread.SetAnimations(AnimationList)
	thread.CenterOnObject(CenterOn)
	thread.SetHook("EvilMasturbation")
	RegisterForModEvent("HookAnimationEnd_EvilMasturbation", "evilAnimEndEventHandler")
	thread.StartThread()
EndFunction

Event evilAnimEndEventHandler(int tid, bool HasPlayer)
	Game.DisablePlayerControls(true)
	Game.GetPlayer().AddToFaction(EL_PlayerSexEnd)
EndEvent

Faction Property EL_PlayerSexEnd  Auto  
