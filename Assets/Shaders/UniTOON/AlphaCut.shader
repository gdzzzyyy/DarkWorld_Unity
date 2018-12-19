Shader "UniToonUltra/AlphaCut" {
    Properties {
        //_RimColor ("Rim Color", Color) = (0.8,0.8,0.8,0.6)
        //_RimPower ("Rim Power", Float) = 1.4
        _ShadowColor ("Shadow", Color) = (0.0,0.0,0.0,1)
        _HighColor ("Highlighting Color", Color) = (0.5,0.5,0.5,1) 
        _Ramp ("Shading Ramp", 2D) = "gray" {}
        _MainTex ("Texture", 2D) = "white" {}
        _AlphaThreshold ("AlphaThreshold", Range(0, 1)) = 0.5

		[HideInInspector] _AmbientReplaceRate("", Float) = 0
		[HideInInspector] _AmbientReplaceColor("", Color) = (0,0,0,1)
    }
 
    SubShader {
		Tags{ "RenderType" = "Opaque" "Queue" = "Geometry+10" }

        CGPROGRAM
		#pragma surface surf Ramp vertex:vert finalcolor:TintFinalColor noambient novertexlights addshadow noshadow nolightmap nodynlightmap nodirlightmap nometa noforwardadd exclude_path:deferred exclude_path:prepass

        sampler2D _Ramp;
		half4 _HighColor;
		half4 _ShadowColor;
		//half _RimPower;
		//half4 _RimColor;
		half _AmbientReplaceRate;
		half3 _AmbientReplaceColor;
        
        half4 LightingRamp (SurfaceOutput s, half3 lightDir, half atten) 
		{
            half NdotL = dot (s.Normal, lightDir);
            half diff = NdotL * 0.5 + 0.5;
            half3 ramp = tex2D (_Ramp, float2(diff, diff)).rgb;
            ramp = lerp(_ShadowColor,_HighColor,ramp);
            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb * diff * ramp) * (atten * 2);
            c.a = s.Alpha;
            return c;
        }
 
        struct Input {
            float2 uv_MainTex;
            float3 viewDir;
        };

        sampler2D _MainTex;
        fixed _AlphaThreshold;
 
        void surf (Input IN, inout SurfaceOutput o) 
		{
			fixed4 mainColor = tex2D(_MainTex, IN.uv_MainTex);
			clip(mainColor.a - _AlphaThreshold);

            o.Albedo = mainColor.rgb;
        }

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
			color.rgb += o.Albedo.rgb * lerp(UNITY_LIGHTMODEL_AMBIENT.rgb, _AmbientReplaceColor, _AmbientReplaceRate);

			UNITY_APPLY_FOG(IN.fogCoord, color);
		}
 
        ENDCG
    }

	Fallback "Unlit/Texture"
}