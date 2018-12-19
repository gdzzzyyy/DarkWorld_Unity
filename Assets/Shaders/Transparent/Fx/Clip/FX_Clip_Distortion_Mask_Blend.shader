// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3058824,fgcg:0.3058824,fgcb:0.3058824,fgca:1,fgde:0.015,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4020,x:34066,y:32693,varname:node_4020,prsc:2|custl-414-OUT,alpha-3603-OUT,clip-3238-OUT;n:type:ShaderForge.SFN_Tex2d,id:1709,x:32158,y:32818,ptovrint:False,ptlb:Main_Tex,ptin:_Main_Tex,varname:node_1709,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5129-OUT;n:type:ShaderForge.SFN_Slider,id:592,x:31557,y:33143,ptovrint:False,ptlb:Clip_Strength,ptin:_Clip_Strength,varname:node_592,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;n:type:ShaderForge.SFN_TexCoord,id:2421,x:30047,y:32845,varname:node_2421,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:3559,x:30674,y:32867,varname:node_3559,prsc:2|A-5874-OUT,B-8989-OUT;n:type:ShaderForge.SFN_Add,id:8989,x:30437,y:32956,varname:node_8989,prsc:2|A-2421-V,B-8167-OUT;n:type:ShaderForge.SFN_Add,id:5874,x:30437,y:32796,varname:node_5874,prsc:2|A-9575-OUT,B-2421-U;n:type:ShaderForge.SFN_ValueProperty,id:9235,x:30437,y:32584,ptovrint:False,ptlb:Main_Flow_U,ptin:_Main_Flow_U,varname:_Noise_Time_Flow_U,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:8602,x:30437,y:33253,ptovrint:False,ptlb:Main_Flow_V,ptin:_Main_Flow_V,varname:_Noise_Time_Flow_V,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:8167,x:30437,y:33105,varname:node_8167,prsc:2|A-4684-T,B-8602-OUT;n:type:ShaderForge.SFN_Time,id:4684,x:30047,y:33065,varname:node_4684,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9575,x:30437,y:32660,varname:node_9575,prsc:2|A-9235-OUT,B-4684-T;n:type:ShaderForge.SFN_Set,id:870,x:30924,y:32836,varname:Main_Group,prsc:2|IN-3559-OUT;n:type:ShaderForge.SFN_Get,id:6817,x:31356,y:32696,varname:node_6817,prsc:2|IN-870-OUT;n:type:ShaderForge.SFN_Panner,id:6487,x:29926,y:33797,varname:node_6487,prsc:2,spu:0,spv:0|UVIN-9546-OUT;n:type:ShaderForge.SFN_TexCoord,id:3409,x:29036,y:33774,varname:node_3409,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:9546,x:29663,y:33796,varname:node_9546,prsc:2|A-1766-OUT,B-9906-OUT;n:type:ShaderForge.SFN_Add,id:9906,x:29426,y:33885,varname:node_9906,prsc:2|A-3409-V,B-7284-OUT;n:type:ShaderForge.SFN_Add,id:1766,x:29426,y:33725,varname:node_1766,prsc:2|A-4649-OUT,B-3409-U;n:type:ShaderForge.SFN_Multiply,id:7284,x:29426,y:34022,varname:node_7284,prsc:2|A-802-T,B-7414-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1816,x:29426,y:33513,ptovrint:False,ptlb:Distortion_Flow_U,ptin:_Distortion_Flow_U,varname:_Mask_Flow_U_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:802,x:29036,y:33930,varname:node_802,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4649,x:29426,y:33594,varname:node_4649,prsc:2|A-1816-OUT,B-802-T;n:type:ShaderForge.SFN_Set,id:4663,x:30680,y:33649,varname:Distortion_Group,prsc:2|IN-2982-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7414,x:29426,y:34187,ptovrint:False,ptlb:Distortion_Flow_V,ptin:_Distortion_Flow_V,varname:node_7147,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:5281,x:30257,y:33798,ptovrint:False,ptlb:Distortion_Tex,ptin:_Distortion_Tex,varname:node_7341,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-6487-UVOUT;n:type:ShaderForge.SFN_Append,id:1720,x:30468,y:33798,varname:node_1720,prsc:2|A-5281-R,B-5281-G;n:type:ShaderForge.SFN_Multiply,id:2982,x:30680,y:33736,varname:node_2982,prsc:2|A-4894-OUT,B-1720-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4894,x:30468,y:33690,ptovrint:False,ptlb:Distortion_Strength,ptin:_Distortion_Strength,varname:node_8922,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:5129,x:31953,y:32818,varname:node_5129,prsc:2|A-7302-OUT,B-6415-OUT;n:type:ShaderForge.SFN_Get,id:6415,x:31653,y:32878,varname:node_6415,prsc:2|IN-4663-OUT;n:type:ShaderForge.SFN_TexCoord,id:7882,x:29054,y:32943,varname:node_7882,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_Set,id:2276,x:29355,y:32909,varname:Part_U,prsc:2|IN-7882-U;n:type:ShaderForge.SFN_Set,id:1312,x:29355,y:32971,varname:Part_V,prsc:2|IN-7882-V;n:type:ShaderForge.SFN_Set,id:706,x:29355,y:33031,varname:Part_Z,prsc:2|IN-7882-Z;n:type:ShaderForge.SFN_Set,id:6001,x:29355,y:33084,varname:Part_W,prsc:2|IN-7882-W;n:type:ShaderForge.SFN_SwitchProperty,id:4478,x:31939,y:33245,ptovrint:False,ptlb:Part_Clip,ptin:_Part_Clip,varname:node_4478,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-592-OUT,B-5260-OUT;n:type:ShaderForge.SFN_Get,id:5260,x:31660,y:33307,varname:node_5260,prsc:2|IN-2276-OUT;n:type:ShaderForge.SFN_VertexColor,id:5074,x:29087,y:33185,varname:node_5074,prsc:2;n:type:ShaderForge.SFN_Multiply,id:414,x:33378,y:32246,varname:node_414,prsc:2|A-8464-OUT,B-4591-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:7302,x:31588,y:32720,ptovrint:False,ptlb:Part_Flow,ptin:_Part_Flow,varname:node_7302,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-6817-OUT,B-9605-OUT;n:type:ShaderForge.SFN_TexCoord,id:5449,x:28805,y:32402,varname:node_5449,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:9766,x:29302,y:32400,varname:node_9766,prsc:2|A-6955-OUT,B-7388-OUT;n:type:ShaderForge.SFN_Add,id:7388,x:29065,y:32489,varname:node_7388,prsc:2|A-5449-V,B-5496-OUT;n:type:ShaderForge.SFN_Add,id:6955,x:29065,y:32329,varname:node_6955,prsc:2|A-7085-OUT,B-5449-U;n:type:ShaderForge.SFN_Get,id:7085,x:29044,y:32256,varname:node_7085,prsc:2|IN-706-OUT;n:type:ShaderForge.SFN_Get,id:5496,x:29044,y:32639,varname:node_5496,prsc:2|IN-6001-OUT;n:type:ShaderForge.SFN_Set,id:4083,x:29493,y:32309,varname:Part_Flow,prsc:2|IN-9766-OUT;n:type:ShaderForge.SFN_Get,id:9605,x:31356,y:32756,varname:node_9605,prsc:2|IN-4083-OUT;n:type:ShaderForge.SFN_Multiply,id:3603,x:32931,y:32926,varname:node_3603,prsc:2|A-4569-OUT,B-2419-OUT,C-7465-A,D-1709-R;n:type:ShaderForge.SFN_Set,id:4461,x:29325,y:33185,varname:V_Rgb,prsc:2|IN-5074-RGB;n:type:ShaderForge.SFN_Set,id:4281,x:29325,y:33266,varname:V_A,prsc:2|IN-5074-A;n:type:ShaderForge.SFN_Get,id:8464,x:33378,y:32171,varname:node_8464,prsc:2|IN-4461-OUT;n:type:ShaderForge.SFN_Get,id:2419,x:32931,y:32792,varname:node_2419,prsc:2|IN-4281-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3661,x:30823,y:34289,ptovrint:False,ptlb:Mask_Power,ptin:_Mask_Power,varname:node_5169,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:2078,x:30471,y:34108,ptovrint:False,ptlb:Mask_Tex,ptin:_Mask_Tex,varname:node_3733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-3313-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2939,x:31164,y:34128,varname:node_2939,prsc:2|A-3296-OUT,B-3872-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3872,x:31164,y:34298,ptovrint:False,ptlb:Mask_Strength,ptin:_Mask_Strength,varname:node_75,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:3296,x:30823,y:34129,varname:node_3296,prsc:2|VAL-2078-R,EXP-3661-OUT;n:type:ShaderForge.SFN_Rotator,id:3313,x:30233,y:34108,varname:node_3313,prsc:2|UVIN-9323-OUT,ANG-907-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5709,x:29794,y:34246,ptovrint:False,ptlb:Mask_Ang,ptin:_Mask_Ang,varname:node_7973,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_SwitchProperty,id:4569,x:32554,y:33009,ptovrint:False,ptlb:Mask_Switxh,ptin:_Mask_Switxh,varname:node_3430,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8066-OUT,B-9853-OUT;n:type:ShaderForge.SFN_TexCoord,id:4125,x:30045,y:31916,varname:node_4125,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:1673,x:30672,y:31938,varname:node_1673,prsc:2|A-5816-OUT,B-7822-OUT;n:type:ShaderForge.SFN_Add,id:7822,x:30435,y:32027,varname:node_7822,prsc:2|A-4125-V,B-6084-OUT;n:type:ShaderForge.SFN_Add,id:5816,x:30435,y:31867,varname:node_5816,prsc:2|A-8752-OUT,B-4125-U;n:type:ShaderForge.SFN_ValueProperty,id:8918,x:30435,y:31655,ptovrint:False,ptlb:Mask_Flow_U,ptin:_Mask_Flow_U,varname:_Main_Flow_U_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:6588,x:30435,y:32324,ptovrint:False,ptlb:Mask_Flow_V,ptin:_Mask_Flow_V,varname:_Main_Flow_V_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:6084,x:30435,y:32176,varname:node_6084,prsc:2|A-232-T,B-6588-OUT;n:type:ShaderForge.SFN_Time,id:232,x:30045,y:32136,varname:node_232,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8752,x:30435,y:31731,varname:node_8752,prsc:2|A-8918-OUT,B-232-T;n:type:ShaderForge.SFN_Set,id:3878,x:30924,y:31938,varname:Mask_Flow,prsc:2|IN-1673-OUT;n:type:ShaderForge.SFN_Get,id:9323,x:29893,y:34108,varname:node_9323,prsc:2|IN-3878-OUT;n:type:ShaderForge.SFN_Set,id:3089,x:31400,y:34128,varname:Mask_Group,prsc:2|IN-2939-OUT;n:type:ShaderForge.SFN_Get,id:9853,x:32137,y:33025,varname:node_9853,prsc:2|IN-3089-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3382,x:32527,y:32526,ptovrint:False,ptlb:Main_Power,ptin:_Main_Power,varname:_Mask_Power_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.01;n:type:ShaderForge.SFN_Multiply,id:4591,x:32880,y:32270,varname:node_4591,prsc:2|A-5104-OUT,B-7465-RGB,C-7511-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5104,x:32582,y:32224,ptovrint:False,ptlb:Main_Strength,ptin:_Main_Strength,varname:_Mask_Strength_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:7511,x:32527,y:32606,varname:node_7511,prsc:2|VAL-1709-R,EXP-3382-OUT;n:type:ShaderForge.SFN_Color,id:7465,x:32582,y:32316,ptovrint:False,ptlb:Main_Color,ptin:_Main_Color,varname:node_7465,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Subtract,id:3238,x:32931,y:33248,varname:node_3238,prsc:2|A-1709-R,B-343-OUT;n:type:ShaderForge.SFN_OneMinus,id:343,x:32290,y:33293,varname:node_343,prsc:2|IN-4478-OUT;n:type:ShaderForge.SFN_Pi,id:7523,x:29827,y:34319,varname:node_7523,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8360,x:30009,y:34277,varname:node_8360,prsc:2|A-5709-OUT,B-7523-OUT;n:type:ShaderForge.SFN_Divide,id:907,x:30233,y:34277,varname:node_907,prsc:2|A-8360-OUT,B-8114-OUT;n:type:ShaderForge.SFN_Vector1,id:8114,x:30009,y:34425,varname:node_8114,prsc:2,v1:180;n:type:ShaderForge.SFN_Multiply,id:8066,x:32341,y:32953,varname:node_8066,prsc:2|A-1709-R,B-9853-OUT;proporder:1709-7465-5104-3382-592-9235-8602-4478-7302-5281-4894-1816-7414-2078-4569-3872-3661-5709-8918-6588;pass:END;sub:END;*/

