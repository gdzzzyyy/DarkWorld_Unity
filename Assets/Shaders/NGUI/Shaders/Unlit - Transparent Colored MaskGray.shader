// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/Transparent Colored Mask Gray"
{
    Properties
    {
        _MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
        _MaskTex ("Mask", 2D) = "black" {}
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
        
        Cull Off
        Lighting Off
        ZWrite Off
        Fog { Mode Off }
        Offset -1, -1
        Blend SrcAlpha OneMinusSrcAlpha

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
                half2 texcoord : TEXCOORD0;
            };
    
            sampler2D _MainTex;
            sampler2D _MaskTex;
            float4 _MainTex_ST;
			fixed _FadeFactor;
                
            v2f vert (appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.texcoord = v.texcoord;
                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {
                fixed4 col = tex2D(_MainTex, i.texcoord);
                fixed grey = 0.6 * (col.r * 0.299 + col.g * 0.587 + col.b * 0.114);
                
                return fixed4(grey, grey, grey, col.a * tex2D(_MaskTex, i.texcoord).a * _FadeFactor);
            }
            ENDCG
        }
    }
}
