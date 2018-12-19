// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:Mobile/Particles/Additive,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:False,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3058824,fgcg:0.3058824,fgcb:0.3058824,fgca:1,fgde:0.015,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:7142,x:33478,y:31246,varname:node_7142,prsc:2|emission-6584-OUT,custl-2733-OUT,alpha-5902-OUT,clip-8708-OUT;n:type:ShaderForge.SFN_Tex2d,id:8312,x:31340,y:32005,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:7400,x:31665,y:31815,varname:node_7400,prsc:1|A-4901-RGB,B-8312-RGB,C-5153-OUT;n:type:ShaderForge.SFN_Color,id:4901,x:31340,y:31799,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:_MainColor,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:8994,x:31665,y:32065,varname:node_8994,prsc:1|A-4901-A,B-8312-A;n:type:ShaderForge.SFN_If,id:315,x:31331,y:32659,varname:node_315,prsc:1|A-5763-R,B-4439-OUT,GT-3746-OUT,EQ-3746-OUT,LT-6639-OUT;n:type:ShaderForge.SFN_If,id:8628,x:31331,y:32855,varname:node_8628,prsc:2|A-5763-R,B-303-OUT,GT-3746-OUT,EQ-3746-OUT,LT-6639-OUT;n:type:ShaderForge.SFN_Vector1,id:3746,x:31054,y:32764,varname:Clip_Max_Color,prsc:1,v1:1;n:type:ShaderForge.SFN_Vector1,id:6639,x:31054,y:32849,varname:Clip_Min_Color,prsc:1,v1:0;n:type:ShaderForge.SFN_Tex2d,id:5763,x:30574,y:32470,ptovrint:False,ptlb:DissolveTex,ptin:_DissolveTex,varname:_DissolveTex,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:303,x:30870,y:32872,varname:node_303,prsc:2|A-4439-OUT,B-1502-OUT;n:type:ShaderForge.SFN_ValueProperty,id:1502,x:30553,y:32891,ptovrint:False,ptlb:Dissolve_Edge_Sacle,ptin:_Dissolve_Edge_Sacle,varname:_Dissolve_Size,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Subtract,id:3052,x:31761,y:32489,varname:node_3052,prsc:1|A-315-OUT,B-8628-OUT;n:type:ShaderForge.SFN_Color,id:9107,x:32027,y:32567,ptovrint:False,ptlb:Dissolve_Edge_Color,ptin:_Dissolve_Edge_Color,varname:_Dissolve_Color,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5019608,c2:0.5019608,c3:0.5019608,c4:0.5019608;n:type:ShaderForge.SFN_Multiply,id:6500,x:32027,y:32380,varname:Dissolve_Mask,prsc:2|A-1689-OUT,B-3052-OUT;n:type:ShaderForge.SFN_Slider,id:1689,x:31683,y:32380,ptovrint:False,ptlb:Dissolve_Edge_Glow,ptin:_Dissolve_Edge_Glow,varname:_Dissolve_Intensity,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Multiply,id:4300,x:32385,y:32380,varname:Final_Dissolve_Color,prsc:1|A-6500-OUT,B-9107-RGB,C-9083-OUT;n:type:ShaderForge.SFN_Multiply,id:9083,x:31993,y:32784,varname:node_9083,prsc:2|A-315-OUT,B-856-OUT;n:type:ShaderForge.SFN_Multiply,id:5093,x:32027,y:32995,varname:node_5093,prsc:2|A-8628-OUT,B-5164-OUT;n:type:ShaderForge.SFN_Multiply,id:1881,x:32376,y:31816,varname:Final_Tex_Color,prsc:1|A-7400-OUT,B-5093-OUT;n:type:ShaderForge.SFN_Set,id:3262,x:31891,y:32065,varname:MainTex_Alpha,prsc:1|IN-8994-OUT;n:type:ShaderForge.SFN_Get,id:856,x:31760,y:32803,varname:node_856,prsc:1|IN-3262-OUT;n:type:ShaderForge.SFN_Get,id:5164,x:31760,y:33010,varname:node_5164,prsc:1|IN-3262-OUT;n:type:ShaderForge.SFN_Set,id:3462,x:32357,y:32782,varname:Final_Clip,prsc:2|IN-9083-OUT;n:type:ShaderForge.SFN_Get,id:8708,x:33087,y:31715,varname:node_8708,prsc:2|IN-3462-OUT;n:type:ShaderForge.SFN_Set,id:7364,x:32575,y:32380,varname:Final_Dissolve,prsc:1|IN-4300-OUT;n:type:ShaderForge.SFN_Set,id:7056,x:32560,y:31816,varname:Final_Tex,prsc:2|IN-1881-OUT;n:type:ShaderForge.SFN_Add,id:2733,x:33108,y:31485,varname:node_2733,prsc:2|A-2357-OUT,B-7712-OUT;n:type:ShaderForge.SFN_Get,id:2357,x:32904,y:31471,varname:node_2357,prsc:2|IN-7364-OUT;n:type:ShaderForge.SFN_Get,id:7712,x:32904,y:31521,varname:node_7712,prsc:2|IN-7056-OUT;n:type:ShaderForge.SFN_VertexColor,id:9927,x:30750,y:31108,varname:node_9927,prsc:2;n:type:ShaderForge.SFN_Set,id:9766,x:30750,y:31257,varname:Vertex_Alpha,prsc:1|IN-9927-A;n:type:ShaderForge.SFN_Get,id:5902,x:33087,y:31635,varname:node_5902,prsc:2|IN-9766-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5153,x:31340,y:31675,ptovrint:False,ptlb:MainTex_Intensity,ptin:_MainTex_Intensity,varname:_MainTex_Intensity,prsc:1,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:7808,x:30367,y:31577,varname:node_7808,prsc:2|EXP-7069-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7069,x:30094,y:31597,ptovrint:False,ptlb:Rin_Widit,ptin:_Rin_Widit,varname:node_7069,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:3801,x:30649,y:31437,varname:node_3801,prsc:2|A-1847-RGB,B-8780-OUT,C-7808-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8780,x:30349,y:31396,ptovrint:False,ptlb:Rin_Strength,ptin:_Rin_Strength,varname:node_8780,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:1847,x:30349,y:31188,ptovrint:False,ptlb:Rin_Color,ptin:_Rin_Color,varname:node_1847,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Set,id:4684,x:30892,y:31437,varname:Rin,prsc:2|IN-3801-OUT;n:type:ShaderForge.SFN_Get,id:6584,x:33250,y:31346,varname:node_6584,prsc:2|IN-4684-OUT;n:type:ShaderForge.SFN_TexCoord,id:8039,x:31013,y:31164,varname:node_8039,prsc:2,uv:0,uaff:True;n:type:ShaderForge.SFN_Set,id:3115,x:31174,y:31531,varname:Part_Mask_Diss,prsc:2|IN-1962-U;n:type:ShaderForge.SFN_ComponentMask,id:987,x:31584,y:31302,varname:node_987,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-4175-OUT;n:type:ShaderForge.SFN_Rotator,id:9597,x:31304,y:31164,varname:node_9597,prsc:2|UVIN-8039-UVOUT,ANG-9615-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9615,x:31304,y:31342,ptovrint:False,ptlb:Mask_Rotator,ptin:_Mask_Rotator,varname:node_9615,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Power,id:3994,x:32114,y:31302,varname:node_3994,prsc:2|VAL-6968-OUT,EXP-3602-OUT;n:type:ShaderForge.SFN_OneMinus,id:4175,x:31584,y:31165,varname:node_4175,prsc:2|IN-9597-UVOUT;n:type:ShaderForge.SFN_Set,id:2885,x:32588,y:31303,varname:Mask_N,prsc:2|IN-8217-OUT;n:type:ShaderForge.SFN_Get,id:4439,x:30553,y:32692,varname:node_4439,prsc:2|IN-2885-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3602,x:32114,y:31466,ptovrint:False,ptlb:Mask_Power,ptin:_Mask_Power,varname:node_3602,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Add,id:6968,x:31851,y:31304,varname:node_6968,prsc:2|A-987-OUT,B-5017-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4441,x:31851,y:31069,ptovrint:False,ptlb:Mask_Dissolve,ptin:_Mask_Dissolve,varname:node_4441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_OneMinus,id:8217,x:32323,y:31302,varname:node_8217,prsc:2|IN-3994-OUT;n:type:ShaderForge.SFN_TexCoord,id:1962,x:30965,y:31604,varname:node_1962,prsc:2,uv:1,uaff:True;n:type:ShaderForge.SFN_SwitchProperty,id:5017,x:31851,y:31154,ptovrint:False,ptlb:Part_Mask_Disslove,ptin:_Part_Mask_Disslove,varname:node_5017,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-4441-OUT,B-8735-OUT;n:type:ShaderForge.SFN_Get,id:8735,x:31851,y:30912,varname:node_8735,prsc:2|IN-3115-OUT;proporder:4901-5153-8312-5763-1502-9107-1689-9615-3602-4441-5017-1847-7069-8780;pass:END;sub:END;*/

