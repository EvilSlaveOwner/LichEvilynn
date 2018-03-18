Scriptname EL_PlayerOnGameLoad extends ReferenceAlias  

Event OnPlayerLoadGame()
	EL_Utility.Log("Player loaded game.", "EL_PlayerOnGameLoad")
	EL_OnGameLoad.Get().Maintenance()
EndEvent
