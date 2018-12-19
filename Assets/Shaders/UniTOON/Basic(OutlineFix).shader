Shader "UniToonUltra/Basic(OutlineFix)"
 {
    Properties 
	{
        _ShadowColor ("Shadow", Color) = (0, 0, 0, 1)
        _HighColor ("Highlighting Color", Color) = (0.5,0.5,0.5,1)
		_ColorOverride("Color Override", Color) = (0,0,0,0)

		_MainTex("Texture", 2D) = "white" {}
	
		[Toggle(RIDING)] _RIDING("Riding Texture", Int) = 0
		_RidingTex("Riding Texture", 2D) = "white" {}
        _Ramp("Shading Ramp", 2D) = "gray" {}

		_PartControl("Part Control Texture", 2D) = "black" {}
		[Toggle(PART_COLOR)] _PART_COLOR("Part Coloring", Int) = 0
		_PartColorR("Part Color R", Color) = (1,1,1,1)
		_PartColorG("Part Color G", Color) = (1,1,1,1)
		_PartColorB("Part Color B", Color) = (1,1,1,1)
		_PartColorA("Part Color A", Color) = (1,1,1,1)
/*
		_BrightnessR("Brightness R",Range(0,5)) = 0.8
		_BrightnessG("Brightness G",Range(0,5)) = 0.8
		_BrightnessB("Brightness B",Range(0,5)) = 0.8
		_BrightnessA("Brightness A",Range(0,5)) = 0
*/
		_IntensityR("Intensity R",Range(0,1)) = 0
		_IntensityG("Intensity G",Range(0,1)) = 0
		_IntensityB("Intensity B",Range(0,1)) = 0
		_IntensityA("Intensity A",Range(0,1)) = 0
/*
		_SaturationR("Saturation R",Range(0,5)) = 1
		_SaturationG("Saturation G",Range(0,5)) = 1
		_SaturationB("Saturation B",Range(0,5)) = 1
		_SaturationA("Saturation A",Range(0,5)) = 0

		_ContrastR("Contrast R",Range(0,5)) = 1
		_ContrastG("Contrast G",Range(0,5)) = 1
		_ContrastB("Contrast B",Range(0,5)) = 1
		_ContrastA("Contrast A",Range(0,5)) = 0
*/
		_AlphaMinDistance("Alpha Min Distance", Float) = 10
		_AlphaMaxDistance("Alpha Max Distance", Float) = 30
		_OutlineColor("Outline Color", Color) = (0,0,0,1)
		_Outline("Outline width", Range(.0001, 0.03)) = .0025

		[Toggle(FADING_IN)] _FADING_IN("Fading In", Int) = 0
		[HideInInspector] _FadeInTick("Fade In Tick", Float) = 0
		[HideInInspector] _FadeInDuration("Fade In Duration", Float) = 0.8
		[HideInInspector] _FadeDirection("Fade Direction", Float) = 1

		/*[HideInInspector]*/[Enum(Opaque,0,Blend,10)] _DestBlend("Dest Alpha Blend", Float) = 0
		//[Enum(Disabled,0,Greater,5)] _StencilCompare("Stencil Compare", Float) = 0
		//[Enum(Keep,0,Replace,2)] _StencilPass("Stencil Pass", Float) = 0

		[HideInInspector] _AmbientReplaceRate("", Float) = 0
		[HideInInspector] _AmbientReplaceColor("", Color) = (0,0,0,1)
    }

	Category
	{
		Tags{ "RenderType" = "Opaque" "Queue" = "Geometry+10" }

		SubShader
		{
			LOD 300

			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"

			UsePass "Hidden/UniToonUltra/OutlineFixPass/OUTLINE"
			UsePass "Hidden/UniToonUltra/OutlineFixPass/SHADOWCASTER"
		}

		SubShader
		{
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/SHADOWCASTER"
		}
	}

	Fallback "Unlit/Texture"
}