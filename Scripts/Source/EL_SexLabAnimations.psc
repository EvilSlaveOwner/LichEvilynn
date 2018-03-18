Scriptname EL_SexLabAnimations extends  sslAnimationFactory

string AnimationLongPrefix = "Lich Evilynn"

EL_SexLabAnimations function Get() Global
	return Game.GetFormFromFile(0x1E8619, "LichEvilynn.esp") as EL_SexLabAnimations
endfunction

function LoadAnimations()
	EL_Utility.Log("LoadAnimations", "EL_SexLabAnimations")

	PrepareFactory()
	RegisterAnimation("EL_StoryBunnyRapeOne")
endfunction

function EL_LongFaceSit(int id)
	string animationName = "EL_StoryBunnyRapeOne"
	sslBaseAnimation Base = Create(id)
	
	EL_Utility.Log("Registering " + animationName, "EL_SexLabAnimations")

	Base.Name = AnimationLongPrefix + " Story - Bunny Rape One"
	Base.SoundFX = Squishing

	int a1 = Base.AddPosition(Female, Oral)
	Base.AddPositionStage(a1, animationName + "_A1_S1", silent = true, strapon = false)
	Base.AddPositionStage(a1, animationName + "_A1_S2", strapon = false)
	Base.AddPositionStage(a1, animationName + "_A1_S2", silent = true, strapon = false)

	int a2 = Base.AddPosition(Female, Oral)
	Base.AddPositionStage(a2, animationName + "_A2_S1", silent = true, openmouth = true, strapon = false)
	Base.AddPositionStage(a2, animationName + "_A2_S2", silent = true, openmouth = false, strapon = false)
	Base.AddPositionStage(a2, animationName + "_A2_S2", silent = true, openmouth = false, strapon = false)
	
	Base.SetStageTimer(1, 25.0)
	Base.SetStageTimer(2, 45.0)
	Base.SetStageTimer(3, 45.0)
	Base.SetStageSoundFX(3, none)
	
	Base.SetTags("LichEvilynn,Story,Aggrssive,Forced,Sex,Rape,FaceSit,Oral,Lesbian,FF")
	Base.Save(id)
endfunction