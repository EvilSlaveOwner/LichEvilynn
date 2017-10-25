Scriptname EL_AlignmentForceMasturbationAlias extends ReferenceAlias  

string Message1 = "Evilynn's overpowering essence pushes you aside.\nYou can feel your body slipping away from you.\nThe room fades as she takes control.\n\nYour vision dims and you realize that you can no longer feel the discomfort of your armor, or the chill in the air.\n\nAt least this is a painless death."
string Message2 = "You hear an evil laugh in your mind.\n\nNo, I'm not letting you fade.\nI'm not simply going to take your body.\nI'm going to rape your body, mind, and soul."
string Message3 = "You can feel her twisted pleasure as she caresses your mind.\n\nYou shiver as feelings flood back.\nYou can feel your body again.\n\nYou watch helplessly as you strip.\nYou feel your own fingers invade your pussy."
SexLabFramework Property SexLab Auto

Function MasturbationGood(Actor victim, ObjectReference CenterOn)
	Debug.MessageBox(Message1)
	Debug.MessageBox(Message2)
	Debug.MessageBox(Message3)
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
	Utility.Wait(5)
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
	Game.GetPlayer().AddToFaction(EL_PlayerSexEnd)
EndEvent

Faction Property EL_PlayerSexEnd  Auto  
