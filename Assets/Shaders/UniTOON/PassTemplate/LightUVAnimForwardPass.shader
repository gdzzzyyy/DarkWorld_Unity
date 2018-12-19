Shader "Hidden/UniToonUltra/ForwardPass/LightUVAnim" 
{
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

		half _UOffsetSpeed;
		half _VOffsetSpeed;
		half _UVRotateSpeed;

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

			return half4(c, 1);
		}

		struct Input
		{
			half2 uv_MainTex	: TEXCOORD0;
			half2 tc_Emission	: TEXCOORD1;
			UNITY_FOG_COORDS(2)
		};

		sampler2D _EmissionTex;
		half4 _EmissionTex_ST;

		half4 _EmissionColor;

		void VertUVAnim(inout appdata_full v, out Input data)
		{
			UNITY_INITIALIZE_OUTPUT(Input, data);

#if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
			float4 hpos = UnityObjectToClipPos(v.vertex);
			UNITY_TRANSFER_FOG(data, hpos);
#endif
			const half TWO_PI = 3.14159 * 2;
			const half2 VEC_CENTER = half2(0.5h, 0.5h);

			data.tc_Emission = TRANSFORM_TEX(v.texcoord, _EmissionTex);

			float time = _Time.z;

			half absUVRotSpeed = abs(_UVRotateSpeed);
			half absUOffsetSpeed = abs(_UOffsetSpeed);
			half absVOffsetSpeed = abs(_VOffsetSpeed);

			half2 finaluv = data.tc_Emission;
			if (absUVRotSpeed > 0)
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

			if (absUOffsetSpeed > 0)
			{
				finaluv.x += frac(time * _UOffsetSpeed);
			}
			if (absVOffsetSpeed > 0)
			{
				finaluv.y += frac(time * _VOffsetSpeed);
			}

			data.tc_Emission = finaluv;
		}

		void TintFinalColor(Input IN, SurfaceOutput o, inout fixed4 color)
		{
			float highlight = _AlphaHint;

			if (o.Alpha > 0.01)
			{
				half3 c = tex2D(_EmissionTex, IN.tc_Emission) * _EmissionColor;

				if (_AlphaHintSpeed * _AlphaHintRange > 0)
				{
					half t = _AlphaHintRange * (sin(_Time.z * _AlphaHintSpeed) + 1);
					highlight = _AlphaHint + t;
				}

				c *= 1 + highlight;

				color.rgb = lerp(color.rgb, c, o.Alpha);
			}

			color.rgb += o.Albedo.rgb * lerp(UNITY_LIGHTMODEL_AMBIENT.rgb, _AmbientReplaceColor, _AmbientReplaceRate);
#ifdef FADING_IN
			fixed a = _FadeDirection * clamp(((_Time.y - _FadeInTick) / _FadeInDuration - 0.5), -0.5, 0.5) + 0.5;
			color.a = a;
#endif

#if defined(FOG_LINEAR) || defined(FOG_EXP) || defined(FOG_EXP2)
			IN.fogCoord += o.Alpha;
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
		#pragma surface surf Ramp vertex:VertUVAnim finalcolor:TintFinalColor noambient novertexlights addshadow noshadow nolightmap nodynlightmap nodirlightmap nometa noforwardadd nolppv noinstancing exclude_path:deferred exclude_path:prepass
		#pragma multi_compile _ FADING_IN

#ifdef FADING_IN
		#undef UNITY_OPAQUE_ALPHA
		#define UNITY_OPAQUE_ALPHA(a) a=a
#endif
		ENDCG
    }
}