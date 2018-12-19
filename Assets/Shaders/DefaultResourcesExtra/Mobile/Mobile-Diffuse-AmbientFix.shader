// Simplified Diffuse shader. Differences from regular Diffuse one:
// - no Main Color
// - fully supports only 1 directional light. Other lights can affect it, but it will be per-vertex/SH.

Shader "Mobile/Diffuse(AmbientFix)" {
Properties {
	_MainTex ("Base (RGB)", 2D) = "white" {}

	[HideInInspector] _AmbientReplaceRate("", Float) = 0
	[HideInInspector] _AmbientReplaceColor("", Color) = (0,0,0,1)
}

SubShader {
	Tags { "RenderType"="Opaque" }

CGPROGRAM
#pragma surface surf Lambert finalcolor:TintFinalColor noambient novertexlights addshadow nolightmap nodynlightmap nodirlightmap nometa noforwardadd exclude_path:deferred exclude_path:prepass

half _AmbientReplaceRate;
half3 _AmbientReplaceColor;

sampler2D _MainTex;

struct Input {
	float2 uv_MainTex;
};

void surf (Input IN, inout SurfaceOutput o) {
	fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
	o.Albedo = c.rgb;
	o.Alpha = c.a;
}

void TintFinalColor(Input IN, SurfaceOutput o, inout fixed4 color)
{
	color.rgb += o.Albedo.rgb * lerp(UNITY_LIGHTMODEL_AMBIENT.rgb, _AmbientReplaceColor, _AmbientReplaceRate);
	UNITY_APPLY_FOG(IN.fogCoord, color);
}

ENDCG
}

//Fallback "Mobile/VertexLit"
}
