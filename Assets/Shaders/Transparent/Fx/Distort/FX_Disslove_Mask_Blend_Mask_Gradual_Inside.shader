// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:0,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3058824,fgcg:0.3058824,fgcb:0.3058824,fgca:1,fgde:0.015,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:35019,y:32944,varname:node_4013,prsc:2|custl-6749-OUT,alpha-8483-OUT,clip-8979-OUT;n:type:ShaderForge.SFN_Tex2d,id:6802,x:31062,y:32705,ptovrint:False,ptlb:Main_Tex,ptin:_Main_Tex,varname:_Main_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-307-OUT;n:type:ShaderForge.SFN_Tex2d,id:3549,x:32401,y:33018,ptovrint:False,ptlb:Dissolution_Tex,ptin:_Dissolution_Tex,varname:_Dissolution_Noise_Tex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:99da52b4477e25e4ba777a1aceaab9b6,ntxv:0,isnm:False|UVIN-7670-OUT;n:type:ShaderForge.SFN_Subtract,id:6783,x:32721,y:33760,varname:node_6783,prsc:2|A-2544-OUT,B-1837-OUT;n:type:ShaderForge.SFN_Slider,id:8302,x:32843,y:33041,ptovrint:False,ptlb:Edge_Inside_Glow,ptin:_Edge_Inside_Glow,varname:_Edge_Glow,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.1;n:type:ShaderForge.SFN_Divide,id:9591,x:33382,y:32978,varname:node_9591,prsc:2|A-8302-OUT,B-7288-OUT;n:type:ShaderForge.SFN_Clamp01,id:3223,x:33552,y:33768,varname:node_3223,prsc:2|IN-5794-OUT;n:type:ShaderForge.SFN_Slider,id:9502,x:33009,y:33960,ptovrint:False,ptlb:Dissolution_Power,ptin:_Dissolution_Power,varname:_Dissolution_Power,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.1,max:5;n:type:ShaderForge.SFN_Power,id:742,x:33166,y:33768,varname:node_742,prsc:2|VAL-6783-OUT,EXP-9502-OUT;n:type:ShaderForge.SFN_Add,id:5794,x:33365,y:33768,varname:node_5794,prsc:2|A-742-OUT,B-742-OUT;n:type:ShaderForge.SFN_TexCoord,id:6152,x:31577,y:32996,varname:node_6152,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:7670,x:32204,y:33018,varname:node_7670,prsc:2|A-3611-OUT,B-8235-OUT;n:type:ShaderForge.SFN_Add,id:8235,x:31967,y:33107,varname:node_8235,prsc:2|A-6152-V,B-7112-OUT;n:type:ShaderForge.SFN_Add,id:3611,x:31967,y:32947,varname:node_3611,prsc:2|A-6576-OUT,B-6152-U;n:type:ShaderForge.SFN_ValueProperty,id:12,x:31967,y:32735,ptovrint:False,ptlb:Noise_Flow_U,ptin:_Noise_Flow_U,varname:_Noise_Time_Flow_U,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7694,x:31967,y:33404,ptovrint:False,ptlb:Noise_Flow_V,ptin:_Noise_Flow_V,varname:_Noise_Time_Flow_V,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:7112,x:31967,y:33256,varname:node_7112,prsc:2|A-8650-T,B-7694-OUT;n:type:ShaderForge.SFN_Time,id:8650,x:31577,y:33216,varname:node_8650,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6576,x:31967,y:32811,varname:node_6576,prsc:2|A-12-OUT,B-8650-T;n:type:ShaderForge.SFN_Subtract,id:7895,x:32743,y:33512,varname:node_7895,prsc:2|A-3768-OUT,B-6411-OUT;n:type:ShaderForge.SFN_Divide,id:9232,x:33382,y:33120,varname:node_9232,prsc:2|A-8302-OUT,B-7895-OUT;n:type:ShaderForge.SFN_Multiply,id:1265,x:33737,y:32526,varname:node_1265,prsc:2|A-2697-RGB,B-9180-OUT;n:type:ShaderForge.SFN_Color,id:2697,x:33169,y:32519,ptovrint:False,ptlb:Edge_Coor,ptin:_Edge_Coor,varname:_Edge_Coor,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5019608,c2:0.5019608,c3:0.5019608,c4:1;n:type:ShaderForge.SFN_Lerp,id:9180,x:33934,y:33039,varname:node_9180,prsc:2|A-9591-OUT,B-9232-OUT,T-7293-OUT;n:type:ShaderForge.SFN_Slider,id:7293,x:33271,y:33354,ptovrint:False,ptlb:Edge_Inside_Blend,ptin:_Edge_Inside_Blend,varname:_Edge_Blend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:7092,x:34396,y:32805,varname:node_7092,prsc:2|A-9344-OUT,B-1379-OUT;n:type:ShaderForge.SFN_Multiply,id:213,x:33737,y:32673,varname:node_213,prsc:2|A-9088-OUT,B-9180-OUT;n:type:ShaderForge.SFN_OneMinus,id:9088,x:33483,y:32673,varname:node_9088,prsc:2|IN-2697-RGB;n:type:ShaderForge.SFN_Lerp,id:9344,x:33984,y:32652,varname:node_9344,prsc:2|A-1265-OUT,B-213-OUT,T-7293-OUT;n:type:ShaderForge.SFN_Set,id:9064,x:32603,y:33038,varname:Noise_Group,prsc:2|IN-3549-R;n:type:ShaderForge.SFN_Get,id:3768,x:32523,y:33487,varname:node_3768,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Get,id:1837,x:32516,y:33796,varname:node_1837,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Set,id:8587,x:32142,y:33824,varname:Diss_Group,prsc:2|IN-8148-OUT;n:type:ShaderForge.SFN_Get,id:2544,x:32516,y:33734,varname:node_2544,prsc:2|IN-8587-OUT;n:type:ShaderForge.SFN_Get,id:6411,x:32523,y:33548,varname:node_6411,prsc:2|IN-8587-OUT;n:type:ShaderForge.SFN_Multiply,id:512,x:31333,y:32620,varname:node_512,prsc:2|A-4462-RGB,B-800-OUT,C-6802-RGB;n:type:ShaderForge.SFN_Color,id:4462,x:31065,y:32444,ptovrint:False,ptlb:Main_Color,ptin:_Main_Color,varname:_Main_Color,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:800,x:31065,y:32641,ptovrint:False,ptlb:Main_Strength,ptin:_Main_Strength,varname:_Main_Strength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Set,id:9186,x:31551,y:32620,varname:Main_Group,prsc:2|IN-512-OUT;n:type:ShaderForge.SFN_Get,id:1379,x:34148,y:32825,varname:node_1379,prsc:2|IN-9186-OUT;n:type:ShaderForge.SFN_Multiply,id:8483,x:34043,y:33744,varname:node_8483,prsc:2|A-267-OUT,B-3223-OUT,C-2417-OUT;n:type:ShaderForge.SFN_Set,id:2673,x:31333,y:32525,varname:Main_A,prsc:2|IN-4462-A;n:type:ShaderForge.SFN_Get,id:267,x:33802,y:33700,varname:node_267,prsc:2|IN-2673-OUT;n:type:ShaderForge.SFN_Slider,id:9239,x:30918,y:34277,ptovrint:False,ptlb:Dissolution_Strength,ptin:_Dissolution_Strength,varname:node_3276,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.7504762,max:1.2;n:type:ShaderForge.SFN_Step,id:8979,x:34647,y:33632,varname:node_8979,prsc:2|A-9343-OUT,B-2729-OUT;n:type:ShaderForge.SFN_Get,id:9343,x:34434,y:33605,varname:node_9343,prsc:2|IN-9064-OUT;n:type:ShaderForge.SFN_Get,id:2729,x:34434,y:33668,varname:node_2729,prsc:2|IN-8587-OUT;n:type:ShaderForge.SFN_Multiply,id:8148,x:31926,y:33824,varname:node_8148,prsc:2|A-4418-R,B-673-OUT;n:type:ShaderForge.SFN_Tex2d,id:4418,x:31691,y:33717,ptovrint:False,ptlb:Dissolution_Mask,ptin:_Dissolution_Mask,varname:node_4418,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:673,x:31691,y:33938,ptovrint:False,ptlb:Dissolution_Gradual,ptin:_Dissolution_Gradual,varname:node_673,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3261-OUT,B-2467-OUT;n:type:ShaderForge.SFN_TexCoord,id:2497,x:30183,y:33808,varname:node_2497,prsc:2,uv:0,uaff:True;n:type:ShaderForge.SFN_ComponentMask,id:1429,x:30754,y:33955,varname:node_1429,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-1566-OUT;n:type:ShaderForge.SFN_Rotator,id:4778,x:30474,y:33808,varname:node_4778,prsc:2|UVIN-2497-UVOUT,ANG-1231-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1231,x:30474,y:33986,ptovrint:False,ptlb:Gradual_Rotator,ptin:_Gradual_Rotator,varname:node_9615,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Power,id:2467,x:31284,y:33955,varname:node_2467,prsc:2|VAL-5133-OUT,EXP-7236-OUT;n:type:ShaderForge.SFN_OneMinus,id:1566,x:30754,y:33809,varname:node_1566,prsc:2|IN-4778-UVOUT;n:type:ShaderForge.SFN_Add,id:5133,x:31021,y:33957,varname:node_5133,prsc:2|A-1429-OUT,B-3261-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7236,x:31284,y:34119,ptovrint:False,ptlb:Gradual_Power,ptin:_Gradual_Power,varname:node_3602,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Add,id:7288,x:33000,y:33241,varname:node_7288,prsc:2|A-6170-OUT,B-6783-OUT;n:type:ShaderForge.SFN_Vector1,id:6170,x:32800,y:33241,varname:node_6170,prsc:2,v1:0.08;n:type:ShaderForge.SFN_SwitchProperty,id:3261,x:31284,y:34277,ptovrint:False,ptlb:Part_Dissolution,ptin:_Part_Dissolution,varname:node_3261,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-9239-OUT,B-1528-OUT;n:type:ShaderForge.SFN_TexCoord,id:3784,x:30859,y:33188,varname:node_3784,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_Set,id:4967,x:31160,y:33154,varname:Part_U,prsc:2|IN-3784-U;n:type:ShaderForge.SFN_Get,id:1528,x:31054,y:34366,varname:node_1528,prsc:2|IN-4967-OUT;n:type:ShaderForge.SFN_TexCoord,id:2956,x:30651,y:32762,varname:node_2956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_VertexColor,id:9977,x:30859,y:32988,varname:node_9977,prsc:2;n:type:ShaderForge.SFN_Set,id:295,x:31073,y:33024,varname:Vertex_A,prsc:2|IN-9977-A;n:type:ShaderForge.SFN_Get,id:2417,x:33802,y:33838,varname:node_2417,prsc:2|IN-295-OUT;n:type:ShaderForge.SFN_Set,id:1552,x:31073,y:32930,varname:Vertex_Color,prsc:2|IN-9977-RGB;n:type:ShaderForge.SFN_Multiply,id:6749,x:34682,y:32976,varname:node_6749,prsc:2|A-7092-OUT,B-1708-OUT;n:type:ShaderForge.SFN_Get,id:1708,x:34429,y:32996,varname:node_1708,prsc:2|IN-1552-OUT;n:type:ShaderForge.SFN_Set,id:4347,x:31160,y:33216,varname:Part_V,prsc:2|IN-3784-V;n:type:ShaderForge.SFN_Set,id:2271,x:31160,y:33276,varname:Part_Z,prsc:2|IN-3784-Z;n:type:ShaderForge.SFN_Set,id:9307,x:31160,y:33329,varname:Part_W,prsc:2|IN-3784-W;n:type:ShaderForge.SFN_TexCoord,id:612,x:31676,y:32037,varname:node_612,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:939,x:32306,y:32070,varname:node_939,prsc:2|A-3395-OUT,B-6168-OUT;n:type:ShaderForge.SFN_Add,id:6168,x:32066,y:32148,varname:node_6168,prsc:2|A-612-V,B-3168-OUT;n:type:ShaderForge.SFN_Add,id:3395,x:32066,y:31988,varname:node_3395,prsc:2|A-2418-OUT,B-612-U;n:type:ShaderForge.SFN_Set,id:6076,x:32611,y:32070,varname:Main_Move_UV,prsc:2|IN-939-OUT;n:type:ShaderForge.SFN_Get,id:3168,x:31818,y:32238,varname:node_3168,prsc:2|IN-2271-OUT;n:type:ShaderForge.SFN_Get,id:2418,x:31823,y:31926,varname:node_2418,prsc:2|IN-9307-OUT;n:type:ShaderForge.SFN_Get,id:3387,x:30619,y:32655,varname:node_3387,prsc:2|IN-6076-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:307,x:30870,y:32705,ptovrint:False,ptlb:Part_Mian_Flow,ptin:_Part_Mian_Flow,varname:node_307,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-2956-UVOUT,B-3387-OUT;proporder:6802-4462-800-307-3549-12-7694-4418-2697-8302-7293-9502-9239-673-1231-7236-3261;pass:END;sub:END;*/

