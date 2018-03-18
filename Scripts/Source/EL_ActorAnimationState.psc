Scriptname EL_ActorAnimationState extends ReferenceAlias  

; IdleNervous
; IdleLockPick
; IdleLookFar
; IdleNocturnal_LookLeft
; IdleNocturnal_LookRight
; IdlePointClose
; IdlePointFar_01
; IdleSearchBody
; IdleSearchingChest
; IdleSearchingTable
; IdleSilentBow
; IdleSurrender
; IdleTake
; IdleGive
; IdleWave
; IdleWipeBrow
; IdleStudy
; IdleSalute
; IdlePickup_Ground
; IdleLaugh
; IdleGetAttention
; IdleExamine
; IdleComeThisWay
; IdleCleanSword
; IdleBracedPain
; IdleBook_Reading
; IdleBook_TurnManyPages
; IdleBook_TurnOnePage
; IdleBookSitting_Reading
; IdleBookSitting_TurnManyPages
; IdleApplaud2
; IdleApplaud3
; IdleApplaud4
; IdleApplaud5
; IdleApplaud6
; IdleApplaudSarcastic
string theAnimation = ""
string endZaZAnimation = "OffsetStop"
string endLoopAnimation = "IdleStop_Loose"
string endAnimation = "IdleForceDefaultState"
string lastAnimation = ""
string[] animationList
string[] animationStop
bool SkipEndingPrevious = false
int animationNumber = -1
actor theActor


string function GetRandom(string[] animations)
	return animations[Utility.RandomInt(1, animations.length) - 1]
endfunction

event OnInit()
	theActor = Self.GetActorRef()
	Setup()
	SetupHorny()
endevent

function Setup()
	animationList = new string[25]
	animationStop = new string[25]
	int i = 0
	animationList[i] = "IdleSearchingChest"
	animationStop[i] = "IdleForceDefaultState"
endfunction

string[] hornyAni
string[] hornyStandingAni
function SetupHorny()
	hornyAni = new string[10]
	hornyAni[0] = "ZaZAPCHorFA" ; standing
	hornyAni[1] = "ZaZAPCHorFB" ; standing bend at waist
	hornyAni[2] = "ZaZAPCHorFC" ; standing breasts
	hornyAni[3] = "ZaZAPCHorFD" ; kneeling
	hornyAni[4] = "ZaZAPCHorFE" ; back "b"
	hornyAni[5] = "ZaZAPCHorFF" ; back "p"
	hornyAni[6] = "ZaZAPCHorFG" ; back "b/p"
	hornyAni[7] = "ZaZAPCHorFH" ; back orgas1
	hornyAni[8] = "ZaZAPCHorFI" ; back/side orgas2
	hornyAni[9] = "ZaZAPCHorFJ" ; back stroke after
	hornyStandingAni = new string[2]
	hornyStandingAni[0] = hornyAni[0]
	hornyStandingAni[1] = hornyAni[2]
endfunction

function StopLastAnimation()
	if lastAnimation == "" || SkipEndingPrevious
		return
	endif
	string StopAnimation = "OffsetStop" ; default stop animation
	int iStopAnimation = animationList.Find(lastAnimation)
	if iStopAnimation >= 0
		StopAnimation = animationStop[iStopAnimation]
	endif
	EL_Utility.Log("Ending Animation " + lastAnimation + " with " + StopAnimation, "EL_ActorAnimationState")
	Debug.SendAnimationEvent(GetRef(), StopAnimation)
	lastAnimation = ""
endfunction

State IdleByName
	Function StartBehaviour()
		EL_Utility.Log("Starting " + theAnimation + " Animation.", "EL_ActorAnimationState")
		lastAnimation = theAnimation
		Debug.SendAnimationEvent(GetRef(), theAnimation)
	EndFunction

	Function EndBehaviour()
		StopLastAnimation()
	EndFunction
EndState

State Horny
	Function StartBehaviour()
		if animationNumber >= hornyAni.length
			EL_Utility.Log("Invalid animation number.", "EL_ActorAnimationState")
			return
		endif
		if animationNumber == -1
			theAnimation = GetRandom(hornyAni)
		else
			theAnimation = hornyAni[animationNumber]
		endif
		EL_Utility.Log("Starting " + theAnimation + " Animation.", "EL_ActorAnimationState")
		lastAnimation = theAnimation
		Debug.SendAnimationEvent(GetRef(), theAnimation)
	EndFunction

	Function EndBehaviour()
		StopLastAnimation()
	EndFunction
EndState

State HornyRandom
	Function StartBehaviour()
		theAnimation = GetRandom(hornyAni)
		EL_Utility.Log("Starting " + theAnimation + " Animation.", "EL_ActorAnimationState")
		lastAnimation = theAnimation
		Debug.SendAnimationEvent(GetRef(), theAnimation)
		RegisterForSingleUpdate(15)
	EndFunction

	Function BehaviourOnUpdate()
		if !SkipEndingPrevious
			Debug.SendAnimationEvent(GetRef(), endZaZAnimation)
		endif
		theAnimation = GetRandom(hornyAni)
		lastAnimation = theAnimation
		Debug.SendAnimationEvent(GetRef(), theAnimation)
		RegisterForSingleUpdate(15)
	EndFunction

	Function EndBehaviour()
		StopLastAnimation()
	EndFunction
EndState

State HornyRandomStanding
	Function StartBehaviour()
		theAnimation = GetRandom(hornyStandingAni)
		EL_Utility.Log("Starting " + theAnimation + " Animation.", "EL_ActorAnimationState")
		lastAnimation = theAnimation
		Debug.SendAnimationEvent(GetRef(), theAnimation)
		RegisterForSingleUpdate(15)
	EndFunction

	Function BehaviourOnUpdate()
		StopLastAnimation()
		theAnimation = GetRandom(hornyStandingAni)
		Utility.Wait(0.2)
		lastAnimation = theAnimation
		Debug.SendAnimationEvent(GetRef(), theAnimation)
		RegisterForSingleUpdate(15)
	EndFunction

	Function EndBehaviour()
		StopLastAnimation()
	EndFunction
EndState

Function ChangeByName(string newAnimation, bool doSkipEndPrevious = false)
	SkipEndingPrevious = doSkipEndPrevious
	theAnimation = newAnimation
	if (theAnimation != "")
		behaviour = "IdleByName"
	else
		behaviour = ""
	endif
EndFunction


Function ChangeState(string newState, int newAnimationNumber = -1, bool doSkipEndPrevious = false)
	SkipEndingPrevious = doSkipEndPrevious
	animationNumber = newAnimationNumber
	if (newState == "HornyRandom")
		behaviour = "HornyRandom"
	elseif (newState == "Horny")
		behaviour = "Horny"
	elseif (newState == "HornyRandomStanding")
		behaviour = "HornyRandomStanding"
	elseif (newState == "")
		behaviour = ""
	else
		EL_Utility.Log("CHANGE ACTOR Animation STATE: UNKNOWN STATE.", "EL_ActorAnimationState")
		behaviour = ""
	endif
EndFunction

; ### Behaviour Handling ###
String __behaviour = ""
String Property behaviour
	String Function get()
		return __behaviour
	EndFunction

	Function set(String value)
		__behaviour = value
		EndBehaviour()
		GoToState(__behaviour)
		StartBehaviour()
	EndFunction
EndProperty

Function StartBehaviour()
EndFunction

Function BehaviourOnUpdate()
EndFunction

Function EndBehaviour()
EndFunction