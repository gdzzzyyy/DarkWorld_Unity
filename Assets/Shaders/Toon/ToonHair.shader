Shader "Toon/Hair"
 {
    Properties 
	{
        [NoScaleOffset]_MainTex("Base Map(rgb) Area Emission(a)", 2D) = "white" {}
		[NoScaleOffset]_BrightnessTex("Bright(r) Spec.(g) Hair Spec.(b)", 2D) = "white"{}
		
		[Header(Bright Color)]
		[HDR]_BrightColor("Bright Color", Color) = (0.5,0.5,0.5,1)

		[Header(First Ramp Shadow)]
		_FirstRampThras("First Ramp Thras", Range(0,1)) = 0.5
		[PowerSlider(5)]_FirstRampEdgeSoftness("Softness", Range(1,1000)) = 50

		[NoScaleOffset]_FirstShadow("Shadow Map", 2D) = "black" {}
		[HDR]_FirstShadowColor("Shadow Color", Color) = (0, 0, 0, 1)
		_FirstShadowUseColorOrMap("First Shadow Use Color Or Map", Range(0,1)) = 1
		
		[Header(Ambient)]
		_AmbientPower("Ambient Power", Range(0,1)) = 0.1
		
		[Header(Rim Control)]
		_RimEdgeness("Rim Edgeness", Range(0,0.5)) = 0.3
		_RimBrightThrashold("Rim Bright Thrashold", Range(0, 1)) = 0.3
		[PowerSlider(5)]_RimEdgeSoftness("Softness", Range(1, 1000)) = 100
		[NoScaleOffset]_RimTex("Rim Texture", 2D) = "white"{}
		_RimColor("Rim Color", Color) = (0.5,0.5,0.5,1)
		_RimUseColorOrMap("Rim Color Use Color or Map", Range(0,1)) = 0
		_RimIntensity("Rim Intensity", Range(0,2)) = 0.5
		
		[Header(Emission Noise)]
		_HeatTime("Heat Time", range (-1,1)) = 0
		_EmissionTex("Distort X(r) Y(g) Area(b)", 2D) = "white" {}
		_ForceX("Strength X", range (0,1)) = 0.1
		_ForceY("Strength Y", range (0,1)) = 0.1

		[Header(Area Emission)]
		[Toggle(EMISSION_FLOW)] _EMISSION_FLOW("Use Area Emission", Int) = 0
		[HDR]_EmissionColor("Emission Color", Color) = (0.5,0.5,0.5,1)
		
		_AlphaHint("Hint Base", Range(0, 5)) = 1
		_AlphaHintRange("Hint Range", Range(0, 5)) = 0
		_AlphaHintSpeed("Hint Speed", Range(0, 10)) = 0

		[Header(Metal Specular)]
		[Toggle(METAL_SPECULAR)] _METAL_SPECULAR("Use Metal Specular", Int) = 0
		[HDR]_MetalSpecularColor("Color(rgb) Intensity(a)", Color) = (1, 1, 1, 1)
		[HDR]_SpecularFadeColor("Outer Color(rgb) Fade Rate(a)", Color) = (1, 1, 1, 1)
		[PowerSlider(3.0)]_MetalSpecularPower("Specular Power", Range(0.0001, 500)) = 10

		[Header(Hair Specular Drawing Style)]
		_HairSpecularColor("Color(rgb) Intensity(a)", Color) = (1, 1, 1, 1)
		_HairLightRamp("Noise(r) Dash(g) UV Flow (b)", 2D) = "white"{}
		_HairUVOffset("Dash UV(X) Spec. Factor(Y)", 2D) = "white" {}

		[PowerSlider(2.0)]_MainHairSpecularSmooth("Specular Smooth", Range(0, 1000)) = 10
		[PowerSlider(2.0)]_HairSpecularEdgeFade("Specular Edge Fade", Range(0.01, 1)) = 0

		[Header(Outline Control)]
		_Outline("Outline Width", Range(.0001, 0.03)) = .0025
		[HDR]_OutlineAdjustColor("Outline Adjust Color", Color) = (1, 1, 1, 1)
		
		_Farthest_Distance ("Outline Fixed Wide Distance", Float ) = 0.5
		_Outline_Wide_Change_Range ("Outline Wide Change Range", Float ) = 20

		_AlphaMinDistance("Alpha Min Distance", Float) = 10
		_AlphaMaxDistance("Alpha Max Distance", Float) = 30
		
		_OutlineZOffset("Z Offset", Range(0, 50)) = 0

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
				Name "HAIR"
				Tags { "LightMode"="ForwardBase" }

				Cull Back
				Blend One [_DestBlend]
			
				CGPROGRAM
				#pragma multi_compile_fwdbase
				#pragma multi_compile _ METAL_SPECULAR
				#pragma multi_compile _ EMISSION_FLOW

				#include "UnityCG.cginc"
				#include "AutoLight.cginc"

				#pragma vertex vert
				#pragma fragment frag

				struct v2f
				{
					float4 pos      : SV_POSITION;
					LIGHTING_COORDS(0, 1)

					half2 uv : TEXCOORD2;
					half2 hairSpecualrUV : TEXCOORD3;
					half2 hairLightUV:TEXCOORD4;

					half2 uvdistort : TEXCOORD5;

					fixed3 objTangent  : TANGENT0;
					fixed3 objNormal : NORMAL0;
					fixed3 objBinormal : BINORMAL0;

					fixed3 objLightDir:NORMAL1;
					fixed3 objViewDir:NORMAL2;
				};
			
				#define float_t  half
				#define float2_t half2
				#define float3_t half3
				#define float4_t half4
			
				sampler2D _MainTex;
				float4 _HairUVOffset_ST;
			
				sampler2D _HairLightRamp;  
				float4 _HairLightRamp_ST;  

				float _TangentAdjust;

				sampler2D _EmissionTex;
				float4 _EmissionTex_ST;
			
				half _ForceX;
				half _ForceY;
				float _HeatTime;

				v2f vert(appdata_full v)
				{
					v2f o;

					o.pos = UnityObjectToClipPos(v.vertex);

					o.uv = v.texcoord.xy;
					o.hairSpecualrUV = TRANSFORM_TEX(v.texcoord.xy, _HairUVOffset);
					o.hairLightUV = TRANSFORM_TEX(v.texcoord.xy, _HairLightRamp);  
					
					//求出沿着发梢到发根方向的切线  
					// Declares 3x3 matrix 'rotation', filled with tangent space basis
					//#define TANGENT_SPACE_ROTATION \
					//	float3 binormal = cross( v.normal, v.tangent.xyz ) * v.tangent.w; \
					//	float3x3 rotation = float3x3( v.tangent.xyz, binormal, v.normal )

					o.objNormal = normalize(v.normal);
					o.objTangent = normalize(v.tangent.xyz);
					o.objBinormal = normalize(cross(v.normal, v.tangent.xyz) * v.tangent.w);

					o.objLightDir = normalize(ObjSpaceLightDir(v.vertex));
					o.objViewDir = normalize(ObjSpaceViewDir(v.vertex));
					
					o.uvdistort = TRANSFORM_TEX(v.texcoord, _EmissionTex);

					TRANSFER_VERTEX_TO_FRAGMENT(o);

					return o;
				}
			
				sampler2D _BrightnessTex;

				//最明亮阶颜色
				float4 _LightColor0;
				float4 _BrightColor;
			
				//第一阶阴影
				float _FirstRampThras;
				sampler2D _FirstShadow;
				float4 _FirstShadowColor;
				float _FirstShadowUseColorOrMap;
				half _FirstRampEdgeSoftness;

				//环境光
				float _AmbientPower;
			
				//边缘高亮
				sampler2D _RimTex;

				float _RimEdgeness;
				float _RimBrightThrashold;
				float4 _RimColor;
				float _RimIntensity;
				float _RimUseColorOrMap;
				half _RimEdgeSoftness;

				//标准(金属)高光
				fixed4 _MetalSpecularColor;
				fixed4 _SpecularFadeColor;

				half _MetalSpecularPower;

				//头发高光（各向异性高光+Jitter Mapping)
				fixed4 _HairSpecularColor;
				half _MainHairSpecularSmooth;
				half _HairSpecularEdgeFade;  
				
				//发光流动
				half _AlphaHint;
				half _AlphaHintRange;
				half _AlphaHintSpeed;

				half4 _EmissionColor;

				//淡入淡出
				half _FadingAlpha;
				half _TransparentAlpha;

				float HairSpecular(fixed3 halfDir, float3 tangent, float specularSmooth)  
				{  
					float dotTH = dot(tangent, halfDir);  
					float sqrTH = max(0.01, sqrt(1 - pow(dotTH, 2)));  
					float atten = smoothstep(-1,0, dotTH);  
  
					//头发主高光值  
					float specMain = atten * pow(sqrTH, specularSmooth);  
					return specMain;  
				}  
			
				float4 frag(v2f i) : COLOR
				{
					float NdotL = dot(i.objNormal, i.objLightDir);
					fixed diff = NdotL * 0.5 + 0.5;
	  
					//亮度修正图
					float4_t controlMapValue = tex2D(_BrightnessTex, i.uv.xy);
					diff = diff * controlMapValue.r;

					float4_t baseColor = tex2D(_MainTex, i.uv.xy);

					//第一层ramp阴影
					float4_t firstShadowMapColor = tex2D(_FirstShadow, i.uv.xy);
					float4_t fixedFirstShadowColor = lerp(_FirstShadowColor, firstShadowMapColor, _FirstShadowUseColorOrMap);
				
					float_t firstRampDelta = diff - _FirstRampThras;
					float_t firstRamp = step(0, firstRampDelta);

					firstRamp *= saturate(firstRampDelta * _FirstRampEdgeSoftness);	//软边缘

					float3_t firstShadowFactor = lerp(fixedFirstShadowColor, _BrightColor, firstRamp);

					float3_t combinedColor = baseColor.rgb * firstShadowFactor * _LightColor0.rgb;

					//环境光
					combinedColor += UNITY_LIGHTMODEL_AMBIENT.rgb * _AmbientPower;

					//Rim 边缘高光
					float_t isBright = step(_RimBrightThrashold, NdotL);				//是否像素被照亮

					float_t edgeness = dot(i.objNormal, i.objViewDir);
					float_t isEdge = (1 - step(_RimEdgeness, abs(edgeness)));	//摄像机坐标系下是否是模型边缘的像素
				
					float_t rimFactor = isBright * isEdge;
					if (rimFactor > 0)
					{
						rimFactor = saturate(abs(edgeness - _RimEdgeness) * abs(NdotL - _RimBrightThrashold) * _RimEdgeSoftness);	//软边缘

						float4_t rimMapColor = tex2D(_RimTex, i.uv.xy);
						float3_t fixColor = lerp(_RimColor.rgb, rimMapColor.rgb, _RimUseColorOrMap);

						combinedColor += rimFactor * _RimIntensity * fixColor * rimMapColor.a;
					}
				
#if defined(METAL_SPECULAR)
					float3 reflectionVector = normalize(2.0 * i.objNormal * NdotL - i.objLightDir);

					float metalSpec = pow(max(0, dot(reflectionVector, i.objViewDir)), _MetalSpecularPower) * controlMapValue.g;
					half3 metalSpecColor = lerp(_SpecularFadeColor.rgb, _MetalSpecularColor.rgb, metalSpec);
					half3 actualMetalSpecColor = metalSpec * metalSpecColor * _LightColor0.rgb;
				
					half3 fadeRate = lerp(_SpecularFadeColor.a, _MetalSpecularColor.a, metalSpec);

					combinedColor.rgb += fadeRate * actualMetalSpecColor;
#endif

#if defined(EMISSION_FLOW)
					//noise effect
					half2 emissionUV = i.uv.xy;

					float4 time = _Time;
					half2 offsetColor = tex2D(_EmissionTex, i.uvdistort + frac(time.xz * _HeatTime)).rg;

					emissionUV.x += (offsetColor.r - 0.5h) * _ForceX;
					emissionUV.y += (offsetColor.g - 0.5h) * _ForceY;

					half emissionColor = tex2D(_EmissionTex, emissionUV).b;

					float highlight = _AlphaHint;

					if (baseColor.a > 0.001)
					{
						half3 c = emissionColor * _EmissionColor;

						if (_AlphaHintSpeed * _AlphaHintRange > 0)
						{
							half t = _AlphaHintRange * (sin(_Time.z * _AlphaHintSpeed) + 1);
							highlight = _AlphaHint + t;
						}

						c *= 1 + highlight;

						combinedColor.rgb = lerp(combinedColor.rgb, c + combinedColor.rgb * c, baseColor.a);
					}
#endif
					//头发高光效果计算
					fixed3 objSpaceHairLightDir =
						fixed3(i.objLightDir.z, i.objLightDir.y, i.objLightDir.x)
						+ fixed3(i.objViewDir.z, i.objViewDir.y, i.objViewDir.x);	//各项异性的入射向量
					objSpaceHairLightDir = normalize(objSpaceHairLightDir);
					
					//头发切线计算
					//切线空间处理发丝方向向量
					fixed hairSpecUVFlow = tex2D(_HairLightRamp, i.uv.xy).b;
					float theta = i.hairSpecualrUV.y + (hairSpecUVFlow - 0.5) * 3.1415926;

					fixed tangentZ, tangentY;
					sincos(theta, tangentZ, tangentY);

					fixed3 hairTangent = fixed3(0, tangentY, -tangentZ);

					fixed hairSpecWidth = tex2D(_HairLightRamp, half2(i.hairSpecualrUV.x, 0.5)).g;	//头发高光图采样

					//头发高光值  
					float specFinal = HairSpecular(
						objSpaceHairLightDir, 
						hairTangent, 
						_MainHairSpecularSmooth);

					specFinal = pow(saturate(specFinal - (1.0 - hairSpecWidth)), _HairSpecularEdgeFade);
  
					float hairSpecularMask = controlMapValue.b;
					fixed3 hairSpecular = hairSpecularMask * _HairSpecularColor.rgb * _HairSpecularColor.a * specFinal;  
				
					combinedColor.rgb += hairSpecular * _LightColor0.rgb;
					
					half finalAlpha = _FadingAlpha * _TransparentAlpha;
					return float4(combinedColor.rgb * finalAlpha, finalAlpha);
				}

				ENDCG
			}

			UsePass "Hidden/ToonPass/OUTLINE"
			UsePass "Hidden/ToonPass/SHADOWCASTER"
		}

	}
}