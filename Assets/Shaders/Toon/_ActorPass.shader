Shader "Hidden/ToonPass"
{
    SubShader
    {
		Pass
		{
			Name "TOONEFFECT"
			Tags { "LightMode"="ForwardBase" }

			Cull Back
			Blend One [_DestBlend]
			ZTest Less
			
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

				float3 worldPos : TEXCOORD3;

				half2 uvdistort : TEXCOORD4;
				
				half3 normal   : NORMAL;
			};
			
			#define float_t  half
			#define float2_t half2
			#define float3_t half3
			#define float4_t half4
			
			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			sampler2D _EmissionTex;
			float4 _EmissionTex_ST;
			
			half _ForceX;
			half _ForceY;
			float _HeatTime;

			v2f vert(appdata_full v)
			{
				v2f o;

				o.pos = UnityObjectToClipPos(v.vertex);

				o.uv = TRANSFORM_TEX(v.texcoord.xy, _MainTex);

				o.normal = UnityObjectToWorldNormal(v.normal);
				o.worldPos= mul(unity_ObjectToWorld, v.vertex).xyz;

				o.uvdistort = TRANSFORM_TEX(v.texcoord, _EmissionTex);
			
				TRANSFER_VERTEX_TO_FRAGMENT(o);

				//UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy); // pass shadow coordinates to pixel shader

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

			//发光流动
			half _AlphaHint;
			half _AlphaHintRange;
			half _AlphaHintSpeed;

			half4 _EmissionColor;
			
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

				//亮度修正图
				float4 controlMapValue = tex2D(_BrightnessTex, i.uv.xy);

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
				
				//noise effect
				half2 emissionUV = i.uv.xy;

				float4 time = _Time;
				half2 offsetColor = tex2D(_EmissionTex, i.uvdistort + frac(time.xz * _HeatTime)).rg;

				emissionUV.x += (offsetColor.r - 0.5h) * _ForceX;
				emissionUV.y += (offsetColor.g - 0.5h) * _ForceY;

				//边缘高光
				half emissionColor = tex2D(_EmissionTex, emissionUV).b;

				float_t isBright = step(_RimBrightThrashold, NdotL);				//是否像素被照亮

				float_t edgeness = abs(dot(normalVec, viewDir));
				float_t isEdge = (1 - step(_RimEdgeness, edgeness));	//摄像机坐标系下是否是模型边缘的像素
				
				float_t rimFactor = isBright * isEdge;
				if (rimFactor > 0)
				{
					rimFactor = saturate(abs(edgeness - _RimEdgeness) * abs(NdotL - _RimBrightThrashold) * _RimEdgeSoftness);	//软边缘

					float3_t rimMapColor = tex2D(_RimTex, i.uv.xy);
					float3_t fixColor = lerp(_RimColor.rgb, rimMapColor, _RimUseColorOrMap);

					combinedColor += rimFactor * fixColor * _RimIntensity * emissionColor;
				}
				
#if defined(METAL_SPECULAR)
				float3 reflectionVector = normalize(2.0 * normalVec * NdotL - lightDir);

				float metalSpec = pow(max(0, dot(reflectionVector, viewDir)), _MetalSpecularPower) * controlMapValue.g;
				half3 metalSpecColor = lerp(_SpecularFadeColor.rgb, _MetalSpecularColor.rgb, metalSpec);
				half3 actualMetalSpecColor = metalSpec * metalSpecColor * _LightColor0.rgb;
				
				half3 fadeRate = lerp(_SpecularFadeColor.a, _MetalSpecularColor.a, metalSpec);

				combinedColor.rgb += fadeRate * actualMetalSpecColor;
#endif

#if defined(EMISSION_FLOW)
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
				half finalAlpha = _FadingAlpha * _TransparentAlpha;
				return float4(combinedColor.rgb * finalAlpha, finalAlpha);
			}

			ENDCG
		}

		Pass
        {
            Name "OUTLINE"
            Tags{ "LightMode" = "Always" }

            Cull Front
            ZTest Less

            Offset [_OutlineZOffset], [_OutlineZOffset]
            Blend One OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            #ifndef SHADER_API_MOBILE
                #define SHADER_API_MOBILE
            #endif

			struct appdata {
				float4 vertex : POSITION;
				half3 normal : NORMAL;
				half2 texcoord : TEXCOORD0;
				fixed4 color : COLOR;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				half3 uv : TEXCOORD0;
			};
			
			sampler2D _MainTex;
			half4 _MainTex_ST;
			
			float4 _LightColor0;
			float4 _OutlineAdjustColor;

            half _Outline;
			
            float _Nearest_Distance;
            float _Outline_Wide_Change_Range;

            half _AlphaMinDistance;
            half _AlphaMaxDistance;

            float _OutlineZOffset;

            half _FadingAlpha;
            half _TransparentAlpha;

            v2f vert(appdata v)
            {
                v2f o;
                o.uv.xy = TRANSFORM_TEX( v.texcoord.xy, _MainTex );

                float4 position = UnityObjectToClipPos(v.vertex);

                half3 norm = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal);
                half2 offset = normalize(TransformViewToProjection(norm.xy));

                float4 objPos = mul(unity_ObjectToWorld, float4(0,0,0,1));
                float d = distance(objPos.xyz, _WorldSpaceCameraPos);

				d = d * unity_CameraProjection._m11;

                float thickness = _Outline * 3500 / unity_CameraProjection._m11
					* (0.15 + 3 * lerp(0, 1, (d - _Nearest_Distance) / _Outline_Wide_Change_Range));

                thickness *= v.color.r;

                position.xy += offset * _Outline * thickness;

                o.pos = position;

                half alpha = 1.0 - saturate((d - _AlphaMinDistance) / (_AlphaMaxDistance - _AlphaMinDistance));
                o.uv.z = alpha  * _FadingAlpha;

                return o;
            }
			
            // Outline color parameters
            #define SATURATION_FACTOR 0.6
            #define BRIGHTNESS_FACTOR 0.8

            float4 frag(v2f i) : COLOR
            {
                float4 diffuseMapColor = tex2D(_MainTex, i.uv.xy);

                float maxChan = max( max( diffuseMapColor.r, diffuseMapColor.g ), diffuseMapColor.b );
                float4 newMapColor = diffuseMapColor;

                maxChan -= ( 1.0 / 255.0 );
                float3 lerpVals = saturate((newMapColor.rgb - float3(maxChan, maxChan, maxChan )) * 255.0 );
                newMapColor.rgb = lerp( SATURATION_FACTOR * newMapColor.rgb, newMapColor.rgb, lerpVals );
	
                float3 outlineColor = BRIGHTNESS_FACTOR * newMapColor.rgb * diffuseMapColor.rgb * _OutlineAdjustColor.rgb * _LightColor0.rgb;

                half alpha = i.uv.z;

                half fade = alpha * _FadingAlpha * _TransparentAlpha;
                return float4(outlineColor * fade, fade);
            }

            ENDCG
        }
		
		Pass
		{
			Name "SHADOWCASTER"

			Tags{ "LightMode" = "ShadowCaster" }
			//Cull Front
			ZTest Less
			ZWrite On
			Blend Zero Zero

			CGPROGRAM
			#pragma vertex vert2
			#pragma fragment frag2

			#include "UnityCG.cginc"

			struct appdata 
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 pos : POSITION;
			};


			v2f vert2(appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);

				return o;
			}

			fixed4 frag2(v2f i) : COLOR
			{
				return fixed4(0,0,0,0);
			}

			ENDCG
		}
    }
}