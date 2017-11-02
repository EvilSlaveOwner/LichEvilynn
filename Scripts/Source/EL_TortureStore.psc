Scriptname EL_TortureStore extends Quest

Quest Property Main auto


function AddQuestWithNumActors(int numActors, Quest newQuest)
	if numActors == 1
		(Main as EL_1ActorTortureStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_2ActorTortureStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_3ActorTortureStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_4ActorTortureStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_5ActorTortureStore).AddQuest(newQuest)
	else
		Debug.Notification("number of actors must be between 1 and 5")
	endif
endfunction

Quest function GetQuestByIndexWithNumActors(int numActors, int index)
	if numActors == 1
		(Main as EL_1ActorTortureStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_2ActorTortureStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_3ActorTortureStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_4ActorTortureStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_5ActorTortureStore).GetQuestByIndex(index)
	else
		Debug.Notification("number of actors must be between 1 and 5")
	endif
endfunction

Quest function GetRandomQuestWithNumActors(int numActors)
	if numActors == 1
		(Main as EL_1ActorTortureStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_2ActorTortureStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_3ActorTortureStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_4ActorTortureStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_5ActorTortureStore).GetRandomQuest()
	else
		Debug.Notification("number of actors must be between 1 and 5")
	endif
endfunction