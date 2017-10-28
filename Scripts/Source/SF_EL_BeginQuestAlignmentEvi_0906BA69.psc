;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 75
Scriptname SF_EL_BeginQuestAlignmentEvi_0906BA69 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
string Message1 = "With another of her insanely cruel laughs, you feel her presence fade and control of your body returns to you."
Debug.MessageBox(Message1)
GetOwningQuest().SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
Game.DisablePlayerControls(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
Game.DisablePlayerControls(true)
string Message1 = "Your vision fogs and everything goes dark for you as you feel an immensely powerful entity invade your mind and body."
string Message2 = "You hear a voice in your mind, dripping with an evil you've never felt before."
Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
Game.GetPlayer().AddToFaction(EL_Posessed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(EL_PlayerSexEnd)
Game.DisablePlayerControls(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
string Message1 = "Suddenly, you stop breathing.\nYou just simply stop."
string Message2 = "Within a very short time,\nyou can feel the need to for air.\nYou have the over-powering need to gasp for it,\nbut nothing happens.\n\nYou begin to black out."
string Message3 = "Suddenly you can breathe again,\nbut it is with an unnatural calmness\nand not the gasping and gulping\n for precious air that would normally happen.\nSoon enough, though,\nyour breathing is fully restored"
Utility.Wait(1)
Debug.MessageBox(Message1)
Utility.Wait(3)
Debug.MessageBox(Message2)
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
Utility.Wait(5)
Debug.MessageBox(Message3)
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeIn(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
string Message1 = "You feel chilled to your very soul as you feel\nEvilynn caress your mind,\ninsinuating herself into it like\na poisonous, black fog."
string Message2 = "slowly, you regain the sense of your own body,\nyour armour against your skin at first,\nthen the moistness of you mouth\nthe smell of a nearby torch\nthe sound of it returns\n\nfinally the blackness lifts from your eyes"
string Message3 = "You feel your arms move,\nenjoying the feeling of having a body again."
string Message4 = "With dawning horror you realize that\n\nit is not your pleasure you feel, but hers.\n\nAnd, despite not understanding how you know,\nyou know who she is.\n\nEvillynn"
string Message5 = "Helplessly, your head is drawn down so\nthat you can see down the length\nof your body.\n\nWatching your hands as they move\nof their will to\nslowly strip your armour from you"
Debug.MessageBox(Message1)
Utility.Wait(1)
Debug.MessageBox(Message2)
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeIn(0.0)
Utility.Wait(1)
Debug.MessageBox(Message3)
Utility.Wait(1)
Debug.MessageBox(Message4)
Utility.Wait(1)
Debug.MessageBox(Message5)
Utility.Wait(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
string Message1 = "You feel as though a thousand dragon's claws rip into your soul as you are dragged from pure bliss back into your body."
Debug.MessageBox(Message1)
Utility.Wait(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
Utility.Wait(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
string Message1 = "For a moment that lasted an eternity,\nyou feel as though your very essence was torn from you and shredded into nothingness ..."
string Message2 = "You feel everything fade,\nyou no longer feel,\nthe comforting safety of your armor,\nthe satisfying weight of your weapon,\nthe flow of air through your nostrils,\nthe taste of your own mouth."
string Message3 = "You are surprised at just how ...\n\npleasurable dying is."
string Message4 = "That same chillingly evil voice suddenly laughs with insane cruelty!!"
Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
Utility.Wait(2)
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
Debug.MessageBox(Message3)
Utility.Wait(2)
Debug.MessageBox(Message4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Game.DisablePlayerControls(true)
(Alias_Player as EL_AlignmentForceMasturbationAlias).MasturbationGood(Game.GetPlayer(), RugMarker1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Alias Property Alias_Player  Auto  

Actor Property PlayerRef  Auto  

ObjectReference Property RugMarker1  Auto  

Faction Property EL_PlayerSexEnd  Auto  

Faction Property EL_Posessed  Auto  
