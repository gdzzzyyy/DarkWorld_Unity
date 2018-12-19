// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:Mobile/Particles/Additive,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3058824,fgcg:0.3058824,fgcb:0.3058824,fgca:1,fgde:0.015,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:7142,x:33498,y:31279,varname:node_7142,prsc:2|emission-8989-OUT,clip-1673-OUT;n:type:ShaderForge.SFN_Tex2d,id:8312,x:31340,y:32005,ptovrint:False,ptlb:Main_Tex,ptin:_Main_Tex,varname:_MainTex,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bae8a530029e17a46b7c52e785f6c153,ntxv:0,isnm:False|UVIN-1494-OUT;n:type:ShaderForge.SFN_Multiply,id:7400,x:31665,y:31815,varname:node_7400,prsc:1|A-4901-RGB,B-8312-RGB,C-5153-OUT;n:type:ShaderForge.SFN_Color,id:4901,x:31340,y:31799,ptovrint:False,ptlb:Main_Color,ptin:_Main_Color,varname:_MainColor,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8994,x:31665,y:32065,varname:node_8994,prsc:1|A-4901-A,B-8312-A;n:type:ShaderForge.SFN_If,id:315,x:31331,y:32659,varname:node_315,prsc:1|A-5763-R,B-4439-OUT,GT-3746-OUT,EQ-3746-OUT,LT-6639-OUT;n:type:ShaderForge.SFN_If,id:8628,x:31331,y:32855,varname:node_8628,prsc:2|A-5763-R,B-303-OUT,GT-3746-OUT,EQ-3746-OUT,LT-6639-OUT;n:type:ShaderForge.SFN_Vector1,id:3746,x:31054,y:32764,varname:Clip_Max_Color,prsc:1,v1:1;n:type:ShaderForge.SFN_Vector1,id:6639,x:31054,y:32849,varname:Clip_Min_Color,prsc:1,v1:0;n:type:ShaderForge.SFN_Tex2d,id:5763,x:30574,y:32470,ptovrint:False,ptlb:Dissolve_Tex,ptin:_Dissolve_Tex,varname:_DissolveTex,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-4709-OUT;n:type:ShaderForge.SFN_Add,id:303,x:30870,y:32872,varname:node_303,prsc:2|A-4439-OUT,B-1502-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1502,x:30553,y:32891,ptovrint:False,ptlb:Dissolve_Edge_Sacle,ptin:_Dissolve_Edge_Sacle,varname:_Dissolve_Size,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Subtract,id:3052,x:31761,y:32489,varname:node_3052,prsc:1|A-315-OUT,B-8628-OUT;n:type:ShaderForge.SFN_Color,id:9107,x:32027,y:32567,ptovrint:False,ptlb:Dissolve_Edge_Color,ptin:_Dissolve_Edge_Color,varname:_Dissolve_Color,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5019608,c2:0.5019608,c3:0.5019608,c4:0.5019608;n:type:ShaderForge.SFN_Multiply,id:6500,x:32027,y:32380,varname:Dissolve_Mask,prsc:2|A-1689-OUT,B-3052-OUT;n:type:ShaderForge.SFN_Slider,id:1689,x:31683,y:32380,ptovrint:False,ptlb:Dissolve_Edge_Glow,ptin:_Dissolve_Edge_Glow,varname:_Dissolve_Intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Multiply,id:4300,x:32385,y:32380,varname:Final_Dissolve_Color,prsc:1|A-6500-OUT,B-9107-RGB,C-9083-OUT;n:type:ShaderForge.SFN_Multiply,id:9083,x:31993,y:32784,varname:node_9083,prsc:2|A-315-OUT,B-856-OUT;n:type:ShaderForge.SFN_Multiply,id:5093,x:32027,y:32995,varname:node_5093,prsc:2|A-8628-OUT,B-5164-OUT;n:type:ShaderForge.SFN_Multiply,id:1881,x:32285,y:31822,varname:Final_Tex_Color,prsc:1|A-7400-OUT,B-5093-OUT;n:type:ShaderForge.SFN_Set,id:3262,x:31891,y:32065,varname:MainTex_Alpha,prsc:1|IN-8994-OUT;n:type:ShaderForge.SFN_Get,id:856,x:31760,y:32803,varname:node_856,prsc:1|IN-3262-OUT;n:type:ShaderForge.SFN_Get,id:5164,x:31760,y:33010,varname:node_5164,prsc:1|IN-3262-OUT;n:type:ShaderForge.SFN_Set,id:3462,x:32357,y:32782,varname:Final_Clip,prsc:2|IN-9083-OUT;n:type:ShaderForge.SFN_Set,id:7364,x:32643,y:32380,varname:Final_Dissolve,prsc:1|IN-4300-OUT;n:type:ShaderForge.SFN_Set,id:7056,x:32560,y:31816,varname:Final_Tex,prsc:2|IN-1881-OUT;n:type:ShaderForge.SFN_VertexColor,id:9927,x:30750,y:31108,varname:node_9927,prsc:2;n:type:ShaderForge.SFN_Set,id:9766,x:30750,y:31257,varname:Vertex_Alpha,prsc:1|IN-9927-A;n:type:ShaderForge.SFN_ValueProperty,id:5153,x:31340,y:31675,ptovrint:False,ptlb:Main_Intensity,ptin:_Main_Intensity,varname:_MainTex_Intensity,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:8039,x:31013,y:31164,varname:node_8039,prsc:2,uv:0,uaff:True;n:type:ShaderForge.SFN_ComponentMask,id:987,x:31584,y:31302,varname:node_987,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-4175-OUT;n:type:ShaderForge.SFN_Rotator,id:9597,x:31304,y:31164,varname:node_9597,prsc:2|UVIN-8039-UVOUT,ANG-9615-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9615,x:31304,y:31342,ptovrint:False,ptlb:Mask_Rotator,ptin:_Mask_Rotator,varname:node_9615,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Power,id:3994,x:32114,y:31302,varname:node_3994,prsc:2|VAL-6968-OUT,EXP-3602-OUT;n:type:ShaderForge.SFN_OneMinus,id:4175,x:31584,y:31165,varname:node_4175,prsc:2|IN-9597-UVOUT;n:type:ShaderForge.SFN_Set,id:2885,x:32588,y:31303,varname:Mask_N,prsc:2|IN-8217-OUT;n:type:ShaderForge.SFN_Get,id:4439,x:30553,y:32692,varname:node_4439,prsc:2|IN-2885-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3602,x:32114,y:31466,ptovrint:False,ptlb:Mask_Power,ptin:_Mask_Power,varname:node_3602,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Add,id:6968,x:31851,y:31304,varname:node_6968,prsc:2|A-987-OUT,B-7319-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4441,x:31661,y:31523,ptovrint:False,ptlb:Mask_Dissolve,ptin:_Mask_Dissolve,varname:node_4441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:8217,x:32323,y:31302,varname:node_8217,prsc:2|IN-3994-OUT;n:type:ShaderForge.SFN_TexCoord,id:1962,x:31661,y:31590,varname:node_1962,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_TexCoord,id:671,x:28708,y:32442,varname:node_671,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:346,x:29335,y:32464,varname:node_346,prsc:2|A-2036-OUT,B-8267-OUT;n:type:ShaderForge.SFN_Add,id:8267,x:29098,y:32553,varname:node_8267,prsc:2|A-671-V,B-6643-OUT;n:type:ShaderForge.SFN_Add,id:2036,x:29098,y:32393,varname:node_2036,prsc:2|A-4310-OUT,B-671-U;n:type:ShaderForge.SFN_Multiply,id:6643,x:29098,y:32690,varname:node_6643,prsc:2|A-9713-T,B-2316-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3345,x:29098,y:32181,ptovrint:False,ptlb:Dissolve_Flow_U,ptin:_Dissolve_Flow_U,varname:_Min_Flow_U_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2316,x:29098,y:32850,ptovrint:False,ptlb:Dissolve_Flow_V,ptin:_Dissolve_Flow_V,varname:_Min_Flow_V_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:9713,x:28708,y:32598,varname:node_9713,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4310,x:29098,y:32262,varname:node_4310,prsc:2|A-3345-OUT,B-9713-T;n:type:ShaderForge.SFN_Set,id:1536,x:29580,y:32464,varname:Dissolve_UV,prsc:2|IN-346-OUT;n:type:ShaderForge.SFN_Get,id:4709,x:30355,y:32470,varname:node_4709,prsc:2|IN-1536-OUT;n:type:ShaderForge.SFN_Get,id:1673,x:33088,y:31834,varname:node_1673,prsc:2|IN-3462-OUT;n:type:ShaderForge.SFN_Add,id:8989,x:33288,y:31377,varname:node_8989,prsc:2|A-6179-OUT,B-4521-OUT;n:type:ShaderForge.SFN_Get,id:6179,x:33092,y:31353,varname:node_6179,prsc:2|IN-7056-OUT;n:type:ShaderForge.SFN_Get,id:4521,x:33092,y:31413,varname:node_4521,prsc:2|IN-7364-OUT;n:type:ShaderForge.SFN_TexCoord,id:9690,x:28588,y:31721,varname:node_9690,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:7037,x:29215,y:31743,varname:node_7037,prsc:2|A-387-OUT,B-3769-OUT;n:type:ShaderForge.SFN_Add,id:3769,x:28978,y:31832,varname:node_3769,prsc:2|A-9690-V,B-6283-OUT;n:type:ShaderForge.SFN_Add,id:387,x:28978,y:31672,varname:node_387,prsc:2|A-3339-OUT,B-9690-U;n:type:ShaderForge.SFN_Multiply,id:6283,x:28978,y:31969,varname:node_6283,prsc:2|A-5503-T,B-2117-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8980,x:28978,y:31460,ptovrint:False,ptlb:Main_Flow_U,ptin:_Main_Flow_U,varname:_Dissolve_Flow_U_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Time,id:5503,x:28588,y:31877,varname:node_5503,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3339,x:28978,y:31541,varname:node_3339,prsc:2|A-8980-OUT,B-5503-T;n:type:ShaderForge.SFN_Set,id:5543,x:29460,y:31743,varname:Main_UV,prsc:2|IN-7037-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2117,x:28978,y:32129,ptovrint:False,ptlb:Main_Flow_V,ptin:_Main_Flow_V,varname:_Dissolve_Flow_V_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Get,id:1494,x:30867,y:31986,varname:node_1494,prsc:2|IN-5543-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:7319,x:31851,y:31554,ptovrint:False,ptlb:Dissolve_Part,ptin:_Dissolve_Part,varname:node_7319,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-4441-OUT,B-1962-U;proporder:8312-4901-5153-8980-2117-5763-1502-9107-1689-9615-3602-4441-3345-2316-7319;pass:END;sub:END;*/

