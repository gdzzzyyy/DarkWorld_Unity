Shader "Toon/Eye"
 {
    Properties 
	{
        [NoScaleOffset]_MainTex("Base Map(rgb) Emission Area(a)", 2D) = "white" {}
		
		[Header(Bright Color)]
        [HDR]_BrightColor("Bright Color", Color) = (0.5,0.5,0.5,1)

		[Header(First Ramp Shadow)]
		_FirstRampThras("First Ramp Thras", Range(0,1)) = 0.5

        [NoScaleOffset]_FirstShadow("Shadow Map", 2D) = "black" {}
        [HDR]_FirstShadowColor("Shadow Color", Color) = (0, 0, 0, 1)
        _FirstShadowUseColorOrMap("First Shadow Use Color Or Map", Range(0,1)) = 1
		
		[Header(Ambient)]
		_AmbientPower("Ambient Power", Range(0,1)) = 0.1
		
		[Header(Area Emission)]
		[Toggle(EMISSION_FLOW)] _EMISSION_FLOW("Use Area Emission", Int) = 0
		[HDR]_EmissionColor("Emission Color", Color) = (0.5,0.5,0.5,1)

		[Header(Metal Specular)]
		[Toggle(METAL_SPECULAR)] _METAL_SPECULAR("Use Metal Specular", Int) = 0
		[HDR]_MetalSpecularColor("Color(rgb) Intensity(a)", Color) = (1, 1, 1, 1)
		[HDR]_SpecularFadeColor("Outer Color(rgb) Fade Rate(a)", Color) = (1, 1, 1, 1)
		[PowerSlider(3.0)]_MetalSpecularPower("Specular Power", Range(0.0001, 500)) = 10

		[Header(Rendering States)]
        [Enum(Off,0,Front,1,Back,2)] _Culling ("Culling", Float) = 2
		
		[Header(Fade IN OUT)]
		[Enum(Opaque,0,Blend,10)] _DestBlend("Dest Alpha Blend", Float) = 0
		[HideInInspector]_FadingAlpha("Fading Alpha", Range(0,1)) = 1
		_TransparentAlpha("Transparent Alpha", Range(0,1)) = 1
    }

	Category
	{
		Tags{ "RenderType" = "Opaque" "Queue" = "Geometry" }

		SubShader
		{
			Pass
			{
				Name "Eye"
				Tags { "LightMode"="ForwardBase" }

				Cull [_Culling]
				Blend One [_DestBlend]
			
				CGPROGRAM
				#pragma multi_compile_fwdbase
				#pragma multi_compile _ EMISSION_FLOW 

				#include "UnityCG.cginc"
				#include "AutoLight.cginc"

				#pragma vertex vert
				#pragma fragment frag

				struct v2f
				{
					float4 pos      : SV_POSITION;
					LIGHTING_COORDS(0, 1)
					float2 uv : TEXCOORD2;
					float3 worldPos : TEXCOORD3;
				
					float3 normal   : NORMAL;
				};
			
				#define float_t  half
				#define float2_t half2
				#define float3_t half3
				#define float4_t half4
			
				sampler2D _MainTex;
				float4 _MainTex_ST;
			
				v2f vert(appdata_full v)
				{
					v2f o;

					o.pos = UnityObjectToClipPos(v.vertex);

					o.uv = TRANSFORM_TEX(v.texcoord.xy, _MainTex);

					o.normal = UnityObjectToWorldNormal(v.normal);
					o.worldPos= mul(unity_ObjectToWorld, v.vertex).xyz;

					TRANSFER_VERTEX_TO_FRAGMENT(o);

					return o;
				}
			
				//最明亮阶颜色
				float4 _LightColor0;
				float4 _BrightColor;
			
				//第一阶阴影
				float _FirstRampThras;
				sampler2D _FirstShadow;
				float4 _FirstShadowColor;
				float _FirstShadowUseColorOrMap;

				//环境光
				float _AmbientPower;
				
				//区域自发光
				half4 _EmissionColor;

				//标准(金属)高光
				fixed4 _MetalSpecularColor;
				fixed4 _SpecularFadeColor;

				half _MetalSpecularPower;
			
				//淡入淡出
				half _FadingAlpha;
				half _TransparentAlpha;
			
				float4 frag(v2f i) : COLOR
				{
					float3_t normalVec = i.normal;
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
					float NdotL = dot(normalVec, lightDir);
					fixed diff = NdotL * 0.5 + 0.5;
	 
					half3 viewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));  

					float4_t baseColor = tex2D(_MainTex, i.uv.xy);

					//第一层ramp阴影
					float4_t firstShadowMapColor = tex2D(_FirstShadow, i.uv.xy);
					float4_t fixedFirstShadowColor = lerp(_FirstShadowColor, firstShadowMapColor, _FirstShadowUseColorOrMap);

					float_t firstRamp = step(_FirstRampThras, diff);

					float3_t firstShadowFactor = lerp(fixedFirstShadowColor, _BrightColor, firstRamp);

					float3_t combinedColor = baseColor.rgb * firstShadowFactor * _LightColor0.rgb;

					//环境光
					combinedColor += UNITY_LIGHTMODEL_AMBIENT.rgb * _AmbientPower;
					
					//金属高光
					float3 reflectionVector = normalize(2.0 * normalVec * NdotL - lightDir);

					float metalSpec = pow(max(0, dot(reflectionVector, viewDir)), _MetalSpecularPower);
					half3 metalSpecColor = lerp(_SpecularFadeColor.rgb, _MetalSpecularColor.rgb, metalSpec);
					half3 actualMetalSpecColor = metalSpec * metalSpecColor * _LightColor0.rgb;
				
					half3 fadeRate = lerp(_SpecularFadeColor.a, _MetalSpecularColor.a, metalSpec);

					combinedColor.rgb += fadeRate * actualMetalSpecColor;
					
#if defined(EMISSION_FLOW)
					half emissionColor = baseColor.a;
					half3 c = emissionColor * _EmissionColor;
					combinedColor.rgb += c;
#endif
					half finalAlpha = _FadingAlpha * _TransparentAlpha;

					return float4(combinedColor.rgb * finalAlpha, finalAlpha);
				}

				ENDCG
			}
			UsePass "Hidden/ToonPass/SHADOWCASTER"
		}
	}
}