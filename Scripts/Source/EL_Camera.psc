Scriptname EL_Camera extends Quest  

EL_Camera function Get() Global
	return Game.GetFormFromFile(0x051244F1, "LichEvilynn.esp") as EL_Camera
endfunction

event OnInit()
	RegisterForSingleUpdate(0.1)
endevent

event OnUpdate()
	RunOnUpdate()
	RegisterForSingleUpdate(0.1)
endevent

function RunOnUpdate()
endfunction

function SetPlayerCamera()
	if Game.GetCameraState() == 0
		Game.ForceThirdPerson()
	endIf
endfunction
Actor Property PlayerREF Auto
ActorBase Property EL_GhostCamera Auto

Actor[] Cameras
