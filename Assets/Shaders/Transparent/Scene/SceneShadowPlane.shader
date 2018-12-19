// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Simplified Multiply Particle shader. Differences from regular Multiply Particle one:
// - no Smooth particle support
// - no AlphaTest
// - no ColorMask

Shader "JTC/SceneObject/ShadowPlane" 
{
	Properties
	{
		_MainTex("Particle Texture", 2D) = "white" {}
	}

	SubShader
	{
		Tags
		{
			"Queue" = "Geometry+5"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}

		Pass
		{
			Tags{ "LIGHTMODE"="ForwardBase" }

			Blend Zero SrcColor
			//Blend One zero

			Cull Back
			Lighting Off
			ZWrite Off
			Offset -5, 0

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fog

			#include "UnityCG.cginc"

			struct appdata_t {
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
			};

			struct v2f {
				float4 vertex : SV_POSITION;
				half2 texcoord : TEXCOORD0;
				UNITY_FOG_COORDS(1)
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;

			v2f vert(appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
				UNITY_TRANSFER_FOG(o, o.vertex);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				fixed3 srcColor = tex2D(_MainTex, i.texcoord);
				fixed3 colorWhite = fixed3(1, 1, 1);
				
				fixed3 fogColor = colorWhite;
				UNITY_APPLY_FOG_COLOR(i.fogCoord, fogColor, fixed3(0,0,0));

				fixed fogAlpha = fogColor.r;
				fixed3 maskColor = colorWhite * (1 - fogAlpha) + srcColor * fogAlpha;
				
				return fixed4(maskColor, 1);
			}

			ENDCG
		}
	}
}
