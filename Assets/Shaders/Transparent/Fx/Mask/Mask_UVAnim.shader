// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Fx/Mask/UVAnim" 
{
    Properties 
    {
        _MainTex ("Base", 2D) = "white" {}
        _MaskTex ("Mask", 2D) = "white" {}
        _TintColor ("TintColor", Color) = (1.0, 1.0, 1.0, 1.0)
        _UOffsetSpeed ("UOffsetSpeed", Float) = 0
        _VOffsetSpeed ("YOffsetSpeed", Float) = 0
        _UVRotateSpeed ("UVRotateSpeed", Float) = 0
        _Intensity("Intensity", Float) = 1
        
        [Enum(Add,1,Blend,10)] _DestBlend ("Dest Alpha Blend", Float) = 1
        [Enum(Off,0,On,2)] _CullBack ("Cull Back", Float) = 2
        [Enum(Off,4,On,8)] _ZTest ("Always Show", Float) = 4

        [KeywordEnum(Off, On)] _ALPHA_CUT("AlphaCut", Float) = 0
        _AlphaThreshold("AlphaThreshold", Range(0, 1)) = 0
    }
    
    CGINCLUDE
        #pragma multi_compile _ALPHA_CUT_OFF _ALPHA_CUT_ON
        #include "UnityCG.cginc"

        #pragma vertex vert
        #pragma fragment frag
                
        sampler2D _MainTex;
        half4 _MainTex_ST;

        sampler2D _MaskTex;
        half4 _MaskTex_ST;

        half4 _TintColor;
        half _Intensity;

        float _UOffsetSpeed;
        float _VOffsetSpeed;
        float _UVRotateSpeed;

        struct appdata_t {
            float4 vertex : POSITION;
            half2 texcoord : TEXCOORD0;
            half4 color : COLOR;
        };

        struct v2f {
            float4 pos : SV_POSITION;
            half2 uv : TEXCOORD0;
            half2 uv2 : TEXCOORD1;
            half4 colorFactor : COLOR;
        };

        v2f vert(appdata_t v)
        {
            v2f o;

            const half TWO_PI = 3.14159 * 2;
            const half2 VEC_CENTER = half2(0.5h, 0.5h);
            
            o.pos = UnityObjectToClipPos (v.vertex);
            o.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
            
            float time = _Time.z;
            
            float absUVRotSpeed     = abs(_UVRotateSpeed);
            float absUOffsetSpeed   = abs(_UOffsetSpeed);
            float absVOffsetSpeed   = abs(_VOffsetSpeed);
            
            half2 finaluv =  o.uv.xy;
            if (absUVRotSpeed > 0.)
            {
                finaluv -= VEC_CENTER;
                
                half rotation = TWO_PI * frac(time * _UVRotateSpeed);
                half sin_rot = sin(rotation);
                half cos_rot = cos(rotation);
                
                finaluv = half2(
                    finaluv.x * cos_rot - finaluv.y * sin_rot,
                    finaluv.x * sin_rot + finaluv.y * cos_rot);
                    
                finaluv += VEC_CENTER;
            }
            
            if (absUOffsetSpeed > 0.)
            {
                finaluv.x += frac(time * _UOffsetSpeed);
            }
            if (absVOffsetSpeed > 0.)
            {
                finaluv.y += frac(time * _VOffsetSpeed);
            }
            o.uv.xy = finaluv;
            o.uv2.xy = TRANSFORM_TEX(v.texcoord, _MaskTex);
            o.colorFactor = v.color * _TintColor * _Intensity;  
            
            return o; 
        }

        fixed _AlphaThreshold;
        fixed4 frag( v2f i ) : SV_Target 
        {    
            fixed4 ocolor = tex2D (_MainTex, i.uv.xy );
            fixed4 maskcolor = tex2D (_MaskTex, i.uv2.xy );
            
            ocolor = half4(ocolor * maskcolor) * i.colorFactor;

#ifdef _ALPHA_CUT_ON
            clip(ocolor.a - _AlphaThreshold);
#endif
            return ocolor;
        }
    ENDCG
    
    SubShader 
    {
        Tags { "RenderType" = "Transparent" "Queue" = "Transparent"}
        
        Pass {
            Tags { "LIGHTMODE"="ForwardBase" }
            Blend       SrcAlpha [_DestBlend]
            Cull        [_CullBack]
            ZTest       [_ZTest]
            Lighting    Off 
            ZWrite      Off
            
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            ENDCG
        }
    }
}
