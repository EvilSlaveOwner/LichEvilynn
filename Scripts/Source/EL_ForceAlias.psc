Scriptname EL_ForceAlias extends ReferenceAlias  

SexLabFramework Property SexLab Auto

Function Masturbation(Actor victim, ObjectReference CenterOn)
	sslBaseAnimation[] AnimationList = SexLab.GetAnimationsByTags(1, "Solo,F", "", true);
	sslThreadModel thread = SexLab.NewThread()
	thread.AddActor(victim)
	thread.IsVictim(victim)
	thread.SetAnimations(AnimationList)
	thread.CenterOnObject(CenterOn)
	thread.SetHook("VictimMasturbation")
	RegisterForModEvent("HookAnimationEnd_VictimMasturbation", "myAnimEndEventHandler")
	thread.StartThread()
EndFunction

Event myAnimEndEventHandler(int tid, bool HasPlayer)
	Utility.Wait(2)	
	GetOwningQuest().SetStage(300)
EndEvent