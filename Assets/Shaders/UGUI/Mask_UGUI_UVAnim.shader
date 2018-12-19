// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UGUI/Fx/Mask/UVAnim" 
{
    Properties 
    {
        [PerRendererData]_MainTex ("Base", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)

        _MaskTex ("Mask", 2D) = "white" {}

        _TintColor ("TintColor", Color) = (1.0, 1.0, 1.0, 1.0)
        _UOffsetSpeed ("UOffsetSpeed", Float) = 0
        _VOffsetSpeed ("YOffsetSpeed", Float) = 0
        _UVRotateSpeed ("UVRotateSpeed", Float) = 0
        _Intensity("Intensity", Float) = 1
        
        [Enum(Off,0,On,2)] _CullBack ("Cull Back", Float) = 2
        [Enum(Add,1,Blend,10)] _DestBlend ("Dest Alpha Blend", Float) = 1

        [KeywordEnum(Off, On)] _ALPHA_CUT("AlphaCut", Float) = 0
        _AlphaThreshold("AlphaThreshold", Range(0, 1)) = 0

		_StencilComp("Stencil Comparison", Float) = 8
		_Stencil("Stencil ID", Float) = 0
		_StencilOp("Stencil Operation", Float) = 0
		_StencilWriteMask("Stencil Write Mask", Float) = 255
		_StencilReadMask("Stencil Read Mask", Float) = 255

		_ColorMask("Color Mask", Float) = 15

        [Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
    }
    
    CGINCLUDE
		#pragma target 2.0

		#include "UnityCG.cginc"
		#include "UnityUI.cginc"
			
		#pragma multi_compile _ALPHA_CUT_OFF _ALPHA_CUT_ON
		#pragma multi_compile __ UNITY_UI_CLIP_RECT
		#pragma multi_compile __ UNITY_UI_ALPHACLIP

        #pragma vertex vert
        #pragma fragment frag
                
        sampler2D _MainTex;
        half4 _MainTex_ST;

        sampler2D _MaskTex;
        half4 _MaskTex_ST;

        half4 _TintColor;
        half _Intensity;

        float _UOffsetSpeed;
        float _VOffsetSpeed;
        float _UVRotateSpeed;
		
        fixed4 _Color;
        float4 _ClipRect;

        struct appdata_t {
            float4 vertex : POSITION;
            half4 color : COLOR;
            half2 texcoord : TEXCOORD0;
            UNITY_VERTEX_INPUT_INSTANCE_ID
        };

        struct v2f {
            float4 pos : SV_POSITION;
            fixed4 color    : COLOR;
            half4 colorFactor : COLOR1;
            half2 uv : TEXCOORD0;
            half2 uv2 : TEXCOORD1;
            float4 worldPosition : TEXCOORD2;
            UNITY_VERTEX_OUTPUT_STEREO
        };
		

        v2f vert(appdata_t v)
        {
            v2f o;
			
            UNITY_SETUP_INSTANCE_ID(v);
            UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
			
            o.worldPosition = v.vertex;
            o.color = v.color * _Color;

            const half TWO_PI = 3.14159 * 2;
            const half2 VEC_CENTER = half2(0.5h, 0.5h);
            
            o.pos = UnityObjectToClipPos (v.vertex);
            o.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
            
            float time = _Time.z;
            
            float absUVRotSpeed     = abs(_UVRotateSpeed);
            float absUOffsetSpeed   = abs(_UOffsetSpeed);
            float absVOffsetSpeed   = abs(_VOffsetSpeed);
            
            half2 finaluv =  o.uv.xy;
            if (absUVRotSpeed > 0.)
            {
                finaluv -= VEC_CENTER;
                
                half rotation = TWO_PI * frac(time * _UVRotateSpeed);
                half sin_rot = sin(rotation);
                half cos_rot = cos(rotation);
                
                finaluv = half2(
                    finaluv.x * cos_rot - finaluv.y * sin_rot,
                    finaluv.x * sin_rot + finaluv.y * cos_rot);
                    
                finaluv += VEC_CENTER;
            }
            
            if (absUOffsetSpeed > 0.)
            {
                finaluv.x += frac(time * _UOffsetSpeed);
            }
            if (absVOffsetSpeed > 0.)
            {
                finaluv.y += frac(time * _VOffsetSpeed);
            }

            o.uv.xy = finaluv;
            o.uv2.xy = TRANSFORM_TEX(v.texcoord, _MaskTex);
            o.colorFactor = v.color * _TintColor * _Intensity;  
            
            return o; 
        }

        fixed _AlphaThreshold;
        fixed4 frag( v2f i ) : SV_Target 
        {    
            fixed4 color = tex2D (_MainTex, i.uv.xy ) * i.color;
            fixed4 maskcolor = tex2D (_MaskTex, i.uv2.xy );
            
            color = half4(color * maskcolor) * i.colorFactor;
			
#ifdef UNITY_UI_CLIP_RECT
			color.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);
#endif

#ifdef UNITY_UI_ALPHACLIP
			clip (color.a - 0.001);
#endif

#ifdef _ALPHA_CUT_ON
            clip(color.a - _AlphaThreshold);
#endif
            return color;
        }
    ENDCG
    
    SubShader 
    {
        Tags
        {
            "Queue"="Transparent"
            "IgnoreProjector"="True"
            "RenderType"="Transparent"
            "PreviewType"="Plane"
            "CanUseSpriteAtlas"="True"
        }

        Stencil
		{
			Ref[_Stencil]
			Comp[_StencilComp]
			Pass[_StencilOp]
			ReadMask[_StencilReadMask]
			WriteMask[_StencilWriteMask]
		}

        Pass {
            Tags { "LIGHTMODE"="ForwardBase" }
			Blend SrcAlpha [_DestBlend]
            Cull        [_CullBack]
			ZTest [unity_GUIZTestMode]
            Lighting    Off 
            ZWrite      Off
			ColorMask [_ColorMask]

            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest

            ENDCG
        }
    }
}
