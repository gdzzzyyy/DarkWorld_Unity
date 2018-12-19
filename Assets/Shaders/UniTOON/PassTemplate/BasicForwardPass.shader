Shader "Hidden/UniToonUltra/ForwardPass/Basic"
{
	CGINCLUDE
    #include "Lighting.cginc"

#ifndef SHADER_API_MOBILE
    #define SHADER_API_MOBILE
#endif
    sampler2D _Ramp;
	half3 _HighColor;
	half3 _ShadowColor;

	sampler2D _MainTex;

	half4 LightingRamp(SurfaceOutput s, half3 lightDir, half atten)
	{
		half NdotL = dot(s.Normal, lightDir);
		half diff = NdotL * 0.5 + 0.5;
		half3 ramp = tex2D(_Ramp, float2(diff, diff)).rgb;
		ramp = lerp(_ShadowColor, _HighColor, ramp);
		half3 c;
		c = (s.Albedo * _LightColor0.rgb * ramp) * (atten * 2);

		float3 N = UnityObjectToWorldNormal(s.Normal);
        float3 L = normalize(_WorldSpaceLightPos0).xyz;
        float ndotl = saturate(dot(N, L));
		return half4(c*ndotl, 1);
	}

	struct Input
	{
		float2 uv_MainTex;
	};

	void vert(inout appdata_full v, out Input o)
	{
		UNITY_INITIALIZE_OUTPUT(Input, o);
	}

	void TintFinalColor(Input IN, SurfaceOutput o, inout fixed4 color)
	{
		color.rgb += o.Albedo.rgb * UNITY_LIGHTMODEL_AMBIENT.rgb;
	}


	void surf(Input IN, inout SurfaceOutput o)
	{
		half3 color = tex2D(_MainTex, IN.uv_MainTex).rgb;
		o.Albedo = color;
	}
	ENDCG

    SubShader
	{
		Stencil
		{
			Ref[_Stencil]
			Comp Always
			Pass Replace
			ReadMask 255
			WriteMask 255
		}
		CGPROGRAM
        #pragma surface surf Ramp vertex:vert finalcolor:TintFinalColor addshadow nolightmap nodynlightmap nodirlightmap nometa nolppv noinstancing exclude_path:deferred exclude_path:prepass

		ENDCG
	}
}