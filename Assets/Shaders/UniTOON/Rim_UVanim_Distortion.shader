// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.36 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.36;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:True,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:35420,y:32516,varname:node_3138,prsc:2|emission-7019-OUT,alpha-3646-OUT;n:type:ShaderForge.SFN_Fresnel,id:3699,x:32254,y:32764,varname:node_3699,prsc:2|EXP-8568-OUT;n:type:ShaderForge.SFN_Slider,id:8568,x:31796,y:32783,ptovrint:False,ptlb:Rin_Width,ptin:_Rin_Width,varname:_FFF,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.362716,max:20;n:type:ShaderForge.SFN_Tex2d,id:7610,x:31338,y:32388,ptovrint:False,ptlb:Min_Texture,ptin:_Min_Texture,varname:_Min,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-412-OUT;n:type:ShaderForge.SFN_Multiply,id:3522,x:33983,y:32454,varname:node_3522,prsc:2|A-722-RGB,B-4845-RGB,C-1367-OUT;n:type:ShaderForge.SFN_Color,id:4845,x:33480,y:32671,ptovrint:False,ptlb:color,ptin:_color,varname:_node_4845,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Append,id:9203,x:32544,y:33516,varname:node_9203,prsc:1|A-8635-OUT,B-883-OUT;n:type:ShaderForge.SFN_Add,id:883,x:32287,y:33622,varname:node_883,prsc:2|A-14-V,B-416-OUT;n:type:ShaderForge.SFN_TexCoord,id:14,x:31817,y:33511,varname:node_14,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8635,x:32287,y:33470,varname:node_8635,prsc:2|A-14-U,B-1671-OUT;n:type:ShaderForge.SFN_Multiply,id:416,x:32287,y:33760,varname:node_416,prsc:2|A-971-T,B-8328-OUT;n:type:ShaderForge.SFN_Time,id:971,x:31817,y:33730,varname:node_971,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1671,x:32287,y:33329,varname:node_1671,prsc:2|A-2968-OUT,B-971-T;n:type:ShaderForge.SFN_ValueProperty,id:2968,x:32287,y:33252,ptovrint:False,ptlb:Distortion_Flow_U,ptin:_Distortion_Flow_U,varname:_AU,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:2722,x:29550,y:31792,varname:node_2722,prsc:2|A-4496-UVOUT,B-736-OUT;n:type:ShaderForge.SFN_TexCoord,id:4496,x:29308,y:31721,varname:node_4496,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ValueProperty,id:8328,x:32287,y:33920,ptovrint:False,ptlb:Distortion_Flow_V,ptin:_Distortion_Flow_V,varname:_AV,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:7634,x:29756,y:31792,ptovrint:False,ptlb:Distortion_Texture,ptin:_Distortion_Texture,varname:_NOISE,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2722-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8741,x:29986,y:31792,varname:node_8741,prsc:2,cc1:0,cc2:0,cc3:-1,cc4:-1|IN-7634-RGB;n:type:ShaderForge.SFN_TexCoord,id:3779,x:30026,y:32218,varname:node_3779,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:5557,x:30229,y:32218,varname:node_5557,prsc:2,spu:0,spv:0|UVIN-3779-UVOUT;n:type:ShaderForge.SFN_Add,id:6046,x:30491,y:32068,varname:node_6046,prsc:2|A-7491-OUT,B-5557-UVOUT;n:type:ShaderForge.SFN_Multiply,id:7491,x:30229,y:31886,varname:node_7491,prsc:2|A-8741-OUT,B-3490-OUT;n:type:ShaderForge.SFN_Slider,id:3490,x:29829,y:32011,ptovrint:False,ptlb:Distortion_Strength,ptin:_Distortion_Strength,varname:_666,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:5147,x:32911,y:32524,varname:node_5147,prsc:2|A-8595-OUT,B-8215-OUT;n:type:ShaderForge.SFN_Multiply,id:8215,x:32598,y:32763,varname:node_8215,prsc:2|A-3699-OUT,B-4879-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4879,x:32598,y:32938,ptovrint:False,ptlb:Rin_Strength,ptin:_Rin_Strength,varname:_FC,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_OneMinus,id:8979,x:31710,y:32404,varname:node_8979,prsc:2|IN-7610-R;n:type:ShaderForge.SFN_Multiply,id:8595,x:32128,y:32186,varname:node_8595,prsc:2|A-4825-OUT,B-8979-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1945,x:31566,y:31831,ptovrint:False,ptlb:Min_Contrast,ptin:_Min_Contrast,varname:node_1945,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:4825,x:32128,y:32021,varname:node_4825,prsc:2|VAL-8979-OUT,EXP-7357-OUT;n:type:ShaderForge.SFN_OneMinus,id:7357,x:31566,y:31946,varname:node_7357,prsc:2|IN-1945-OUT;n:type:ShaderForge.SFN_Append,id:6924,x:31345,y:33557,varname:node_6924,prsc:1|A-8826-OUT,B-6011-OUT;n:type:ShaderForge.SFN_Add,id:6011,x:30982,y:33675,varname:node_6011,prsc:2|A-9084-V,B-2394-OUT;n:type:ShaderForge.SFN_TexCoord,id:9084,x:30566,y:33496,varname:node_9084,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8826,x:30982,y:33523,varname:node_8826,prsc:2|A-9084-U,B-9308-OUT;n:type:ShaderForge.SFN_Multiply,id:2394,x:30982,y:33813,varname:node_2394,prsc:2|A-5509-T,B-1049-OUT;n:type:ShaderForge.SFN_Time,id:5509,x:30566,y:33680,varname:node_5509,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9308,x:30982,y:33382,varname:node_9308,prsc:2|A-8066-OUT,B-5509-T;n:type:ShaderForge.SFN_ValueProperty,id:8066,x:30982,y:33305,ptovrint:False,ptlb:Min_Flow_U,ptin:_Min_Flow_U,varname:_AU_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:1049,x:30982,y:33981,ptovrint:False,ptlb:Min_Flow_V,ptin:_Min_Flow_V,varname:_AV_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Add,id:3934,x:30805,y:32199,varname:node_3934,prsc:2|A-6212-OUT,B-6046-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:3646,x:34109,y:32962,ptovrint:False,ptlb:Subtract,ptin:_Subtract,varname:node_6709,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-722-A,B-8363-OUT;n:type:ShaderForge.SFN_Multiply,id:8363,x:33884,y:32962,varname:node_8363,prsc:2|A-4845-A,B-1367-OUT,C-722-A;n:type:ShaderForge.SFN_Get,id:736,x:29287,y:31916,varname:node_736,prsc:2|IN-7107-OUT;n:type:ShaderForge.SFN_Set,id:7107,x:32778,y:33516,varname:Distortion,prsc:2|IN-9203-OUT;n:type:ShaderForge.SFN_Set,id:1011,x:31587,y:33557,varname:Min,prsc:2|IN-6924-OUT;n:type:ShaderForge.SFN_Get,id:6212,x:30794,y:32114,varname:node_6212,prsc:2|IN-1011-OUT;n:type:ShaderForge.SFN_VertexColor,id:722,x:33480,y:32871,varname:node_722,prsc:2;n:type:ShaderForge.SFN_Append,id:2771,x:30494,y:32715,varname:node_2771,prsc:1|A-2533-OUT,B-8882-OUT;n:type:ShaderForge.SFN_Add,id:8882,x:30210,y:32791,varname:node_8882,prsc:2|A-4406-V,B-8097-OUT;n:type:ShaderForge.SFN_TexCoord,id:4406,x:29797,y:32693,varname:node_4406,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:2533,x:30210,y:32639,varname:node_2533,prsc:2|A-2392-OUT,B-4406-U;n:type:ShaderForge.SFN_TexCoord,id:9737,x:33095,y:33482,varname:node_9737,prsc:2,uv:2,uaff:True;n:type:ShaderForge.SFN_SwitchProperty,id:412,x:31088,y:32388,ptovrint:False,ptlb:Part_Min_Flow,ptin:_Part_Min_Flow,varname:_Subtract_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3934-OUT,B-7504-OUT;n:type:ShaderForge.SFN_Add,id:7504,x:30806,y:32534,varname:node_7504,prsc:2|A-6046-OUT,B-2771-OUT;n:type:ShaderForge.SFN_Set,id:6137,x:33345,y:33439,varname:Min_u,prsc:2|IN-9737-U;n:type:ShaderForge.SFN_Set,id:2261,x:33345,y:33504,varname:Min_v,prsc:2|IN-9737-V;n:type:ShaderForge.SFN_Set,id:4778,x:33345,y:33571,varname:Mask_u,prsc:2|IN-9737-Z;n:type:ShaderForge.SFN_Set,id:3115,x:33345,y:33635,varname:Mask_v,prsc:2|IN-9737-W;n:type:ShaderForge.SFN_Get,id:2392,x:30189,y:32578,varname:node_2392,prsc:2|IN-6137-OUT;n:type:ShaderForge.SFN_Get,id:8097,x:30189,y:32925,varname:node_8097,prsc:2|IN-2261-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:1367,x:33327,y:32381,ptovrint:False,ptlb:Fresnel_reverse,ptin:_Fresnel_reverse,varname:_Min_uv_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-8130-OUT,B-1734-OUT;n:type:ShaderForge.SFN_Add,id:293,x:32911,y:32244,varname:node_293,prsc:2|A-1290-OUT,B-8215-OUT;n:type:ShaderForge.SFN_Multiply,id:1290,x:32139,y:31839,varname:node_1290,prsc:2|A-7301-OUT,B-7610-R;n:type:ShaderForge.SFN_Power,id:7301,x:32139,y:31621,varname:node_7301,prsc:2|VAL-1945-OUT,EXP-7357-OUT;n:type:ShaderForge.SFN_Append,id:1455,x:33596,y:31764,varname:node_1455,prsc:1|A-6985-OUT,B-6072-OUT;n:type:ShaderForge.SFN_Add,id:6072,x:33312,y:31840,varname:node_6072,prsc:2|A-5652-V,B-6123-OUT;n:type:ShaderForge.SFN_TexCoord,id:5652,x:32899,y:31742,varname:node_5652,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:6985,x:33312,y:31688,varname:node_6985,prsc:2|A-4524-OUT,B-5652-U;n:type:ShaderForge.SFN_Get,id:4524,x:33291,y:31627,varname:node_4524,prsc:2|IN-4778-OUT;n:type:ShaderForge.SFN_Get,id:6123,x:33291,y:31975,varname:node_6123,prsc:2|IN-3115-OUT;n:type:ShaderForge.SFN_Tex2d,id:2631,x:33982,y:31757,ptovrint:False,ptlb:Mask_Texture,ptin:_Mask_Texture,varname:node_5690,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-9697-OUT;n:type:ShaderForge.SFN_Multiply,id:6092,x:34349,y:32071,varname:node_6092,prsc:2|A-3267-OUT,B-3522-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:7019,x:34645,y:32210,ptovrint:False,ptlb:Mask,ptin:_Mask,varname:node_7019,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3522-OUT,B-6092-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5225,x:34304,y:31616,ptovrint:False,ptlb:Mask_Contrast,ptin:_Mask_Contrast,varname:node_5225,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Power,id:3267,x:34304,y:31683,varname:node_3267,prsc:2|VAL-2631-RGB,EXP-5225-OUT;n:type:ShaderForge.SFN_Multiply,id:8130,x:33111,y:32297,varname:node_8130,prsc:2|A-293-OUT,B-7427-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7427,x:32911,y:32409,ptovrint:False,ptlb:Min_Strength,ptin:_Min_Strength,varname:node_7427,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1734,x:33111,y:32453,varname:node_1734,prsc:2|A-7427-OUT,B-5147-OUT;n:type:ShaderForge.SFN_Append,id:6399,x:32547,y:34399,varname:node_6399,prsc:1|A-4751-OUT,B-1654-OUT;n:type:ShaderForge.SFN_Add,id:1654,x:32290,y:34505,varname:node_1654,prsc:2|A-8576-V,B-9739-OUT;n:type:ShaderForge.SFN_TexCoord,id:8576,x:31820,y:34394,varname:node_8576,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:4751,x:32290,y:34353,varname:node_4751,prsc:2|A-8576-U,B-5300-OUT;n:type:ShaderForge.SFN_Multiply,id:9739,x:32290,y:34643,varname:node_9739,prsc:2|A-9580-T,B-5031-OUT;n:type:ShaderForge.SFN_Time,id:9580,x:31820,y:34613,varname:node_9580,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5300,x:32290,y:34212,varname:node_5300,prsc:2|A-3168-OUT,B-9580-T;n:type:ShaderForge.SFN_ValueProperty,id:3168,x:32290,y:34135,ptovrint:False,ptlb:Mask_Flow_U,ptin:_Mask_Flow_U,varname:_Distortion_U_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:5031,x:32290,y:34803,ptovrint:False,ptlb:Mask_Flow_V,ptin:_Mask_Flow_V,varname:_Distortion_V_speed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Set,id:9275,x:32781,y:34399,varname:MASK,prsc:2|IN-6399-OUT;n:type:ShaderForge.SFN_Get,id:7154,x:33675,y:31510,varname:node_7154,prsc:2|IN-9275-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:9697,x:33942,y:31508,ptovrint:False,ptlb:Part_Mask_Flow,ptin:_Part_Mask_Flow,varname:node_9697,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-7154-OUT,B-1455-OUT;n:type:ShaderForge.SFN_TexCoord,id:7537,x:31948,y:34522,varname:node_7537,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:4098,x:32012,y:34586,varname:node_4098,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:809,x:32076,y:34650,varname:node_809,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_TexCoord,id:690,x:32140,y:34714,varname:node_690,prsc:2,uv:0,uaff:False;proporder:4845-7610-7427-1945-8066-1049-412-7634-3490-2968-8328-2631-5225-7019-9697-3168-5031-8568-4879-3646-1367;pass:END;sub:END;*/

