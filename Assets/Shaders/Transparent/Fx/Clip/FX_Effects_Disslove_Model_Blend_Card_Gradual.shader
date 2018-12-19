// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True,fsmp:False;n:type:ShaderForge.SFN_Final,id:4795,x:32730,y:32715,varname:node_4795,prsc:2|emission-1479-OUT,alpha-9296-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31736,y:32366,ptovrint:False,ptlb:Main_Tex,ptin:_Main_Tex,varname:_Main_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:797,x:31338,y:32709,ptovrint:True,ptlb:Dissclve_Color,ptin:_TintColor,varname:_TintColor,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2643,x:30392,y:34051,ptovrint:False,ptlb:Crack_Tex,ptin:_Crack_Tex,varname:_Crack_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:2903,x:30780,y:34070,varname:node_2903,prsc:2,frmn:0,frmx:1,tomn:1,tomx:2.5|IN-2643-R;n:type:ShaderForge.SFN_Subtract,id:6172,x:31299,y:33914,varname:node_6172,prsc:2|A-2903-OUT,B-8646-OUT;n:type:ShaderForge.SFN_Slider,id:6161,x:29875,y:33241,ptovrint:False,ptlb:Dissolve_Strength,ptin:_Dissolve_Strength,varname:_Dissolve_Strength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_RemapRange,id:8646,x:30739,y:33766,varname:node_8646,prsc:2,frmn:0,frmx:2,tomn:0,tomx:5|IN-6221-OUT;n:type:ShaderForge.SFN_Subtract,id:8322,x:31284,y:33624,varname:node_8322,prsc:2|A-426-OUT,B-8646-OUT;n:type:ShaderForge.SFN_Multiply,id:7160,x:31579,y:33758,varname:node_7160,prsc:2|A-5522-OUT,B-8322-OUT;n:type:ShaderForge.SFN_Tex2d,id:1553,x:30428,y:32750,ptovrint:False,ptlb:Details_Tex,ptin:_Details_Tex,varname:_Noise_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5300-OUT;n:type:ShaderForge.SFN_RemapRange,id:426,x:31192,y:33209,varname:node_426,prsc:2,frmn:0,frmx:1,tomn:1,tomx:6|IN-1095-R;n:type:ShaderForge.SFN_Tex2d,id:1095,x:30763,y:33079,ptovrint:False,ptlb:Dissclve_Tex,ptin:_Dissclve_Tex,varname:_Dissclve_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Step,id:9296,x:31192,y:32977,varname:node_9296,prsc:2|A-1095-R,B-9533-OUT;n:type:ShaderForge.SFN_Multiply,id:8750,x:31733,y:32802,varname:node_8750,prsc:2|A-797-RGB,B-9296-OUT,C-5331-OUT;n:type:ShaderForge.SFN_Add,id:9669,x:32042,y:33636,varname:node_9669,prsc:2|A-8322-OUT,B-6172-OUT;n:type:ShaderForge.SFN_Clamp01,id:5331,x:32726,y:33636,varname:node_5331,prsc:2|IN-7801-OUT;n:type:ShaderForge.SFN_Multiply,id:6242,x:32002,y:32697,varname:node_6242,prsc:2|A-7174-OUT,B-8750-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7174,x:31718,y:32602,ptovrint:False,ptlb:Dissclve_Glow,ptin:_Dissclve_Glow,varname:_Dissclve_Glow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Get,id:9533,x:31171,y:33107,varname:node_9533,prsc:2|IN-978-OUT;n:type:ShaderForge.SFN_Set,id:978,x:30490,y:33416,varname:Dissolve_Strength,prsc:2|IN-5582-OUT;n:type:ShaderForge.SFN_Add,id:1479,x:32299,y:32478,varname:node_1479,prsc:2|A-8328-OUT,B-6242-OUT;n:type:ShaderForge.SFN_Get,id:6221,x:30516,y:33766,varname:node_6221,prsc:2|IN-978-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:7801,x:32489,y:33636,ptovrint:False,ptlb:Details_Switch,ptin:_Details_Switch,varname:_Noise_Switch,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9669-OUT,B-2472-OUT;n:type:ShaderForge.SFN_Add,id:4768,x:31808,y:33900,varname:node_4768,prsc:2|A-7160-OUT,B-6172-OUT;n:type:ShaderForge.SFN_Panner,id:211,x:29915,y:32439,varname:node_211,prsc:2,spu:0,spv:0|UVIN-4026-OUT;n:type:ShaderForge.SFN_TexCoord,id:8756,x:29025,y:32416,varname:node_8756,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:4026,x:29652,y:32438,varname:node_4026,prsc:2|A-3114-OUT,B-9187-OUT;n:type:ShaderForge.SFN_Add,id:9187,x:29415,y:32527,varname:node_9187,prsc:2|A-8756-V,B-2345-OUT;n:type:ShaderForge.SFN_Add,id:3114,x:29415,y:32367,varname:node_3114,prsc:2|A-6536-OUT,B-8756-U;n:type:ShaderForge.SFN_Multiply,id:2345,x:29415,y:32664,varname:node_2345,prsc:2|A-1526-T,B-1858-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3044,x:29415,y:32155,ptovrint:False,ptlb:Details_Distortion_Flow_U,ptin:_Details_Distortion_Flow_U,varname:_Noise_Distortion_Flow_U,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:1526,x:29025,y:32572,varname:node_1526,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6536,x:29415,y:32236,varname:node_6536,prsc:2|A-3044-OUT,B-1526-T;n:type:ShaderForge.SFN_Set,id:1344,x:30671,y:32244,varname:Distortion,prsc:2|IN-7844-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1858,x:29415,y:32829,ptovrint:False,ptlb:Details_Distortion_Flow_V,ptin:_Details_Distortion_Flow_V,varname:_Noise_Distortion_Flow_V,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:5998,x:30246,y:32440,ptovrint:False,ptlb:Noise_Distortion_Tex,ptin:_Noise_Distortion_Tex,varname:_Noise_Distortion_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-211-UVOUT;n:type:ShaderForge.SFN_Append,id:9853,x:30459,y:32393,varname:node_9853,prsc:2|A-5998-R,B-5998-G;n:type:ShaderForge.SFN_Multiply,id:7844,x:30671,y:32331,varname:node_7844,prsc:2|A-1602-OUT,B-9853-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1602,x:30459,y:32285,ptovrint:False,ptlb:Details_Distortion_Strength,ptin:_Details_Distortion_Strength,varname:_Distortion_Strength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Get,id:3226,x:30167,y:32685,varname:node_3226,prsc:2|IN-1344-OUT;n:type:ShaderForge.SFN_Add,id:5300,x:30188,y:32750,varname:node_5300,prsc:2|A-3226-OUT,B-4083-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:4083,x:29928,y:32771,varname:node_4083,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2472,x:32268,y:33767,varname:node_2472,prsc:2|A-9669-OUT,B-4768-OUT;n:type:ShaderForge.SFN_Set,id:9513,x:30657,y:32677,varname:Details_Tex,prsc:2|IN-1553-R;n:type:ShaderForge.SFN_Get,id:5522,x:31558,y:33680,varname:node_5522,prsc:2|IN-9513-OUT;n:type:ShaderForge.SFN_Multiply,id:8328,x:32002,y:32268,varname:node_8328,prsc:2|A-8946-RGB,B-6195-OUT,C-6074-RGB;n:type:ShaderForge.SFN_Color,id:8946,x:31727,y:32000,ptovrint:False,ptlb:Main_color,ptin:_Main_color,varname:_Main_color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_TexCoord,id:8324,x:29415,y:32943,varname:node_8324,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_SwitchProperty,id:5582,x:30232,y:33413,ptovrint:False,ptlb:Part_Dissolve,ptin:_Part_Dissolve,varname:node_5582,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-6161-OUT,B-1401-OUT;n:type:ShaderForge.SFN_Set,id:8123,x:29624,y:32902,varname:Part_U,prsc:2|IN-8324-U;n:type:ShaderForge.SFN_Get,id:1401,x:29990,y:33435,varname:node_1401,prsc:2|IN-8123-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6195,x:31728,y:32234,ptovrint:False,ptlb:Main_Strength,ptin:_Main_Strength,varname:node_6195,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:8946-6074-1095-2643-797-7174-6161-5582-7801-1553-5998-1602-3044-1858-6195;pass:END;sub:END;*/