Shader "Fx/Distort/Model_Blend_Mask_Gradual_Inside" {
    Properties {
        _Main_Tex ("Main_Tex", 2D) = "white" {}
        [HDR]_Main_Color ("Main_Color", Color) = (1,1,1,1)
        _Main_Strength ("Main_Strength", Float ) = 1
        [MaterialToggle] _Part_Mian_Flow ("Part_Mian_Flow", Float ) = 0
        _Dissolution_Tex ("Dissolution_Tex", 2D) = "white" {}
        _Noise_Flow_U ("Noise_Flow_U", Float ) = 0
        _Noise_Flow_V ("Noise_Flow_V", Float ) = 0
        _Dissolution_Mask ("Dissolution_Mask", 2D) = "white" {}
        [HDR]_Edge_Coor ("Edge_Coor", Color) = (0.5019608,0.5019608,0.5019608,1)
        _Edge_Inside_Glow ("Edge_Inside_Glow", Range(0, 0.1)) = 0
        _Edge_Inside_Blend ("Edge_Inside_Blend", Range(0, 1)) = 0
        _Dissolution_Power ("Dissolution_Power", Range(0.1, 5)) = 0.1
        _Dissolution_Strength ("Dissolution_Strength", Range(-1, 1.2)) = 0.7504762
        [MaterialToggle] _Dissolution_Gradual ("Dissolution_Gradual", Float ) = 0
        _Gradual_Rotator ("Gradual_Rotator", Float ) = 0
        _Gradual_Power ("Gradual_Power", Float ) = 5
        [MaterialToggle] _Part_Dissolution ("Part_Dissolution", Float ) = 0
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
            ZTest Less
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
            uniform sampler2D _Dissolution_Tex; uniform float4 _Dissolution_Tex_ST;
            uniform float _Edge_Inside_Glow;
            uniform float _Dissolution_Power;
            uniform float _Noise_Flow_U;
            uniform float _Noise_Flow_V;
            uniform float4 _Edge_Coor;
            uniform float _Edge_Inside_Blend;
            uniform float4 _Main_Color;
            uniform float _Main_Strength;
            uniform float _Dissolution_Strength;
            uniform sampler2D _Dissolution_Mask; uniform float4 _Dissolution_Mask_ST;
            uniform fixed _Dissolution_Gradual;
            uniform float _Gradual_Rotator;
            uniform float _Gradual_Power;
            uniform fixed _Part_Dissolution;
            uniform fixed _Part_Mian_Flow;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
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
                float4 node_8650 = _Time + _TimeEditor;
                float2 node_7670 = float2(((_Noise_Flow_U*node_8650.g)+i.uv0.r),(i.uv0.g+(node_8650.g*_Noise_Flow_V)));
                float4 _Dissolution_Tex_var = tex2D(_Dissolution_Tex,TRANSFORM_TEX(node_7670, _Dissolution_Tex));
                float Noise_Group = _Dissolution_Tex_var.r;
                float4 _Dissolution_Mask_var = tex2D(_Dissolution_Mask,TRANSFORM_TEX(i.uv0, _Dissolution_Mask));
                float Part_U = i.uv1.r;
                float _Part_Dissolution_var = lerp( _Dissolution_Strength, Part_U, _Part_Dissolution );
                float node_4778_ang = _Gradual_Rotator;
                float node_4778_spd = 1.0;
                float node_4778_cos = cos(node_4778_spd*node_4778_ang);
                float node_4778_sin = sin(node_4778_spd*node_4778_ang);
                float2 node_4778_piv = float2(0.5,0.5);
                float2 node_4778 = (mul(i.uv0-node_4778_piv,float2x2( node_4778_cos, -node_4778_sin, node_4778_sin, node_4778_cos))+node_4778_piv);
                float Diss_Group = (_Dissolution_Mask_var.r*lerp( _Part_Dissolution_var, pow(((1.0 - node_4778).g+_Part_Dissolution_var),_Gradual_Power), _Dissolution_Gradual ));
                clip(step(Noise_Group,Diss_Group) - 0.5);
////// Lighting:
                float node_6783 = (Diss_Group-Noise_Group);
                float node_9180 = lerp((_Edge_Inside_Glow/(0.08+node_6783)),(_Edge_Inside_Glow/(Noise_Group-Diss_Group)),_Edge_Inside_Blend);
                float Part_W = i.uv1.a;
                float Part_Z = i.uv1.b;
                float2 Main_Move_UV = float2((Part_W+i.uv0.r),(i.uv0.g+Part_Z));
                float2 _Part_Mian_Flow_var = lerp( i.uv0, Main_Move_UV, _Part_Mian_Flow );
                float4 _Main_Tex_var = tex2D(_Main_Tex,TRANSFORM_TEX(_Part_Mian_Flow_var, _Main_Tex));
                float3 Main_Group = (_Main_Color.rgb*_Main_Strength*_Main_Tex_var.rgb);
                float3 Vertex_Color = i.vertexColor.rgb;

                float3 finalColor = ((lerp((_Edge_Coor.rgb*node_9180),((1.0 - _Edge_Coor.rgb)*node_9180),_Edge_Inside_Blend)+Main_Group)*Vertex_Color);
                finalColor = max(finalColor, float3(0,0,0));

                float Main_A = _Main_Color.a;
                float node_742 = pow(node_6783,_Dissolution_Power);
                float Vertex_A = i.vertexColor.a;

                return float4(finalColor, max(0, Main_A*saturate((node_742+node_742))*Vertex_A));
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
