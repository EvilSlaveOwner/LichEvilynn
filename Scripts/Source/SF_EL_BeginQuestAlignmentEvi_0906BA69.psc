;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname SF_EL_BeginQuestAlignmentEvi_0906BA69 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
string Message1 = "You feel chilled to your very soul as you feel Evilynn caress your mind, insinuating herself into it like a poisonous, black fog."
string Message2 = "slowly, you regain the sense of your own body, your armour against your skin at first,\nthen the moistness of you mouth\nthe smell of a nearby torch\nthe sound of it returns\nfinally the blackness lifts from your eyes"
string Message3 = "You feel your arms move, enjoying the feeling of having a body again."
string Message4 = "With dawning horror you realize that it is not your pleasure you feel, but hers. And, despite not understanding how you know, you know who she is. Evillynn"
string Message5 = "Helplessly, your head is drawn down so that you can see down the length of your body watching your hands as they move of their will to slowly strip your armour from you"
Debug.MessageBox(Message1)
Utility.Wait(1)
Debug.MessageBox(Message2)
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

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
string Message1 = "With another of her insanely cruel laughs, you feel her presence fade and control of your body returns to you."
Debug.MessageBox(Message1)
GetOwningQuest().SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
string Message1 = "Your horror grows as you watch one hand move down you body to you pussy, feel our fingers gently part your lips, feel one of them begin stroking your clit."
string Message2 = "With a feeling of shame and guilt you realize that you enjoyed the resulting orgasm."
Debug.MessageBox(Message1)
Debug.MessageBox(Message2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
string Message1 = "With utter despair you helplessly watch your hands as they caress and stroke your body. You feel her enjoyment of the feel of your body as your hands softly glide over your skin as they move over your stomach to softly, gently stroke and cup your breasts. An enjoyment cruelly doubled by her pleasure at your horror and despair."
Debug.MessageBox(Message1)
(Alias_Player as EL_AlignmentForceMasturbationAlias).MasturbationGood(Game.GetPlayer(), RugMarker1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Quest.GetQuest("EL_SceneUtility") as EL_SceneUtilityScript).DoFadeOut(0.0)
string Message1 = "Your vision fogs and everything goes dark for you as you feel an immensely powerful entity invade your mind and body."
string Message2 = "You hear a voice in your mind, dripping with an evil you've never felt before."
Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
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

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
string Message1 = "For a moment that lasted an eternity,\nyou feel as though your very essence was torn from you and shredded into nothingness ..."
string Message2 = "You feel everything fade, you no longer feel the comforting safety of your armour, the satisfying weight of your weapon, the flow of air through your nostrils, the taste of your own mouth."
string Message3 = "You are surprised at just how ... pleasurable dying is."
string Message4 = "That same chillingly evil voice suddenly laughs with insane cruelty!!"
Debug.MessageBox(Message1)
Utility.Wait(2)
Debug.MessageBox(Message2)
Utility.Wait(2)
Debug.MessageBox(Message3)
Utility.Wait(2)
Debug.MessageBox(Message4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
string Message1 = "Suddenly, you stop breathing.\nYou just simply stop."
string Message2 = "Within a very short time, you can feel the need to for air.\nYou have the over-powering need to gasp for it, but nothing happens.\nYou begin to black out."
string Message3 = "Suddenly you can breathe again, but it is with an unnatural calmness and not the gasping and gulping for precious air that would normally happen. Soon enough, though, your breathing was fully restored"
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

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
string Message1 = "Well, that was fun.\n\nI'm going to enjoy playing with you.\n\nI'm going to take a nap, but don't worry. I'll be back soon."
Debug.MessageBox(Message1)
Game.GetPlayer().RemoveFromFaction(EL_PlayerSexEnd)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Alias Property Alias_Player  Auto  

Actor Property PlayerRef  Auto  

ObjectReference Property RugMarker1  Auto  

Faction Property EL_PlayerSexEnd  Auto  
