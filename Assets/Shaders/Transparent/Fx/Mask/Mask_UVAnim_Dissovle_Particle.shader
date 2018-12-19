// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Fx/Mask/UVAnim_Dissovle_Particle" 
{
    Properties 
    {
        _MainTex ("Base", 2D) = "white" {}
        [HDR]_TintColor ("TintColor", Color) = (1.0, 1.0, 1.0, 1.0)
        _UOffsetSpeed ("UOffsetSpeed", Float) = 0
        _VOffsetSpeed ("YOffsetSpeed", Float) = 0
        _UVRotateSpeed ("UVRotateSpeed", Float) = 0
        //_Intensity("Intensity", Float) = 1
        
        [Enum(Add,1,Blend,10)] _DestBlend ("Dest Alpha Blend", Float) = 1
        [Enum(Off,0,On,2)] _CullBack ("Cull Back", Float) = 2
        [Enum(Off,4,On,8)] _ZTest ("Always Show", Float) = 4

		_DissovleTex("Dissovle", 2D) = "white" {}
		_AlphaThreshold("Alpha Threshold", Range(-0.1, 1.01)) = 0

		[HDR]_DissovleColor("Dissovle Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_DissovleRange("Dissovle Range", Range(0, 1)) = 0

        _MaskTex ("Mask", 2D) = "white" {}
    }
    
    SubShader 
    {
        Tags { "RenderType" = "Transparent" "Queue" = "Transparent"}
        
        Pass {
            Tags { "LIGHTMODE"="ForwardBase" }
            Blend       SrcAlpha [_DestBlend]
            Cull        [_CullBack]
            ZTest       [_ZTest]
            Lighting    Off 
            ZWrite      Off
            
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
			#pragma vertex vert_uvAnim
			#pragma fragment frag_particle

			#include "../MaskDissovle.cg"
            ENDCG
        }
    }
}
