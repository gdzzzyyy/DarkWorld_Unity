// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "JTC/SceneObject/Opaque/VertexColor" 
{
    Properties {
		_TintColor("Tint Color", Color) = (1,1,1,0.5)
        _MainTex ("Base", 2D) = "white" {}

		_AmbientFactor("Ambient Factor", Range(0, 3)) = 0
		[HideInInspector] _AmbientReplaceRate("", Float) = 0
		[HideInInspector] _AmbientReplaceColor("", Color) = (0,0,0,1)
    }
        
    CGINCLUDE
        #include "UnityCG.cginc"
        #pragma vertex vert
        #pragma fragment frag
		#pragma multi_compile_fog

        sampler2D _MainTex;
        half4 _MainTex_ST;

        half4 _TintColor;
        half _AmbientFactor;

		half _AmbientReplaceRate;
		half4 _AmbientReplaceColor;

        struct appdata_t {
            float4 vertex : POSITION;
            half2 texcoord : TEXCOORD0;
            half4 color : COLOR;
        };

        struct v2f {
            float4 pos : SV_POSITION;
            half2 uv : TEXCOORD0;
            half4 colorFactor : COLOR;
			UNITY_FOG_COORDS(1)
        };

        v2f o;

        v2f vert(appdata_t v) 
        {
            float4 inPos = v.vertex;
            
            o.pos = UnityObjectToClipPos(inPos);
            o.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
            //o.colorFactor = fixed4(((v.color * _TintColor) * (_TintColor.a * 2)).rgb, 1);
			o.colorFactor = half4(((v.color * v.color * _TintColor * 1.2) * (_TintColor.a * 1.6)).rgb, 1);
		
			UNITY_TRANSFER_FOG(o, o.pos);

            return o; 
        }

        fixed4 frag( v2f i ) : SV_Target 
        {    
            half4 ocolor = tex2D (_MainTex, i.uv.xy) * i.colorFactor;
			ocolor += _AmbientFactor * ocolor * lerp(UNITY_LIGHTMODEL_AMBIENT, _AmbientReplaceColor, _AmbientReplaceRate);

			UNITY_APPLY_FOG(i.fogCoord, ocolor);
            return ocolor;
        }
    ENDCG
    
    SubShader 
    {
        Tags { "RenderType" = "Opaque" "Queue" = "Geometry"}
        
        Pass 
        {
            Tags { "LIGHTMODE"="ForwardBase" }
            Lighting    Off
            
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            ENDCG
        }
    }
}
