Shader "Scene/Matte Shadow"
{
	Properties{
		_Color("Main Color", Color) = (1,1,1,1)
		_ShadowClip("Shadow Clip Thras", Range(0,1)) = 0.95
	}

	SubShader
	{
		Tags{ "Queue" = "Geometry" "IgnoreProjector" = "True" "RenderType" = "Opaque" }
		LOD 200
		Blend Zero SrcColor
		ZWrite off

		CGPROGRAM

		#pragma surface surf ShadowOnly noambient novertexlights nolightmap

		fixed4 _Color;
		fixed _ShadowClip;

		struct Input {
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			//fixed4 c = _Color;
			//o.Albedo = half3(1,1,1);
			//o.Alpha = c.a;
		}

		inline half4 LightingShadowOnly(SurfaceOutput s, fixed3 lightDir, fixed atten)
		{
			half4 c;
			
			clip(_ShadowClip - atten);

			c.rgb = lerp(atten * _Color, _Color, _Color.a);
			//c.a = s.Alpha;

			return c;
		}
		ENDCG
	}
	Fallback "Transparent/Cutout/VertexLit"
}
