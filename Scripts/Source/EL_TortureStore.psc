Scriptname EL_TortureStore extends Quest  

; When time comes to expant to hold more scenes...
; http://forums.bethsoft.com/topic/1583034-quick-questions-quick-answers-thread-63/page-3#entry24889636

int[] maxTortureScenes
Scene[] tortureScenesNumActors1
Scene[] tortureScenesNumActors2
Scene[] tortureScenesNumActors3
Scene[] tortureScenesNumActors4
Scene[] tortureScenesNumActors5
Scene[] tortureScenesNumActors6
Scene[] tortureScenesNumActors7
Scene[] tortureScenesNumActors8
Scene[] tortureScenesNumActors9
Scene[] tortureScenesNumActors10

Event OnInit()
	StartObjectProfiling()
	tortureScenesNumActors1 = new Scene[128]
	tortureScenesNumActors2 = new Scene[128]
	tortureScenesNumActors3 = new Scene[128]
	tortureScenesNumActors4 = new Scene[128]
	tortureScenesNumActors5 = new Scene[128]
	tortureScenesNumActors6 = new Scene[128]
	tortureScenesNumActors7 = new Scene[128]
	tortureScenesNumActors8 = new Scene[128]
	tortureScenesNumActors9 = new Scene[128]
	tortureScenesNumActors10 = new Scene[128]
	maxTortureScenes = new int[11] ; for simplicity, skip first element, index is number of actors
EndEvent


function AddTortureScene(Scene newScene, int numActors)
	if maxTortureScenes[numActors] == 128
		Debug.TraceAndBox("Maximum of 128 scenes with " + numActors + " reached, scene not registered!", 1)
		return
	endif
	if numActors == 1
		tortureScenesNumActors1[maxTortureScenes[numActors]] = newScene
	elseif numActors == 2
		tortureScenesNumActors2[maxTortureScenes[numActors]] = newScene
	elseif numActors == 3
		tortureScenesNumActors3[maxTortureScenes[numActors]] = newScene
	elseif numActors == 4
		tortureScenesNumActors4[maxTortureScenes[numActors]] = newScene
	elseif numActors == 5
		tortureScenesNumActors5[maxTortureScenes[numActors]] = newScene
	elseif numActors == 6
		tortureScenesNumActors6[maxTortureScenes[numActors]] = newScene
	elseif numActors == 7
		tortureScenesNumActors7[maxTortureScenes[numActors]] = newScene
	elseif numActors == 8
		tortureScenesNumActors8[maxTortureScenes[numActors]] = newScene
	elseif numActors == 9
		tortureScenesNumActors9[maxTortureScenes[numActors]] = newScene
	elseif numActors == 10
		tortureScenesNumActors10[maxTortureScenes[numActors]] = newScene
	else
		Debug.TraceAndBox("Invalid number of actors. 1 through 10 supported, supplied " + numActors + ", torture scene not registered!", 1)
		return
	endif
	maxTortureScenes[numActors] = maxTortureScenes[numActors] + 1
endfunction

Scene function GetTortureScene(int index, int numActors)
	if maxTortureScenes[numActors] < index
		Debug.TraceAndBox("Invalid torture scene index. Requested " + index + " with " + numActors + " actors! Returning first scene", 1)
		if maxTortureScenes[numActors] > 0
			return GetTortureScene(1, numActors)
		else
			return None
		endif
	endif
	if numActors == 1
		return tortureScenesNumActors1[maxTortureScenes[numActors]]
	elseif numActors == 2
		return tortureScenesNumActors2[maxTortureScenes[numActors]]
	elseif numActors == 3
		return tortureScenesNumActors3[maxTortureScenes[numActors]]
	elseif numActors == 4
		return tortureScenesNumActors4[maxTortureScenes[numActors]]
	elseif numActors == 5
		return tortureScenesNumActors5[maxTortureScenes[numActors]]
	elseif numActors == 6
		return tortureScenesNumActors6[maxTortureScenes[numActors]]
	elseif numActors == 7
		return tortureScenesNumActors7[maxTortureScenes[numActors]]
	elseif numActors == 8
		return tortureScenesNumActors8[maxTortureScenes[numActors]]
	elseif numActors == 9
		return tortureScenesNumActors9[maxTortureScenes[numActors]]
	elseif numActors == 10
		return tortureScenesNumActors10[maxTortureScenes[numActors]]
	else
		Debug.TraceAndBox("Invalid number of actors. 1 through 10 supported, supplied " + numActors + ", returning first single actor scene instead!", 1)
		if maxTortureScenes[1] > 0
			return GetTortureScene(1, 1)
		else
			return None
		endif
	Endif
endfunction

Scene function GetRandomTortureScene(int numActors)
	int index = Utility.RandomInt(0, maxTortureScenes[numActors] - 1)
	return GetTortureScene(index, numActors)
endfunction