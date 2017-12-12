Scriptname EL_LairMarkers extends Quest  

EL_LairMarkers function Get() Global
	return Game.GetFormFromFile(0x0516D73F, "LichEvilynn.esp") as EL_LairMarkers
endfunction

ObjectReference PlayerMoveTo
ObjectReference EvilynnMoveTo
ObjectReference BunnyMoveTo
ReferenceAlias Property LightningTarget  Auto
ReferenceAlias Property PlayerMoveToMarker  Auto
ReferenceAlias Property EvilynnMoveToMarker  Auto
ReferenceAlias Property BunnyMoveToMarker  Auto


event OnInit()
	PlayerMoveTo = PlayerMoveToMarker.GetReference()
	EvilynnMoveTo = EvilynnMoveToMarker.GetReference()
	BunnyMoveTo = BunnyMoveToMarker.GetReference()
endevent

; Lightning
ObjectReference  function GetLightningTarget() Global
	return Get().LightningTarget.GetReference()
endfunction

function SetLightningTarget(ObjectReference target) Global
	if target == none
		Get().LightningTarget.Clear()
	else
		Get().LightningTarget.ForceRefTo(target)
	endif
endfunction

; PLAYER
ObjectReference  function GetPlayerMarker() Global
	return Get().PlayerMoveToMarker.GetReference()
endfunction

function MovePlayer(float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0) Global
		Get().RunMovePlayer(toX, toY, toZ, toAngleX, toAngleY, toAngleZ)
endfunction

function RunMovePlayer(float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0)
		MoveMarker(PlayerMoveTo, toX, toY, toZ, toAngleX, toAngleY, toAngleZ)
endfunction

; EVILYNN
ObjectReference function GetEvilynnMarker() Global
	return Get().EvilynnMoveToMarker.GetReference()
endfunction

function MoveEvilynn(float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0) Global
		Get().RunMoveEvilynn(toX, toY, toZ, toAngleX, toAngleY, toAngleZ)
endfunction

function RunMoveEvilynn(float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0)
		MoveMarker(EvilynnMoveTo, toX, toY, toZ, toAngleX, toAngleY, toAngleZ)
endfunction

; BUNNY
ObjectReference function GetBunnyMarker() Global
	return Get().BunnyMoveToMarker.GetReference()
endfunction

function MoveBunny(float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0) Global
		Get().RunMoveBunny(toX, toY, toZ, toAngleX, toAngleY, toAngleZ)
endfunction 

function RunMoveBunny(float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0)
		MoveMarker(BunnyMoveTo, toX, toY, toZ, toAngleX, toAngleY, toAngleZ)
endfunction




function MoveMarker(ObjectReference marker, float toX, float toY, float toZ, float toAngleX = 0.0, float toAngleY = 0.0, float toAngleZ = 0.0)
	marker.SetPosition(toX, toY, toZ)
	marker.SetAngle(toAngleX, toAngleY, toAngleZ)
endfunction




