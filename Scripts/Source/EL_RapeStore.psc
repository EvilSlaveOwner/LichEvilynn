Scriptname EL_RapeStore extends Quest  

Quest Property Main auto


function AddQuestWithNumActors(int numActors, Quest newQuest)
	if numActors == 1
		(Main as EL_1ActorRapeStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_2ActorRapeStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_3ActorRapeStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_4ActorRapeStore).AddQuest(newQuest)
	elseif numActors == 1
		(Main as EL_5ActorRapeStore).AddQuest(newQuest)
	else
		Debug.Notification("number of actors must be between 1 and 5")
	endif
endfunction

Quest function GetQuestByIndexWithNumActors(int numActors, int index)
	if numActors == 1
		(Main as EL_1ActorRapeStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_2ActorRapeStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_3ActorRapeStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_4ActorRapeStore).GetQuestByIndex(index)
	elseif numActors == 1
		(Main as EL_5ActorRapeStore).GetQuestByIndex(index)
	else
		Debug.Notification("number of actors must be between 1 and 5")
	endif
endfunction

Quest function GetRandomQuestWithNumActors(int numActors)
	if numActors == 1
		(Main as EL_1ActorRapeStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_2ActorRapeStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_3ActorRapeStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_4ActorRapeStore).GetRandomQuest()
	elseif numActors == 1
		(Main as EL_5ActorRapeStore).GetRandomQuest()
	else
		Debug.Notification("number of actors must be between 1 and 5")
	endif
endfunction