// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/Opaque"
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
            "Queue"             = "Transparent"
            "IgnoreProjector"   = "True"
            "RenderType"        = "Opaque"
        }
        
        Cull Off
        Lighting Off
        ZWrite Off

        Pass
        {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                
                #include "UnityCG.cginc"
    
                struct appdata_t
                {
                    float4 vertex : POSITION;
                    float2 texcoord : TEXCOORD0;
                };
    
                struct v2f
                {
                    float4 vertex : SV_POSITION;
					fixed4 color : COLOR;
                    half2 texcoord : TEXCOORD0;
                };
    
                sampler2D _MainTex;
                float4 _MainTex_ST;
				fixed _FadeFactor;
                
                v2f vert (appdata_t v)
                {
                    v2f o;
                    o.vertex = UnityObjectToClipPos(v.vertex);
                    o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
					o.color = fixed4(1, 1, 1, _FadeFactor);
                    return o;
                }
                
                fixed4 frag (v2f i) : COLOR
                {
                    fixed4 col = tex2D(_MainTex, i.texcoord);
					col.a *= i.color;
                    return col;
                }
            ENDCG
        }
    }
}
