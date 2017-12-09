Scriptname EL_Screen extends Quest  

EL_Screen function Get() Global
	return Game.GetFormFromFile(0x051244EE, "LichEvilynn.esp") as EL_Screen
endfunction

float FadeOutDuration = 900.0
float FadedAt = 0.0
bool IsFadedOut = false


ImageSpaceModifier Property FadeToBlack auto
ImageSpaceModifier Property FadeFromBlack auto

event OnInit()
endevent

event OnUpdate()
	if IsFadedOut
		CheckFade()
		RegisterForSingleUpdate(10.0)
	endif
endevent

function CheckFade()
	FadeOutContinue()
endfunction

function FadeOut() Global
	EL_Screen.Get().DoFadeOut()
endfunction

function FadeIn() Global
	EL_Screen.Get().DoFadeIn()
endfunction

function DoFadeOut()
	FadedAt = Utility.GetCurrentRealTime()
	EL_Utility.Log("Fading out at " + FadedAt + ".", "EL_Screen")
	FadeToBlack.Apply()
	Utility.Wait(0.1)	
	IsFadedOut = true
	Game.FadeOutGame(false, true, FadeOutDuration, 1)
	Utility.Wait(0.5)
	RegisterForSingleUpdate(0.1)
endfunction

function FadeOutContinue()
	FadedAt = Utility.GetCurrentRealTime()
	EL_Utility.Log("Stay faded out.", "EL_Screen")
	Game.FadeOutGame(false, true, FadeOutDuration, 1)
endfunction

function DoFadeIn()
	if IsFadedOut == false
		return
	endif
	EL_Utility.Log("Fading in at " + Utility.GetCurrentRealTime(), "EL_Screen")
	IsFadedOut = false
	Game.FadeOutGame(false, true, 0.1, 0.1)
	FadeToBlack.PopTo(FadeFromBlack)
	Utility.Wait(0.5)
endfunction