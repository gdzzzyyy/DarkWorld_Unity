Shader "UniToonUltra/Basic(FixEffect)"
 {
    Properties 
	{
		_AmbientPower("Ambient Power", Float) = 0.1
        _ShadowColor ("Shadow", Color) = (0, 0, 0, 1)
        _HighColor ("Highlighting Color", Color) = (0.5,0.5,0.5,1)
        _Diffuse ("Diffuse", Color) = (1, 1, 1, 1)
        _Specular ("Specular", Color) = (1, 1, 1, 1)
        _Gloss ("Gloss", Range(8.0, 256)) = 20
        //_ColorOverride("Color Override", Color) = (0,0,0,0)
	   
        _MainTex("Texture", 2D) = "white" {}

        _Ramp("Shading Ramp", 2D) = "black" {}
        _FalloffSampler("Falloff Control", 2D) = "white"{}
        _LightShadeAlpha("Light Shade Alpha", Range(0,1)) = 0.1

		_AlphaMinDistance("Alpha Min Distance", Float) = 10
		_AlphaMaxDistance("Alpha Max Distance", Float) = 30
		//_OutlineColor("Outline Color", Color) = (0,0,0,1)
		//_Outline("Outline width", Range(.0001, 0.03)) = .0025
		_EdgeThickness("Outline", Float) = 1
		_OutlineDepth("Outline Depth", Float) = 0.1

		//[Toggle(FADING_IN)] _FADING_IN("Fading In", Int) = 0
		[HideInInspector] _FadeInTick("Fade In Tick", Float) = 0
		[HideInInspector] _FadeInDuration("Fade In Duration", Float) = 0.8
		[HideInInspector] _FadeDirection("Fade Direction", Float) = 1

		/*[HideInInspector]*/[Enum(Opaque,0,Blend,10)] _DestBlend("Dest Alpha Blend", Float) = 0

		[HideInInspector] _AmbientReplaceRate("", Float) = 0
		[HideInInspector] _AmbientReplaceColor("", Color) = (0,0,0,1)


		_Color("Main Color", Color) = (1, 1, 1, 1)
		_HighLight("High Light Range", Range(0,0.5)) = 0.3
		_HighLightPower("High Light Power", Float) = 0.5
		_HighLightColor("High light Outline Color", Color) = (0.5,0.5,0.5,1)
		_HighLightSampler("High Light Texture", 2D) = "white"{}
		_HighLightFixFactor("High Light Fix Factor", Range(0,1)) = 0

		_SelectOutLightColor("Select Outline Color", Color) = (1,1,1,1)
		_SelectOutLightWidth("Select Outline Width", Float) = 0
		_Stencil("Stencil ID", Float) = 0
    }

	Category
	{
		//Tags{ "RenderType" = "Opaque" "Queue" = "Geometry+10" }
		Tags{"RenderType" = "Qpaque" "Queue" = "Transparent"}

		SubShader
		{
			LOD 300

			UsePass "Hidden/UniToonUltra/OutlinePass/SELECTOUTLINE"
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"	
			
			UsePass "Hidden/UniToonUltra/OutlinePass/TOONEFFECT"
			UsePass "Hidden/UniToonUltra/OutlinePass/TOONEFFECTPOINT"
			UsePass "Hidden/UniToonUltra/OutlinePass/MONSTEROUTLINE"
			UsePass "Hidden/UniToonUltra/OutlinePass/SHADOWCASTER"

			//UsePass "Hidden/UniToonUltra/CelShaderPass/CELSHADERBAISIC"
		}

		SubShader
		{
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/SHADOWCASTER"
		}
	}
}