Shader "Fx/Distort/Model_Add_Mask_Gradual" {
    Properties {
        _Main_Tex ("Main_Tex", 2D) = "white" {}
        _Main_Color ("Main_Color", Color) = (1,1,1,1)
        _Main_Intensity ("Main_Intensity", Float ) = 1
        _Main_Flow_U ("Main_Flow_U", Float ) = 0
        _Main_Flow_V ("Main_Flow_V", Float ) = 0
        _Dissolve_Tex ("Dissolve_Tex", 2D) = "white" {}
        _Dissolve_Edge_Sacle ("Dissolve_Edge_Sacle", Float ) = 0.1
        _Dissolve_Edge_Color ("Dissolve_Edge_Color", Color) = (0.5019608,0.5019608,0.5019608,0.5019608)
        _Dissolve_Edge_Glow ("Dissolve_Edge_Glow", Range(0, 2)) = 0
        _Mask_Rotator ("Mask_Rotator", Float ) = 0
        _Mask_Power ("Mask_Power", Float ) = 5
        _Mask_Dissolve ("Mask_Dissolve", Float ) = 0.5
        _Dissolve_Flow_U ("Dissolve_Flow_U", Float ) = 0
        _Dissolve_Flow_V ("Dissolve_Flow_V", Float ) = 0
        [MaterialToggle] _Dissolve_Part ("Dissolve_Part", Float ) = 0.5
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
            uniform fixed4 _Main_Color;
            uniform sampler2D _Dissolve_Tex; uniform float4 _Dissolve_Tex_ST;
            uniform half _Dissolve_Edge_Sacle;
            uniform fixed4 _Dissolve_Edge_Color;
            uniform fixed _Dissolve_Edge_Glow;
            uniform half _Main_Intensity;
            uniform float _Mask_Rotator;
            uniform float _Mask_Power;
            uniform float _Mask_Dissolve;
            uniform float _Dissolve_Flow_U;
            uniform float _Dissolve_Flow_V;
            uniform float _Main_Flow_U;
            uniform float _Main_Flow_V;
            uniform fixed _Dissolve_Part;
            struct VertexInput {
                float4 vertex : POSITION;
                float4 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
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
                float4 node_9713 = _Time + _TimeEditor;
                float2 Dissolve_UV = float2(((_Dissolve_Flow_U*node_9713.g)+i.uv0.r),(i.uv0.g+(node_9713.g*_Dissolve_Flow_V)));
                float2 node_4709 = Dissolve_UV;
                half4 _Dissolve_Tex_var = tex2D(_Dissolve_Tex,TRANSFORM_TEX(node_4709, _Dissolve_Tex));
                float node_9597_ang = _Mask_Rotator;
                float node_9597_spd = 1.0;
                float node_9597_cos = cos(node_9597_spd*node_9597_ang);
                float node_9597_sin = sin(node_9597_spd*node_9597_ang);
                float2 node_9597_piv = float2(0.5,0.5);
                float2 node_9597 = (mul(i.uv0-node_9597_piv,float2x2( node_9597_cos, -node_9597_sin, node_9597_sin, node_9597_cos))+node_9597_piv);
                float Mask_N = (1.0 - pow(((1.0 - node_9597).g+lerp( _Mask_Dissolve, i.uv1.r, _Dissolve_Part )),_Mask_Power));
                float node_4439 = Mask_N;
                float node_315_if_leA = step(_Dissolve_Tex_var.r,node_4439);
                float node_315_if_leB = step(node_4439,_Dissolve_Tex_var.r);
                half Clip_Min_Color = 0.0;
                half Clip_Max_Color = 1.0;
                half node_315 = lerp((node_315_if_leA*Clip_Min_Color)+(node_315_if_leB*Clip_Max_Color),Clip_Max_Color,node_315_if_leA*node_315_if_leB);
                float4 node_5503 = _Time + _TimeEditor;
                float2 Main_UV = float2(((_Main_Flow_U*node_5503.g)+i.uv0.r),(i.uv0.g+(node_5503.g*_Main_Flow_V)));
                float2 node_1494 = Main_UV;
                half4 _Main_Tex_var = tex2D(_Main_Tex,TRANSFORM_TEX(node_1494, _Main_Tex));
                half MainTex_Alpha = (_Main_Color.a*_Main_Tex_var.a);
                float node_9083 = (node_315*MainTex_Alpha);
                float Final_Clip = node_9083;
                clip(Final_Clip - 0.5);
////// Lighting:
////// Emissive:
                float node_8628_if_leA = step(_Dissolve_Tex_var.r,(node_4439+_Dissolve_Edge_Sacle));
                float node_8628_if_leB = step((node_4439+_Dissolve_Edge_Sacle),_Dissolve_Tex_var.r);
                float node_8628 = lerp((node_8628_if_leA*Clip_Min_Color)+(node_8628_if_leB*Clip_Max_Color),Clip_Max_Color,node_8628_if_leA*node_8628_if_leB);
                float3 Final_Tex = ((_Main_Color.rgb*_Main_Tex_var.rgb*_Main_Intensity)*(node_8628*MainTex_Alpha));
                half3 Final_Dissolve = ((_Dissolve_Edge_Glow*(node_315-node_8628))*_Dissolve_Edge_Color.rgb*node_9083);

                float3 emissive = (Final_Tex+Final_Dissolve);
                float3 finalColor = max(emissive, float3(0,0,0));

                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Mobile/Particles/Additive"
    CustomEditor "ShaderForgeMaterialInspector"
}
