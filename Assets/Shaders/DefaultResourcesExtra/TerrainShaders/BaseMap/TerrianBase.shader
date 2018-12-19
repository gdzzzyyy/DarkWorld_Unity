Shader "JTC/Terrain/BaseMap" {
Properties {
	_MainTex ("Base (RGB)", 2D) = "white" {}
}
SubShader {
	Tags 
	{
		"Queue" = "Geometry-2"
		"RenderType"="Opaque" 
	}

CGPROGRAM
#pragma surface surf Lambert noforwardadd exclude_path:deferred exclude_path:prepass

sampler2D _MainTex;

struct Input {
	float2 uv_MainTex;
};

void surf (Input IN, inout SurfaceOutput o) {
	fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
	o.Albedo = c.rgb;
	o.Alpha = c.a;
}
ENDCG
}

Fallback "Mobile/VertexLit"
}
