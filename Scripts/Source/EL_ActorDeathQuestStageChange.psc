Scriptname EL_ActorDeathQuestStageChange extends ReferenceAlias

Event OnDeath(Actor akKiller)
    EL_Quest.SetStage(NewStage)
EndEvent  

Quest Property EL_Quest  Auto

Int Property NewStage  Auto  
