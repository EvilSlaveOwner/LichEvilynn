Scriptname EL_CaptiveMind extends ReferenceAlias  

event OnInit()
endevent

event OnUpdate()
	EL_Utility.Log("OnUpdate", "EL_CaptiveMind")
endevent

function Initialize()
endfunction

function Maintenance()
endfunction

function Capture()
	Initialize()
endfunction

; range is -100 to 100
; positive likes, negative dislikes
; Exhibitionism example:
; -100 = kick the cat out before changing
; 0 = meh, not that big of a deal
; 100 = loves being nude
; Cruelty example:
; -100 compassionate and self sacrificing
; 0 leave me alone and i'll leave you alone
; 100 scream for me my pretty!

; need to take the time to come up with a good list, leaving for now..
;

int Exhibitionism
int Happieness
int Masochism
int Dominance
int Cruelty
int Fear

; range 0 - 100
int MindBroken
int SexualExperience