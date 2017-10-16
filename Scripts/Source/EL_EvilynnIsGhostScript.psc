Scriptname EL_EvilynnIsGhostScript extends Actor  

EffectShader Property GhostFX auto

Event OnLoad()
	GhostFX.Play(Self)
EndEvent