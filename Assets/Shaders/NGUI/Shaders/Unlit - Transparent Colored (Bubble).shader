Shader "Unlit/Transparent Colored Bubble"
{
	Properties
	{
		_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
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
			ZTest Always
			ZWrite On
			Fog { Mode Off }
			//Offset 2, 2
			Blend SrcAlpha OneMinusSrcAlpha

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag			
			#include "UnityCG.cginc"

			sampler2D _MainTex;
			float4 _MainTex_ST;
			fixed _FadeFactor;
	
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
				fixed4 color : COLOR;
			};
	
			v2f o;

			v2f vert (appdata_t v)
			{
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.texcoord = v.texcoord;
				o.color = fixed4(v.color.rgb, v.color.a * _FadeFactor);
				return o;
			}
				
			fixed4 frag (v2f IN) : COLOR
			{
				fixed4 ocolor = tex2D(_MainTex, IN.texcoord) * IN.color;
				clip(ocolor.a - 0.1);
				return ocolor;
			}
			ENDCG
		}
	}
}