Shader "Fx/Clip/Clip_Distortion_Mask_Blend" {
    Properties {
        _Main_Tex ("Main_Tex", 2D) = "white" {}
        [HDR]_Main_Color ("Main_Color", Color) = (0.5,0.5,0.5,1)
        _Main_Strength ("Main_Strength", Float ) = 1
        _Main_Power ("Main_Power", Float ) = 0.01
        _Clip_Strength ("Clip_Strength", Range(0, 2)) = 2
        _Main_Flow_U ("Main_Flow_U", Float ) = 0
        _Main_Flow_V ("Main_Flow_V", Float ) = 0
        [MaterialToggle] _Part_Clip ("Part_Clip", Float ) = 2
        [MaterialToggle] _Part_Flow ("Part_Flow", Float ) = 0
        _Distortion_Tex ("Distortion_Tex", 2D) = "white" {}
        _Distortion_Strength ("Distortion_Strength", Float ) = 0
        _Distortion_Flow_U ("Distortion_Flow_U", Float ) = 0
        _Distortion_Flow_V ("Distortion_Flow_V", Float ) = 0
        _Mask_Tex ("Mask_Tex", 2D) = "white" {}
        [MaterialToggle] _Mask_Switxh ("Mask_Switxh", Float ) = 0
        _Mask_Strength ("Mask_Strength", Float ) = 1
        _Mask_Power ("Mask_Power", Float ) = 1
        _Mask_Ang ("Mask_Ang", Float ) = 0
        _Mask_Flow_U ("Mask_Flow_U", Float ) = 0
        _Mask_Flow_V ("Mask_Flow_V", Float ) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
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
            uniform float _Clip_Strength;
            uniform float _Main_Flow_U;
            uniform float _Main_Flow_V;
            uniform float _Distortion_Flow_U;
            uniform float _Distortion_Flow_V;
            uniform sampler2D _Distortion_Tex; uniform float4 _Distortion_Tex_ST;
            uniform float _Distortion_Strength;
            uniform fixed _Part_Clip;
            uniform fixed _Part_Flow;
            uniform float _Mask_Power;
            uniform sampler2D _Mask_Tex; uniform float4 _Mask_Tex_ST;
            uniform float _Mask_Strength;
            uniform float _Mask_Ang;
            uniform fixed _Mask_Switxh;
            uniform float _Mask_Flow_U;
            uniform float _Mask_Flow_V;
            uniform float _Main_Power;
            uniform float _Main_Strength;
            uniform float4 _Main_Color;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 node_4684 = _Time + _TimeEditor;
                float2 Main_Group = float2(((_Main_Flow_U*node_4684.g)+i.uv0.r),(i.uv0.g+(node_4684.g*_Main_Flow_V)));
                float Part_Z = i.uv1.b;
                float Part_W = i.uv1.a;
                float2 Part_Flow = float2((Part_Z+i.uv0.r),(i.uv0.g+Part_W));
                float4 node_5142 = _Time + _TimeEditor;
                float4 node_802 = _Time + _TimeEditor;
                float2 node_6487 = (float2(((_Distortion_Flow_U*node_802.g)+i.uv0.r),(i.uv0.g+(node_802.g*_Distortion_Flow_V)))+node_5142.g*float2(0,0));
                float4 _Distortion_Tex_var = tex2D(_Distortion_Tex,TRANSFORM_TEX(node_6487, _Distortion_Tex));
                float2 Distortion_Group = (_Distortion_Strength*float2(_Distortion_Tex_var.r,_Distortion_Tex_var.g));
                float2 node_5129 = (lerp( Main_Group, Part_Flow, _Part_Flow )+Distortion_Group);
                float4 _Main_Tex_var = tex2D(_Main_Tex,TRANSFORM_TEX(node_5129, _Main_Tex));
                float Part_U = i.uv1.r;
                clip((_Main_Tex_var.r-(1.0 - lerp( _Clip_Strength, Part_U, _Part_Clip ))) - 0.5);
////// Lighting:
                float3 V_Rgb = i.vertexColor.rgb;
                float3 finalColor = (V_Rgb*(_Main_Strength*_Main_Color.rgb*pow(_Main_Tex_var.r,_Main_Power)));
                float node_3313_ang = ((_Mask_Ang*3.141592654)/180.0);
                float node_3313_spd = 1.0;
                float node_3313_cos = cos(node_3313_spd*node_3313_ang);
                float node_3313_sin = sin(node_3313_spd*node_3313_ang);
                float2 node_3313_piv = float2(0.5,0.5);
                float4 node_232 = _Time + _TimeEditor;
                float2 Mask_Flow = float2(((_Mask_Flow_U*node_232.g)+i.uv0.r),(i.uv0.g+(node_232.g*_Mask_Flow_V)));
                float2 node_3313 = (mul(Mask_Flow-node_3313_piv,float2x2( node_3313_cos, -node_3313_sin, node_3313_sin, node_3313_cos))+node_3313_piv);
                float4 _Mask_Tex_var = tex2D(_Mask_Tex,TRANSFORM_TEX(node_3313, _Mask_Tex));
                float Mask_Group = (pow(_Mask_Tex_var.r,_Mask_Power)*_Mask_Strength);
                float node_9853 = Mask_Group;
                float V_A = i.vertexColor.a;
				
				finalColor = max(finalColor, float3(0,0,0));
				float finalAlpha = lerp((_Main_Tex_var.r*node_9853), node_9853, _Mask_Switxh ) * V_A * _Main_Color.a * _Main_Tex_var.r;
                return float4(finalColor, finalAlpha);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
