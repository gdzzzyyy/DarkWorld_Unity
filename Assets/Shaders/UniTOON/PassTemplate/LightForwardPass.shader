Shader "Hidden/UniToonUltra/ForwardPass/Light" {

	CGINCLUDE
		#include "Lighting.cginc"
        #pragma multi_compile_fog

        #ifndef SHADER_API_MOBILE
        #define SHADER_API_MOBILE
        #endif

		sampler2D _MainTex;
		sampler2D _Ramp;

		half3 _HighColor;
		half3 _ShadowColor;

		half _AlphaHint;
		half _AlphaHintRange;
		half _AlphaHintSpeed;

#ifdef FADING_IN
		half _FadeInTick;
		half _FadeInDuration;
		half _FadeDirection;
#endif
		half _AmbientReplaceRate;
		half3 _AmbientReplaceColor;

		half4 LightingRamp(SurfaceOutput s, half3 lightDir, half atten)
		{
			half NdotL = dot(s.Normal, lightDir);
			half diff = NdotL * 0.5 + 0.5;
			half3 ramp = tex2D(_Ramp, float2(diff, diff)).rgb;
			ramp = lerp(_ShadowColor, _HighColor, ramp);
			half3 c;
			c = (s.Albedo * _LightColor0.rgb * ramp) * (atten * 2);

			return half4(c,1);
		}

		struct Input
		{
			float2 uv_MainTex;
			UNITY_FOG_COORDS(1)
		};

		void vert(inout appdata_full v, out Input o)
		{
			UNITY_INITIALIZE_OUTPUT(Input, o);

#if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
			float4 hpos = UnityObjectToClipPos(v.vertex);
			UNITY_TRANSFER_FOG(o, hpos);
#endif
		}

		void TintFinalColor(Input IN, SurfaceOutput o, inout fixed4 color)
		{
			float highlight;
			if (_AlphaHintSpeed * _AlphaHintRange > 0)
			{
				half t = _AlphaHintRange * (sin(_Time.z * _AlphaHintSpeed) + 1);
				highlight = o.Alpha * (_AlphaHint + t);
			}
			else
			{
				highlight = o.Alpha * _AlphaHint;
			}
			color.rgb *= (1 + highlight);

			color.rgb += o.Albedo.rgb * lerp(UNITY_LIGHTMODEL_AMBIENT.rgb, _AmbientReplaceColor, _AmbientReplaceRate);
#ifdef FADING_IN
			fixed a = _FadeDirection * clamp(((_Time.y - _FadeInTick) / _FadeInDuration - 0.5), -0.5, 0.5) + 0.5;
			color.a = a;
#endif
#if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
			IN.fogCoord += highlight;
			half useFog = step(1.0, _AmbientReplaceRate);
			UNITY_APPLY_FOG(max(IN.fogCoord, half3(useFog, useFog, useFog)), color);
#endif
		}

		void surf(Input IN, inout SurfaceOutput o)
		{
			half4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
	ENDCG

    SubShader 
	{
		Blend SrcAlpha [_DestBlend]

		CGPROGRAM
		#pragma surface surf Ramp vertex:vert finalcolor:TintFinalColor noambient novertexlights addshadow noshadow nolightmap nodynlightmap nodirlightmap nometa noforwardadd nolppv noinstancing exclude_path:deferred exclude_path:prepass
		#pragma multi_compile _ FADING_IN

#ifdef FADING_IN
		#undef UNITY_OPAQUE_ALPHA
		#define UNITY_OPAQUE_ALPHA(a) a=a
#endif
		ENDCG
    }
}