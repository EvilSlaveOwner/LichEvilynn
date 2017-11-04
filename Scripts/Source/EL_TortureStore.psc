Scriptname EL_TortureStore extends EL_QuestStore

Event OnInit()
	initValues()
	AddQuest(EL_VicTortPlayBall, "Time to play ball", 1, true, "", "")
	AddQuest(EL_VicTortPlayBall, "Time to play ball", 2, true, "", "")
	AddQuest(EL_VicTortPlayBall, "Some other quest", 2, true, "", "")
	AddQuest(EL_VicTortPlayBall, "Questing again", 2, true, "", "")
	AddQuest(EL_VicTortPlayBall, "Questing again with five", 5, true, "", "")
EndEvent

Quest Property EL_VicTortPlayBall  Auto  