Shader "Fx/Distort/Dissovle_Rim"
{
    Properties 
    {
        _NoiseTex ("Distort Texture (RG)", 2D) = "white" {}
        _MainTex ("Main", 2D) = "white" {}

        _HeatTime  ("Heat Time", range (-1,1)) = 0
        _ForceX  ("Strength X", range (0,1)) = 0.1
        _ForceY  ("Strength Y", range (0,1)) = 0.1

        [HDR]_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
        
        //[Enum(Add,1,Blend,5)] _SrcBlend ("Source Alpha Blend", Float) = 1
        [Enum(Add,1,Blend,10)] _DestBlend ("Dest Alpha Blend", Float) = 1
        [Enum(Off,0,On,2)] _CullBack ("Cull Back", Float) = 2
        [Enum(Off,4,On,8)] _ZTest ("Always Show", Float) = 4

		_DissovleTex("Dissovle", 2D) = "white" {}
		_AlphaThreshold("Alpha Threshold", Range(-0.1, 1.01)) = 0

		[HDR]_DissovleColor("Dissovle Color", Color) = (1.0, 1.0, 1.0, 1.0)
		_DissovleRange("Dissovle Range", Range(0, 1)) = 0
		
		[HDR]_RimColor("Rim Color", Color) = (0.8,0.8,0.8,0.6)
		_RimPower("Rim Power", Range(0.1, 10)) = 1.4

        _MaskTex ("Mask", 2D) = "white" {}
    }
    
    CGINCLUDE
		#include "UnityCG.cginc"

        #pragma vertex vert
        #pragma fragment frag
        
        struct appdata_t {
            float4 vertex : POSITION;
            half2 texcoord: TEXCOORD0;
            half4 color : COLOR;
			half3 normal : NORMAL;
        };

        struct v2f {
            float4 vertex : POSITION;

            half2 uvmain : TEXCOORD0;
			half2 uv1 : TEXCOORD1;
            half2 uvmask : TEXCOORD2;

			half3 worldNormal : TEXCOORD3;
			half3 worldPos : TEXCOORD4;

            half4 colorFactor : COLOR;
        };

        half _ForceX;
        half _ForceY;
        float _HeatTime;

        sampler2D _MainTex;
        half4 _MainTex_ST;

        sampler2D _NoiseTex;
        half4 _NoiseTex_ST;

		sampler2D _DissovleTex;
		half4 _DissovleTex_ST;

        sampler2D _MaskTex;
        half4 _MaskTex_ST;

		half4 _DissovleColor;
		half _DissovleRange;

        half _UVRotateSpeed;

        half4 _TintColor;

		float _RimPower;
		half4 _RimColor;

        v2f vert (appdata_t v)
        {
            v2f o;

            const half TWO_PI = 3.14159 * 2;
            const half2 VEC_CENTER = half2(0.5h, 0.5h);

            o.vertex = UnityObjectToClipPos(v.vertex);
            o.colorFactor = v.color * _TintColor;

            o.uvmain = TRANSFORM_TEX( v.texcoord, _MainTex );
			o.uv1.xy = TRANSFORM_TEX(v.texcoord, _DissovleTex);
			o.uvmask.xy = TRANSFORM_TEX(v.texcoord, _MaskTex);
			
			o.worldNormal = UnityObjectToWorldNormal(v.normal);
			o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

            return o;
        }

		half _AlphaThreshold;
        half4 frag( v2f i ) : SV_Target
        {
			half4 fadecolor = tex2D(_DissovleTex, i.uv1);
			half deltaAlpha = fadecolor.r - _AlphaThreshold;
			clip(deltaAlpha);

			half4 ocolor;

			if (deltaAlpha < _DissovleRange)
			{
				ocolor = _DissovleColor;
			}
			else
			{
				float4 time = _Time;

				//noise effect
				half offsetColor1 = tex2D(_NoiseTex, i.uvmain + frac(time.xz * _HeatTime));
				half offsetColor2 = tex2D(_NoiseTex, i.uvmain + frac(time.yx * _HeatTime));

				i.uvmain.x += (offsetColor1 - 0.5h) * _ForceX;
				i.uvmain.y += (offsetColor2 - 0.5h) * _ForceY;

				ocolor = tex2D(_MainTex, i.uvmain) * i.colorFactor;
			}
			
			half3 viewDir = normalize(_WorldSpaceCameraPos.xyz - i.worldPos.xyz);
			half rim = 1.0f - saturate(dot(viewDir, i.worldNormal));
			ocolor.rgb = ocolor.rgb + (_RimColor.rgb * pow(rim, _RimPower)) * _RimColor.a;

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
