Shader "Toon/Actor"
 {
    Properties 
	{
        [NoScaleOffset]_MainTex("Base Map(rgb) Area Emission(a)", 2D) = "white" {}
        [NoScaleOffset]_BrightnessTex("Bright(r) Spec.(g) Hair Spec.(b)", 2D) = "white"{}
		
        [Header(Bright Color)]
        [HDR]_BrightColor("Bright Color", Color) = (0.5,0.5,0.5,1)

        [Header(First Ramp Shadow)]
        _FirstRampThras("First Ramp Thras", Range(0,1)) = 0.5
        [PowerSlider(5)]_FirstRampEdgeSoftness("Softness", Range(1,1000)) = 50

        [NoScaleOffset]_FirstShadow("Shadow Map", 2D) = "black" {}
        [HDR]_FirstShadowColor("Shadow Color", Color) = (0, 0, 0, 1)
        _FirstShadowUseColorOrMap("First Shadow Use Color Or Map", Range(0,1)) = 1
		
        [Header(Ambient)]
        _AmbientPower("Ambient Power", Range(0,1)) = 0.1
        
        [Header(Emission Noise)]
        _HeatTime("Heat Time", range (-1,1)) = 0

        _EmissionTex("Distort X(r) Y(g) Area(b)", 2D) = "white" {}

        _ForceX("Strength X", range (0,1)) = 0.1
        _ForceY("Strength Y", range (0,1)) = 0.1

        [Header(Rim Emission)]
        _RimEdgeness("Rim Edgeness", Range(0,1)) = 0.3
        _RimBrightThrashold("Rim Bright Thrashold", Range(-1, 1)) = 0.3
        [PowerSlider(5)]_RimEdgeSoftness("Softness", Range(1, 1000)) = 100
		[NoScaleOffset]_RimTex("Rim Texture", 2D) = "white"{}
		[HDR]_RimColor("Rim Color", Color) = (0.5,0.5,0.5,1)
		_RimUseColorOrMap("Rim Color Use Color or Map", Range(0,1)) = 0
		_RimIntensity("Rim Intensity", Range(0,2)) = 0.5

		[Header(Area Emission)]
		[Toggle(EMISSION_FLOW)] _EMISSION_FLOW("Use Area Emission", Int) = 0
		[HDR]_EmissionColor("Emission Color", Color) = (0.5,0.5,0.5,1)
		
		_AlphaHint ("Hint Base", Range(0, 5)) = 1
		_AlphaHintRange("Hint Range", Range(0, 5)) = 0
		_AlphaHintSpeed("Hint Speed", Range(0, 10)) = 0

		[Header(Metal Specular)]
		[Toggle(METAL_SPECULAR)] _METAL_SPECULAR("Use Metal Specular", Int) = 0
		[HDR]_MetalSpecularColor("Color(rgb) Intensity(a)", Color) = (1, 1, 1, 1)
		[HDR]_SpecularFadeColor("Outer Color(rgb) Fade Rate(a)", Color) = (1, 1, 1, 1)
		[PowerSlider(3.0)]_MetalSpecularPower("Specular Power", Range(0.0001, 500)) = 10
		

		[Header(Outline Control)]
		//_EdgeThickness ("Outline Thickness", Float) = 1
		_Outline("Outline Width", Range(.0001, 0.03)) = .0025
		[HDR]_OutlineAdjustColor("Outline Adjust Color", Color) = (1, 1, 1, 1)
		
		_Farthest_Distance ("Outline Fixed Wide Distance", Float ) = 0.5
		_Outline_Wide_Change_Range ("Outline Wide Change Range", Float ) = 20

		_AlphaMinDistance("Alpha Min Distance", Float) = 10
		_AlphaMaxDistance("Alpha Max Distance", Float) = 30
		
		_OutlineZOffset("Z Offset", Range(0, 50)) = 0
		
		[Header(Fade IN OUT)]
		[Enum(Opaque,0,Blend,10)] _DestBlend("Dest Alpha Blend", Float) = 0
		[HideInInspector]_FadingAlpha("Fading Alpha", Range(0,1)) = 1
		_TransparentAlpha("Transparent Alpha", Range(0,1)) = 1
    }

	Category
	{
		Tags{ "RenderType" = "Opaque" "Queue" = "Geometry" }

		SubShader
		{
			LOD 300

			UsePass "Hidden/ToonPass/TOONEFFECT"
			UsePass "Hidden/ToonPass/OUTLINE"
			UsePass "Hidden/ToonPass/SHADOWCASTER"
		}

		SubShader
		{
			UsePass "Hidden/ToonPass/TOONEFFECT"
			UsePass "Hidden/ToonPass/SHADOWCASTER"
		}
	}
}