Shader "Fx/Clip/Model_Blend_Card_Gradual" {
    Properties {
        _Main_color ("Main_color", Color) = (0.5,0.5,0.5,1)
        _Main_Tex ("Main_Tex", 2D) = "white" {}
        _Dissclve_Tex ("Dissclve_Tex", 2D) = "white" {}
        _Crack_Tex ("Crack_Tex", 2D) = "white" {}
        [HDR]_TintColor ("Dissclve_Color", Color) = (0.5,0.5,0.5,1)
        _Dissclve_Glow ("Dissclve_Glow", Float ) = 1
        _Dissolve_Strength ("Dissolve_Strength", Range(0, 2)) = 0
        [MaterialToggle] _Part_Dissolve ("Part_Dissolve", Float ) = 0
        [MaterialToggle] _Details_Switch ("Details_Switch", Float ) = 2
        _Details_Tex ("Details_Tex", 2D) = "white" {}
        _Noise_Distortion_Tex ("Noise_Distortion_Tex", 2D) = "white" {}
        _Details_Distortion_Strength ("Details_Distortion_Strength", Float ) = 0
        _Details_Distortion_Flow_U ("Details_Distortion_Flow_U", Float ) = 0
        _Details_Distortion_Flow_V ("Details_Distortion_Flow_V", Float ) = 0
        _Main_Strength ("Main_Strength", Float ) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Main_Tex; uniform float4 _Main_Tex_ST;
            uniform float4 _TintColor;
            uniform sampler2D _Crack_Tex; uniform float4 _Crack_Tex_ST;
            uniform float _Dissolve_Strength;
            uniform sampler2D _Details_Tex; uniform float4 _Details_Tex_ST;
            uniform sampler2D _Dissclve_Tex; uniform float4 _Dissclve_Tex_ST;
            uniform float _Dissclve_Glow;
            uniform fixed _Details_Switch;
            uniform float _Details_Distortion_Flow_U;
            uniform float _Details_Distortion_Flow_V;
            uniform sampler2D _Noise_Distortion_Tex; uniform float4 _Noise_Distortion_Tex_ST;
            uniform float _Details_Distortion_Strength;
            uniform float4 _Main_color;
            uniform fixed _Part_Dissolve;
            uniform float _Main_Strength;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 _Main_Tex_var = tex2D(_Main_Tex,TRANSFORM_TEX(i.uv0, _Main_Tex));
                float4 _Dissclve_Tex_var = tex2D(_Dissclve_Tex,TRANSFORM_TEX(i.uv0, _Dissclve_Tex));
                float Part_U = i.uv1.r;
                float Dissolve_Strength = lerp( _Dissolve_Strength, Part_U, _Part_Dissolve );
                float node_9296 = step(_Dissclve_Tex_var.r,Dissolve_Strength);
                float node_8646 = (Dissolve_Strength*2.5+0.0);
                float node_8322 = ((_Dissclve_Tex_var.r*5.0+1.0)-node_8646);
                float4 _Crack_Tex_var = tex2D(_Crack_Tex,TRANSFORM_TEX(i.uv0, _Crack_Tex));
                float node_6172 = ((_Crack_Tex_var.r*1.5+1.0)-node_8646);
                float node_9669 = (node_8322+node_6172);
                float4 node_9549 = _Time + _TimeEditor;
                float4 node_1526 = _Time + _TimeEditor;
                float2 node_211 = (float2(((_Details_Distortion_Flow_U*node_1526.g)+i.uv0.r),(i.uv0.g+(node_1526.g*_Details_Distortion_Flow_V)))+node_9549.g*float2(0,0));
                float4 _Noise_Distortion_Tex_var = tex2D(_Noise_Distortion_Tex,TRANSFORM_TEX(node_211, _Noise_Distortion_Tex));
                float2 Distortion = (_Details_Distortion_Strength*float2(_Noise_Distortion_Tex_var.r,_Noise_Distortion_Tex_var.g));
                float2 node_5300 = (Distortion+i.uv0);
                float4 _Details_Tex_var = tex2D(_Details_Tex,TRANSFORM_TEX(node_5300, _Details_Tex));
                float Details_Tex = _Details_Tex_var.r;

                float3 emissive = ((_Main_color.rgb*_Main_Strength*_Main_Tex_var.rgb)+(_Dissclve_Glow*(_TintColor.rgb*node_9296*saturate(lerp( node_9669, (node_9669+((Details_Tex*node_8322)+node_6172)), _Details_Switch )))));
                float3 finalColor = max(emissive, float3(0,0,0));

                return float4(finalColor,node_9296);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
