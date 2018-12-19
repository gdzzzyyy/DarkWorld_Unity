Shader "UniToonUltra/Depth" {
 
	SubShader{
		Tags{ "RenderType" = "Transparent" "Queue" = "Transparent-10" }
		Pass
		{
			Name "DEPTH"

			Tags{ "LightMode" = "Always" }

			Blend Zero One
			Cull back
			Offset 0.1, 0
			ZTest off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct appdata {
				float4 vertex : POSITION;
			};

			struct v2f {
				float4 pos : SV_POSITION;
			};

			v2f vert(appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);

				return o;
			}

			fixed4 frag(v2f i) : COLOR
			{
				return fixed4(0, 0, 0, 0);
			}

			ENDCG
		}
	}
}