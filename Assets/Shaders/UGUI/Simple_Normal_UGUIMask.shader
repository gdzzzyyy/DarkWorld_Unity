Shader "UGUI/Fx/Simple/Normal"
{
    Properties {
		[PerRendererData]_MainTex ("Base", 2D) = "white" {}

		_Color("Tint", Color) = (1,1,1,1)
        _Intensity("Intensity", Float) = 1
        
        [Enum(Add,1,Blend,10)] _DestBlend ("Dest Alpha Blend", Float) = 1

		_StencilComp("Stencil Comparison", Float) = 8
		_Stencil("Stencil ID", Float) = 0
		_StencilOp("Stencil Operation", Float) = 0
		_StencilWriteMask("Stencil Write Mask", Float) = 255
		_StencilReadMask("Stencil Read Mask", Float) = 255

		_ColorMask("Color Mask", Float) = 15

		[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip("Use Alpha Clip", Float) = 0
    }
        
    CGINCLUDE
        #include "UnityCG.cginc"
		#include "UnityUI.cginc"

		#pragma multi_compile __ UNITY_UI_ALPHACLIP

        #pragma vertex vert
        #pragma fragment frag

        struct appdata_t {
            float4 vertex : POSITION;
            half2 texcoord : TEXCOORD0;
            half4 color : COLOR;
        };

        struct v2f {
            float4 pos : SV_POSITION;
            half2 uv : TEXCOORD0;
			float4 worldPosition : TEXCOORD1;
            half4 colorFactor : COLOR;
        };

		sampler2D _MainTex;
		half4 _MainTex_ST;

		half4 _Color;
		half _Intensity;

		fixed4 _TextureSampleAdd;
		float4 _ClipRect;

        v2f vert(appdata_t v) 
        {
        	v2f o;

			o.worldPosition = v.vertex;
            o.pos = UnityObjectToClipPos(o.worldPosition);

            o.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);

#ifdef UNITY_HALF_TEXEL_OFFSET
			OUT.vertex.xy += (_ScreenParams.zw - 1.0)*float2(-1, 1);
#endif

            o.colorFactor = v.color * _Color * _Intensity;
            
            return o; 
        }

        fixed4 frag( v2f i ) : SV_Target 
        {    
			half4 ocolor = (tex2D (_MainTex, i.uv.xy) + _TextureSampleAdd) * i.colorFactor;

			ocolor.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);

#ifdef UNITY_UI_ALPHACLIP
			clip(ocolor.a - 0.001);
#endif
            return ocolor;
        }
    ENDCG
    
    SubShader 
    {
		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
			"PreviewType" = "Plane"
			"CanUseSpriteAtlas" = "True"
		}

		Stencil
		{
			Ref[_Stencil]
			Comp[_StencilComp]
			Pass[_StencilOp]
			ReadMask[_StencilReadMask]
			WriteMask[_StencilWriteMask]
		}
        
        Pass 
        {
			Tags{ "LIGHTMODE"="ForwardBase" }

			Cull Off
			Lighting Off
			ZWrite Off
			ZTest Always
			ColorMask[_ColorMask]

            Blend       SrcAlpha [_DestBlend]
            
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            ENDCG
        }
    }
}