Shader "Fx/Rim/Rim_UVanim_Distortion" {
    Properties {
        _color ("color", Color) = (0.5,0.5,0.5,1)
        _Min_Texture ("Min_Texture", 2D) = "white" {}
        _Min_Strength ("Min_Strength", Float ) = 1
        _Min_Contrast ("Min_Contrast", Float ) = 1
        _Min_Flow_U ("Min_Flow_U", Float ) = 0
        _Min_Flow_V ("Min_Flow_V", Float ) = 0
        [MaterialToggle] _Part_Min_Flow ("Part_Min_Flow", Float ) = 0
        _Distortion_Texture ("Distortion_Texture", 2D) = "white" {}
        _Distortion_Strength ("Distortion_Strength", Range(0, 1)) = 0
        _Distortion_Flow_U ("Distortion_Flow_U", Float ) = 0
        _Distortion_Flow_V ("Distortion_Flow_V", Float ) = 0
        _Mask_Texture ("Mask_Texture", 2D) = "white" {}
        _Mask_Contrast ("Mask_Contrast", Float ) = 1
        [MaterialToggle] _Mask ("Mask", Float ) = 0
        [MaterialToggle] _Part_Mask_Flow ("Part_Mask_Flow", Float ) = 0
        _Mask_Flow_U ("Mask_Flow_U", Float ) = 0
        _Mask_Flow_V ("Mask_Flow_V", Float ) = 0
        _Rin_Width ("Rin_Width", Range(0, 20)) = 2.362716
        _Rin_Strength ("Rin_Strength", Float ) = 1
        [MaterialToggle] _Subtract ("Subtract", Float ) = 0
        [MaterialToggle] _Fresnel_reverse ("Fresnel_reverse", Float ) = 0
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
            Blend One One
            Cull Off
            ZWrite Off
            
            AlphaToMask On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Rin_Width;
            uniform sampler2D _Min_Texture; uniform float4 _Min_Texture_ST;
            uniform float4 _color;
            uniform float _Distortion_Flow_U;
            uniform float _Distortion_Flow_V;
            uniform sampler2D _Distortion_Texture; uniform float4 _Distortion_Texture_ST;
            uniform float _Distortion_Strength;
            uniform float _Rin_Strength;
            uniform float _Min_Contrast;
            uniform float _Min_Flow_U;
            uniform float _Min_Flow_V;
            uniform fixed _Subtract;
            uniform fixed _Part_Min_Flow;
            uniform fixed _Fresnel_reverse;
            uniform sampler2D _Mask_Texture; uniform float4 _Mask_Texture_ST;
            uniform fixed _Mask;
            uniform float _Mask_Contrast;
            uniform float _Min_Strength;
            uniform float _Mask_Flow_U;
            uniform float _Mask_Flow_V;
            uniform fixed _Part_Mask_Flow;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float node_7357 = (1.0 - _Min_Contrast);
                float4 node_5509 = _Time + _TimeEditor;
                float2 Min = float2((i.uv0.r+(_Min_Flow_U*node_5509.g)),(i.uv0.g+(node_5509.g*_Min_Flow_V)));
                float4 node_971 = _Time + _TimeEditor;
                float2 Distortion = float2((i.uv0.r+(_Distortion_Flow_U*node_971.g)),(i.uv0.g+(node_971.g*_Distortion_Flow_V)));
                float2 node_2722 = (i.uv0+Distortion);
                float4 _Distortion_Texture_var = tex2D(_Distortion_Texture,TRANSFORM_TEX(node_2722, _Distortion_Texture));
                float4 node_7145 = _Time + _TimeEditor;
                float2 node_6046 = ((_Distortion_Texture_var.rgb.rr*_Distortion_Strength)+(i.uv0+node_7145.g*float2(0,0)));
                float Min_u = i.uv2.r;
                float Min_v = i.uv2.g;
                float2 _Part_Min_Flow_var = lerp( (Min+node_6046), (node_6046+float2((Min_u+i.uv0.r),(i.uv0.g+Min_v))), _Part_Min_Flow );
                float4 _Min_Texture_var = tex2D(_Min_Texture,TRANSFORM_TEX(_Part_Min_Flow_var, _Min_Texture));
                float node_8215 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_Rin_Width)*_Rin_Strength);
                float node_8979 = (1.0 - _Min_Texture_var.r);
                float _Fresnel_reverse_var = lerp( (((pow(_Min_Contrast,node_7357)*_Min_Texture_var.r)+node_8215)*_Min_Strength), (_Min_Strength*((pow(node_8979,node_7357)*node_8979)*node_8215)), _Fresnel_reverse );
                float3 node_3522 = (i.vertexColor.rgb*_color.rgb*_Fresnel_reverse_var);
                float4 node_9580 = _Time + _TimeEditor;
                float2 MASK = float2((i.uv0.r+(_Mask_Flow_U*node_9580.g)),(i.uv0.g+(node_9580.g*_Mask_Flow_V)));
                float Mask_u = i.uv2.b;
                float Mask_v = i.uv2.a;
                half2 node_1455 = float2((Mask_u+i.uv0.r),(i.uv0.g+Mask_v));
                float2 _Part_Mask_Flow_var = lerp( MASK, node_1455, _Part_Mask_Flow );
                float4 _Mask_Texture_var = tex2D(_Mask_Texture,TRANSFORM_TEX(_Part_Mask_Flow_var, _Mask_Texture));
                float3 emissive = lerp( node_3522, (pow(_Mask_Texture_var.rgb,_Mask_Contrast)*node_3522), _Mask );

                float3 finalColor = max(emissive, float3(0,0,0));

                return float4(finalColor,lerp( i.vertexColor.a, (_color.a*_Fresnel_reverse_var*i.vertexColor.a), _Subtract));
                /*
                return clamp(
                    fixed4(finalColor,lerp( i.vertexColor.a, (_color.a*_Fresnel_reverse_var*i.vertexColor.a), _Subtract)),
                    fixed4(0,0,0,0), fixed4(1,1,1,1));*/
            }
            ENDCG
        }
    }
    //FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
