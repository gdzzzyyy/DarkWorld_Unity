Shader "Unlit/Transparent AlphaCutByMask"
{
	Properties
	{
		_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
		_AlphaControlTex("Alpha Control", 2D) = "white" {}
		_UISliderValue("UISlider Value", Range(0,1)) = 1
		[HideInInspector] _FadeFactor("Fade Factor", Float) = 1
	}
	
	SubShader
	{
		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}
		
		Pass
		{
			Cull Off
			Lighting Off
			ZWrite Off
			Fog { Mode Off }
			Offset -1, -1
			Blend SrcAlpha OneMinusSrcAlpha

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag			
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float4 _MainTex_ST;
			fixed _FadeFactor;

			sampler2D _AlphaControlTex;
			float4 _AlphaControlTex_ST;

			fixed _UISliderValue;

			struct appdata_t
			{
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
				fixed4 color : COLOR;
			};
	
			struct v2f
			{
				float4 vertex : SV_POSITION;
				half2 texcoord : TEXCOORD0;
				half2 alphaCoord : TEXCOORD1;
				fixed4 color : COLOR;
			};
	
			v2f o;

			v2f vert (appdata_t v)
			{
				o.vertex = UnityObjectToClipPos(v.vertex);

				o.texcoord = v.texcoord;
				o.alphaCoord = v.texcoord;

				o.color = v.color;

				return o;
			}
				
			fixed4 frag (v2f IN) : COLOR
			{
				fixed4 control = tex2D(_AlphaControlTex, IN.texcoord);
				fixed4 col = tex2D(_MainTex, IN.texcoord);

				fixed controlValue = control.g - (1 - _UISliderValue) * 1.02 + 0.02;

				clip(controlValue);

				return col * fixed4(IN.color.rgb, _FadeFactor * IN.color.a * clamp(controlValue * 50, 0, 1));
			}
			ENDCG
		}
	}
}
