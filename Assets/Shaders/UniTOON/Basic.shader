Shader "UniToonUltra/Basic"
 {
    Properties 
	{
        _ShadowColor ("Shadow", Color) = (0, 0, 0, 1)
        _HighColor ("Highlighting Color", Color) = (0.5,0.5,0.5,1)

		_MainTex("Texture", 2D) = "white" {}

        _Ramp("Shading Ramp", 2D) = "gray" {}

		_AlphaMinDistance("Alpha Min Distance", Float) = 10
		_AlphaMaxDistance("Alpha Max Distance", Float) = 30

		_OutlineColor("Outline Color", Color) = (0,0,0,1)
		_Outline("Outline width", Range(.0001, 0.03)) = .0025

		_SelectOutLightColor("Select Outline Color", Color) = (1,0.4,0,1)
		_SelectOutLightWidth("Select Outline Width", Float) = 0

		_Stencil("Stencil ID", Float) = 0
    }

	Category
	{
		Tags{ "RenderType" = "Opaque" "Queue" = "Geometry+10" }

		SubShader
		{
			LOD 1000

			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"

			UsePass "Hidden/UniToonUltra/OutlinePass/OUTLINE"
			UsePass "Hidden/UniToonUltra/OutlinePass/SHADOWCASTER"
		}

		SubShader
		{
			LOD 300

			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"
			UsePass "Hidden/UniToonUltra/OutlinePass/SELECTOUTLINE"

			UsePass "Hidden/UniToonUltra/OutlinePass/OUTLINE"
			UsePass "Hidden/UniToonUltra/OutlinePass/SHADOWCASTER"
		}

		SubShader
		{
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/FORWARD"
			UsePass "Hidden/UniToonUltra/ForwardPass/Basic/SHADOWCASTER"
		}
	}
}