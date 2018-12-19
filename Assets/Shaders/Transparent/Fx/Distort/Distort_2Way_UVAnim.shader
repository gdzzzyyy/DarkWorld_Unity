// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Fx/Distort/2D_UVAnim"
{
    Properties 
    {
        _MainTex ("Base", 2D) = "white" {}

        _HeatTime  ("Heat Time", range (-1,1)) = 0

        _NoiseXTex ("Distort Texture X", 2D) = "black" {}
        _ForceX  ("Strength X", range (0,1)) = 0.1
		
        _NoiseYTex ("Distort Texture Y", 2D) = "black" {}
        _ForceY  ("Strength Y", range (0,1)) = 0.1

        _UVRotateSpeed ("UVRotateSpeed", Float) = 0
        [HDR]_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
        
        //[Enum(Add,1,Blend,5)] _SrcBlend ("Source Alpha Blend", Float) = 1
        [Enum(Add,1,Blend,10)] _DestBlend ("Dest Alpha Blend", Float) = 1
        [Enum(Off,0,On,2)] _CullBack ("Cull Back", Float) = 2
        [Enum(Off,4,On,8)] _ZTest ("Always Show", Float) = 4

		[KeywordEnum(Off, On)] _ALPHA_CUT("AlphaCut", Float) = 0
		_AlphaThreshold("AlphaThreshold", Range(0, 1)) = 0

        _MaskTex ("Mask", 2D) = "white" {}
    }
    
    CGINCLUDE
		#pragma multi_compile _ALPHA_CUT_OFF _ALPHA_CUT_ON
		#include "UnityCG.cginc"

        #pragma vertex vert
        #pragma fragment frag
        
        struct appdata_t {
            float4 vertex : POSITION;
            half2 texcoord: TEXCOORD0;
            half4 color : COLOR;
        };

        struct v2f {
            float4 vertex : POSITION;
            half2 uvmain : TEXCOORD0;
            half2 uvdistortX : TEXCOORD1;
            half2 uvdistortY : TEXCOORD2;
            half2 uvmask : TEXCOORD3;
            half4 colorFactor : COLOR;
        };

        half _ForceX;
        half _ForceY;
        float _HeatTime;

        sampler2D _MainTex;
        half4 _MainTex_ST;

        sampler2D _NoiseXTex;
        half4 _NoiseXTex_ST;

        sampler2D _NoiseYTex;
        half4 _NoiseYTex_ST;

        sampler2D _MaskTex;
        half4 _MaskTex_ST;

        half _UVRotateSpeed;

        half4 _TintColor;

        v2f vert (appdata_t v)
        {
            v2f o;

            const half TWO_PI = 3.14159 * 2;
            const half2 VEC_CENTER = half2(0.5h, 0.5h);

            o.vertex = UnityObjectToClipPos(v.vertex);
            o.colorFactor = v.color * _TintColor * 2;

            o.uvmain = TRANSFORM_TEX( v.texcoord, _MainTex );

            o.uvdistortX = TRANSFORM_TEX( v.texcoord, _NoiseXTex );
            o.uvdistortY = TRANSFORM_TEX( v.texcoord, _NoiseYTex );
			
            o.uvmask = TRANSFORM_TEX(v.texcoord, _MaskTex);

            float time = _Time.z;
            
            float absUVRotSpeed = abs(_UVRotateSpeed);
            half2 finaluv = o.uvmain.xy;
            if (absUVRotSpeed > 0.0)
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

            o.uvmain.xy = finaluv;
            
            return o;
        }

		half4 _AlphaThreshold;
        half4 frag( v2f i ) : SV_Target
        {
            float4 time = _Time;
            
            //noise effect
            half offsetColor1 = tex2D(_NoiseXTex, i.uvdistortX + frac(time.xz * _HeatTime));
            i.uvmain.x += (offsetColor1 - 0.5h) * _ForceX;

            half offsetColor2 = tex2D(_NoiseYTex, i.uvdistortY + frac(time.xz * _HeatTime));
            i.uvmain.y += (offsetColor2 - 0.5h) * _ForceY;

			half4 ocolor = tex2D(_MainTex, i.uvmain) * i.colorFactor;

#ifdef _ALPHA_CUT_ON
			clip(ocolor.a - _AlphaThreshold);
#endif
            half4 maskcolor = tex2D (_MaskTex, i.uvmask);

            return ocolor * maskcolor;
        }

    ENDCG
          
    SubShader 
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }
        
        Pass 
        {
            Tags { "LIGHTMODE"="ForwardBase" }
            Blend       SrcAlpha [_DestBlend]
            Cull        [_CullBack]
            ZTest       [_ZTest]
            Lighting    Off 
            ZWrite      Off
        
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            ENDCG
        }
    }
}