Shader "Fx/Distort/Dissolution_Blend_Mask_Gradual" {
    Properties {
        _MainColor ("MainColor", Color) = (1,1,1,1)
        _MainTex_Intensity ("MainTex_Intensity", Float ) = 1
        _MainTex ("MainTex", 2D) = "white" {}
        _DissolveTex ("DissolveTex", 2D) = "white" {}
        _Dissolve_Edge_Sacle ("Dissolve_Edge_Sacle", Float ) = 0.1
        _Dissolve_Edge_Color ("Dissolve_Edge_Color", Color) = (0.5019608,0.5019608,0.5019608,0.5019608)
        _Dissolve_Edge_Glow ("Dissolve_Edge_Glow", Range(0, 2)) = 0
        _Mask_Rotator ("Mask_Rotator", Float ) = 0
        _Mask_Power ("Mask_Power", Float ) = 5
        _Mask_Dissolve ("Mask_Dissolve", Float ) = 0
        [MaterialToggle] _Part_Mask_Disslove ("Part_Mask_Disslove", Float ) = 0
        _Rin_Color ("Rin_Color", Color) = (0.5,0.5,0.5,1)
        _Rin_Widit ("Rin_Widit", Float ) = 1
        _Rin_Strength ("Rin_Strength", Float ) = 1
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform fixed4 _MainColor;
            uniform sampler2D _DissolveTex; uniform float4 _DissolveTex_ST;
            uniform half _Dissolve_Edge_Sacle;
            uniform fixed4 _Dissolve_Edge_Color;
            uniform fixed _Dissolve_Edge_Glow;
            uniform half _MainTex_Intensity;
            uniform float _Rin_Widit;
            uniform float _Rin_Strength;
            uniform float4 _Rin_Color;
            uniform float _Mask_Rotator;
            uniform float _Mask_Power;
            uniform float _Mask_Dissolve;
            uniform fixed _Part_Mask_Disslove;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 texcoord0 : TEXCOORD0;
                float4 texcoord1 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }

            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                half4 _DissolveTex_var = tex2D(_DissolveTex,TRANSFORM_TEX(i.uv0, _DissolveTex));
                float node_9597_ang = _Mask_Rotator;
                float node_9597_spd = 1.0;
                float node_9597_cos = cos(node_9597_spd*node_9597_ang);
                float node_9597_sin = sin(node_9597_spd*node_9597_ang);
                float2 node_9597_piv = float2(0.5,0.5);
                float2 node_9597 = (mul(i.uv0-node_9597_piv,float2x2( node_9597_cos, -node_9597_sin, node_9597_sin, node_9597_cos))+node_9597_piv);
                float Part_Mask_Diss = i.uv1.r;
                float Mask_N = (1.0 - pow(((1.0 - node_9597).g+lerp( _Mask_Dissolve, Part_Mask_Diss, _Part_Mask_Disslove )),_Mask_Power));
                float node_4439 = Mask_N;
                float node_315_if_leA = step(_DissolveTex_var.r,node_4439);
                float node_315_if_leB = step(node_4439,_DissolveTex_var.r);
                half Clip_Min_Color = 0.0;
                half Clip_Max_Color = 1.0;
                half node_315 = lerp((node_315_if_leA*Clip_Min_Color)+(node_315_if_leB*Clip_Max_Color),Clip_Max_Color,node_315_if_leA*node_315_if_leB);
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                half MainTex_Alpha = (_MainColor.a*_MainTex_var.a);
                float node_9083 = (node_315*MainTex_Alpha);
                float Final_Clip = node_9083;
                clip(Final_Clip - 0.5);
////// Lighting:
////// Emissive:
                float3 Rin = (_Rin_Color.rgb*_Rin_Strength*pow(1.0-max(0,dot(normalDirection, viewDirection)),_Rin_Widit));
                float3 emissive = Rin;
                float node_8628_if_leA = step(_DissolveTex_var.r,(node_4439+_Dissolve_Edge_Sacle));
                float node_8628_if_leB = step((node_4439+_Dissolve_Edge_Sacle),_DissolveTex_var.r);
                float node_8628 = lerp((node_8628_if_leA*Clip_Min_Color)+(node_8628_if_leB*Clip_Max_Color),Clip_Max_Color,node_8628_if_leA*node_8628_if_leB);
                half3 Final_Dissolve = ((_Dissolve_Edge_Glow*(node_315-node_8628))*_Dissolve_Edge_Color.rgb*node_9083);
                float3 Final_Tex = ((_MainColor.rgb*_MainTex_var.rgb*_MainTex_Intensity)*(node_8628*MainTex_Alpha));

                float3 finalColor = emissive + (Final_Dissolve+Final_Tex);
				finalColor = max(finalColor, float3(0,0,0));

                return float4(finalColor, i.vertexColor.a);
            }
            ENDCG
        }
    }
    FallBack "Mobile/Particles/Additive"
    CustomEditor "ShaderForgeMaterialInspector"
}
