Shader "SL/Ground/Unlit" 
{
    Properties 
    {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }

    SubShader 
    {
        LOD 100
        Tags { "Queue" = "Geometry" "RenderType"="Opaque" }
            
        Pass 
        {
            Tags { "LIGHTMODE"="Vertex" "RenderType"="Opaque" }
            Lighting Off
                
            SetTexture [_MainTex] { combine texture }
        }
            
        Pass
        {
            Tags { "LIGHTMODE"="VertexLM" "RenderType"="Opaque" }
            Lighting Off
                
            BindChannels {
                Bind "vertex", Vertex
                Bind "texcoord1", TexCoord0
                Bind "texcoord", TexCoord1
            }
            SetTexture [unity_Lightmap] { Matrix [unity_LightmapMatrix] combine texture }
            SetTexture [_MainTex] { combine texture * previous double}
        }
            
        Pass 
        {
            Tags { "LIGHTMODE"="VertexLMRGBM" "RenderType"="Opaque" }
            Lighting Off
                
            BindChannels {
                Bind "vertex", Vertex
                Bind "texcoord1", TexCoord0
                Bind "texcoord", TexCoord1
            }
            SetTexture [unity_Lightmap] { Matrix [unity_LightmapMatrix] combine texture * texture alpha double }
            SetTexture [_MainTex] { combine texture * previous quad}
        }
    }
}