Shader "Unlit/Transparent Manual Ambient"
{
	Properties
	{
		_MainTex("Base (RGB), Alpha (A)", 2D) = "black" {}
        [HideInInspector]_AmbientReplaceRate("Ambient Replace Rate", Float) = 0
		[HideInInspector]_AmbientReplaceColor("Ambient Replace Color", Color) = (0,0,0,1)
		[HideInInspector]_AdditiveIntensy("Additive Intensity",Float) = 0.5
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

			half _AmbientReplaceRate;
			half3 _AmbientReplaceColor;
			half _AdditiveIntensy;
	
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
				o.color.rgb = v.color.rgb*_AdditiveIntensy + v.color.rgb * lerp(UNITY_LIGHTMODEL_AMBIENT.rgb, _AmbientReplaceColor, _AmbientReplaceRate);
				o.color.a = v.color.a;
				return o;
			}
				
			fixed4 frag (v2f IN) : COLOR
			{
				return tex2D(_MainTex, IN.texcoord) * IN.color;
			}
			ENDCG
		}
	}
}
