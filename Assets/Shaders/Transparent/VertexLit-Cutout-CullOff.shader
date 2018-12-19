// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "JTC/SceneObject/Cutout/VertexLit Both Side" 
{
	Properties
	{
		_MainTex("Base (RGB)", 2D) = "white" {}
		_Cutoff("Alpha cutoff", Range(0,1)) = 0.5
	}

	SubShader
	{
		Tags{ "Queue" = "AlphaTest" "IgnoreProjector" = "True" "RenderType" = "TransparentCutout" }
		LOD 100
		Cull off

		Pass
		{
			Name "FORWARD"
			Tags{ "LightMode" = "ForwardBase" }

			CGPROGRAM

			#pragma vertex vert_surf
			#pragma fragment frag_surf
			#pragma multi_compile_fwdbase
			#pragma multi_compile_fog

			#include "HLSLSupport.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"

			inline float3 LightingLambertVS(float3 normal, float3 lightDir)
			{
				fixed diff = max(0, dot(normal, lightDir));
				return _LightColor0.rgb * diff;
			}

			sampler2D _MainTex;
			float4 _MainTex_ST;

			struct Input {
				float2 uv_MainTex;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				half4 c = tex2D(_MainTex, IN.uv_MainTex);
				o.Albedo = c.rgb;
				o.Alpha = c.a;
			}

			struct v2f_surf 
			{
				float4 pos : SV_POSITION;
				float2 pack0 : TEXCOORD0;

				#ifdef LIGHTMAP_OFF
				fixed3 normal : TEXCOORD1;
				#endif

				#ifndef LIGHTMAP_OFF
				float2 lmap : TEXCOORD2;
				#endif

				#ifdef LIGHTMAP_OFF
				fixed3 vlight : TEXCOORD2;
				#endif

				LIGHTING_COORDS(3,4)
				UNITY_FOG_COORDS(5)
			};

			v2f_surf vert_surf(appdata_full v)
			{
				v2f_surf o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.pack0.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
			#ifndef LIGHTMAP_OFF
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
			#endif

				float3 worldN = UnityObjectToWorldNormal(v.normal);
			#ifdef LIGHTMAP_OFF
				o.normal = worldN;
			#endif

			#ifdef LIGHTMAP_OFF
				o.vlight = ShadeSH9(float4(worldN,1.0));
				o.vlight += LightingLambertVS(worldN, _WorldSpaceLightPos0.xyz);
			#endif // LIGHTMAP_OFF

				TRANSFER_VERTEX_TO_FRAGMENT(o);
				UNITY_TRANSFER_FOG(o,o.pos);
				return o;
			}

			fixed _Cutoff;

			fixed4 frag_surf(v2f_surf IN) : SV_Target
			{
				Input surfIN;
				surfIN.uv_MainTex = IN.pack0.xy;

				SurfaceOutput o;

				o.Albedo = 0.0;
				o.Alpha = 0.0;

				o.Emission = 0.0;
				o.Specular = 0.0;
				o.Gloss = 0.0;

			#ifdef LIGHTMAP_OFF
				o.Normal = IN.normal;
			#else
				o.Normal = 0;
			#endif

				surf(surfIN, o);

				fixed4 c = 0;
				c.a = o.Alpha;
				clip(c.a - _Cutoff);

			#ifdef LIGHTMAP_OFF
				fixed atten = LIGHT_ATTENUATION(IN);
				c.rgb = o.Albedo * IN.vlight * atten;
			#else
				fixed3 lm = DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap, IN.lmap.xy));
				c.rgb += o.Albedo * lm;
			#endif

				UNITY_APPLY_FOG(IN.fogCoord, c);

				return c;
			}

				ENDCG
			}
	}

		FallBack "Mobile/VertexLit"
}
