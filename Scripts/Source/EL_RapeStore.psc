Scriptname EL_RapeStore extends Quest  

; When time comes to expant to hold more scenes...
; http://forums.bethsoft.com/topic/1583034-quick-questions-quick-answers-thread-63/page-3#entry24889636

int[] maxRapeScenes
Scene[] rapeScenesNumActors1
Scene[] rapeScenesNumActors2
Scene[] rapeScenesNumActors3
Scene[] rapeScenesNumActors4
Scene[] rapeScenesNumActors5
Scene[] rapeScenesNumActors6
Scene[] rapeScenesNumActors7
Scene[] rapeScenesNumActors8
Scene[] rapeScenesNumActors9
Scene[] rapeScenesNumActors10

Event OnInit()
	StartObjectProfiling()
	rapeScenesNumActors1 = new Scene[50]
	rapeScenesNumActors2 = new Scene[50]
	rapeScenesNumActors3 = new Scene[50]
	rapeScenesNumActors4 = new Scene[50]
	rapeScenesNumActors5 = new Scene[50]
	rapeScenesNumActors6 = new Scene[50]
	rapeScenesNumActors7 = new Scene[50]
	rapeScenesNumActors8 = new Scene[50]
	rapeScenesNumActors9 = new Scene[50]
	rapeScenesNumActors10 = new Scene[50]
	maxRapeScenes = new int[11] ; for simplicity, skip first element, index is number of actors
EndEvent


function AddRapeScene(Scene newScene, int numActors)
	if maxRapeScenes[numActors] == 50
		Debug.TraceAndBox("Maximum of 50 scenes with " + numActors + " reached, scene not registered!", 1)
		return
	endif
	if numActors == 1
		rapeScenesNumActors1[maxRapeScenes[numActors]] = newScene
	elseif numActors == 2
		rapeScenesNumActors2[maxRapeScenes[numActors]] = newScene
	elseif numActors == 3
		rapeScenesNumActors3[maxRapeScenes[numActors]] = newScene
	elseif numActors == 4
		rapeScenesNumActors4[maxRapeScenes[numActors]] = newScene
	elseif numActors == 5
		rapeScenesNumActors5[maxRapeScenes[numActors]] = newScene
	elseif numActors == 6
		rapeScenesNumActors6[maxRapeScenes[numActors]] = newScene
	elseif numActors == 7
		rapeScenesNumActors7[maxRapeScenes[numActors]] = newScene
	elseif numActors == 8
		rapeScenesNumActors8[maxRapeScenes[numActors]] = newScene
	elseif numActors == 9
		rapeScenesNumActors9[maxRapeScenes[numActors]] = newScene
	elseif numActors == 10
		rapeScenesNumActors10[maxRapeScenes[numActors]] = newScene
	else
		Debug.TraceAndBox("Invalid number of actors. 1 through 10 supported, supplied " + numActors + ", rape scene not registered!", 1)
		return
	endif
	maxRapeScenes[numActors] = maxRapeScenes[numActors] + 1
endfunction

Scene function GetRapeScene(int index, int numActors)
	if maxRapeScenes[numActors] < index
		Debug.TraceAndBox("Invalid rape scene index. Requested " + index + " with " + numActors + " actors! Returning first scene", 1)
		if maxRapeScenes[numActors] > 0
			return GetRapeScene(1, numActors)
		else
			return None
		endif
	endif
	if numActors == 1
		return rapeScenesNumActors1[maxRapeScenes[numActors]]
	elseif numActors == 2
		return rapeScenesNumActors2[maxRapeScenes[numActors]]
	elseif numActors == 3
		return rapeScenesNumActors3[maxRapeScenes[numActors]]
	elseif numActors == 4
		return rapeScenesNumActors4[maxRapeScenes[numActors]]
	elseif numActors == 5
		return rapeScenesNumActors5[maxRapeScenes[numActors]]
	elseif numActors == 6
		return rapeScenesNumActors6[maxRapeScenes[numActors]]
	elseif numActors == 7
		return rapeScenesNumActors7[maxRapeScenes[numActors]]
	elseif numActors == 8
		return rapeScenesNumActors8[maxRapeScenes[numActors]]
	elseif numActors == 9
		return rapeScenesNumActors9[maxRapeScenes[numActors]]
	elseif numActors == 10
		return rapeScenesNumActors10[maxRapeScenes[numActors]]
	else
		Debug.TraceAndBox("Invalid number of actors. 1 through 10 supported, supplied " + numActors + ", returning first single actor scene instead!", 1)
		if maxRapeScenes[1] > 0
			return GetRapeScene(1, 1)
		else
			return None
		endif
	Endif
endfunction

Scene function GetRandomRapeScene(int numActors)
	int index = Utility.RandomInt(0, maxRapeScenes[numActors] - 1)
	return GetRapeScene(index, numActors)
endfunction