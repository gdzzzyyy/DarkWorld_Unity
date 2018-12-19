// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Hidden/UniToonUltra/OutlinePass"
{
    SubShader
    {
		Pass
        {
            Name "OUTLINE"

            Tags{ "LightMode" = "ForwardBase" }
            Cull Front
            ZTest Less
            Offset 2.5, 0
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile _ FADING_IN
			#pragma multi_compile _ RIDING 
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            #ifndef SHADER_API_MOBILE
                #define SHADER_API_MOBILE
            #endif

			struct appdata {
				float4 vertex : POSITION;
#ifdef RIDING
				half2 texcoord : TEXCOORD0;
#endif
				half3 normal : NORMAL;
			};

			struct v2f {
				float4 pos : SV_POSITION;
#ifdef RIDING
				half2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
#else
				UNITY_FOG_COORDS(0)
#endif
				fixed4 color : COLOR;
			};

            half _Outline;
            fixed4 _OutlineColor;
            half _AlphaMinDistance;
            half _AlphaMaxDistance;

#ifdef FADING_IN
            half _FadeInTick;
            half _FadeInDuration;
			half _FadeDirection;
#endif

#ifdef RIDING
			sampler2D _RidingTex;
			half4 _RidingTex_ST;
#endif
            v2f vert(appdata v)
            {
                v2f o;

                float4 position = UnityObjectToClipPos(v.vertex);

                half3 norm = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal);
                half2 offset = normalize(TransformViewToProjection(norm.xy));

#if defined(SHADER_API_GLCORE) || defined(SHADER_API_OPENGL) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)  
				float d = 0.5 * (position.z + position.w);
#else
				float d = UNITY_Z_0_FAR_FROM_CLIPSPACE(position.z);
#endif
				float thickness = max(2, min(30, d * (unity_CameraProjection[1][1] / 1.732051)));
				position.xy += offset * _Outline * thickness;

                o.pos = position;

                half alpha = 1.0 - saturate((d - _AlphaMinDistance) / (_AlphaMaxDistance - _AlphaMinDistance));
                alpha *= _OutlineColor.a;
#ifdef FADING_IN
                alpha *= _FadeDirection * clamp(((_Time.y - _FadeInTick) / _FadeInDuration - 0.5), -0.5, 0.5) + 0.5;
#endif
                o.color = fixed4(_OutlineColor.rgb, alpha);

#ifdef RIDING
				o.uv.xy = TRANSFORM_TEX(v.texcoord, _RidingTex);
#endif

                UNITY_TRANSFER_FOG(o, o.pos);

                return o;
            }

            fixed4 frag(v2f i) : COLOR
            {
#ifdef RIDING
				fixed4 ocolor = tex2D(_RidingTex, i.uv.xy);
				clip(ocolor.a - 0.5);
#endif
                fixed4 srcColor = i.color;
                UNITY_APPLY_FOG(i.fogCoord, srcColor);
                return srcColor;
            }

            ENDCG
        }
		
		Pass
		{
			Name "SHADOWCASTER"

			Tags{ "LightMode" = "ShadowCaster" }
			Cull Front
			ZTest Less
			ZWrite On
			Blend SrcAlpha OneMinusSrcAlpha

			CGPROGRAM
			#pragma vertex vert2
			#pragma fragment frag2

			#include "UnityCG.cginc"

			struct appdata 
			{
				float4 vertex : POSITION;
				half3 normal : NORMAL;
			};

			struct v2f
			{
				float4 pos : POSITION;
			};

			half _Outline;
			half4 _OutlineColor; 
			half _AlphaMinDistance;
			half _AlphaMaxDistance;

			v2f vert2(appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);

				half3 norm = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal);
				half2 offset = normalize(TransformViewToProjection(norm.xy));

				half thickness = max(1, o.pos.z);
				o.pos.xy += offset * _Outline * thickness;

				return o;
			}

			fixed4 frag2(v2f i) : COLOR
			{
				return fixed4(0,0,0,0);
			}

			ENDCG
		}

		Pass
		{
			Name "MONSTEROUTLINE"

			Cull Front
			ZTest Less

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"		
			#include "MonsterOutline.cg"
			ENDCG
		}		
		
		Pass
		{
			Blend One Zero 

			Name "TOONEFFECT"
			Tags { "LightMode"="ForwardBase" }
			//Cull Off
			ZTest LEqual
			
			CGPROGRAM
			#pragma multi_compile_fwdbase
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "ToonEffect.cg"
			ENDCG
		}

		Pass
		{
			Blend One Zero 

			Name "TOONEFFECTPOINT"
			Tags { "LightMode"="ForwardAdd" }
			//Cull Off
			ZTest LEqual
			
			CGPROGRAM
			#pragma multi_compile_fwdadd_fullshadows
			#pragma vertex vert_point
			#pragma fragment frag_point
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "ToonEffect.cg"
			ENDCG
		}

		Pass
		{
			Name "SELECTOUTLINE"
			Tags { "LightMode " = "Always"}
			Stencil
			{
				Ref[_Stencil]
				Comp NotEqual
				Pass Keep
				ReadMask 255
				WriteMask 255
			}            		
			
		    CGPROGRAM
		    #pragma vertex vert
		    #pragma fragment frag
              
		    #include "UnityCG.cginc"
              
		    struct appdata 
		    {
		        float4 vertex : POSITION;
		        float3 normal : NORMAL;
		    };
              
		    struct v2f
		    {
		        float4 pos : POSITION;
		    };
              
		    uniform float _SelectOutLightWidth;
		    uniform float4 _SelectOutLightColor;
              
		    v2f vert(appdata v)
		    {
		        v2f o;

                float4 position = UnityObjectToClipPos(v.vertex);
				#if defined(SHADER_API_GLCORE) || defined(SHADER_API_OPENGL) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)  
					float d = 0.5 * (position.z + position.w);
				#else
					float d = UNITY_Z_0_FAR_FROM_CLIPSPACE(position.z);
				#endif
				float thickness = max(2, min(30, d * (unity_CameraProjection[1][1] / 1.732051)));


		        float3 norm = normalize(v.normal);
		        v.vertex.xyz += norm * _SelectOutLightWidth  * 0.001 * thickness;
		        o.pos = UnityObjectToClipPos(v.vertex);
                
		        return o;
		    }

		    half4 frag(v2f i) : COLOR
		    {
		        return _SelectOutLightColor;
		    }
            ENDCG
		}
    }
}