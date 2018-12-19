using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using SimpleJSON;

public class ReadJson  {
    private static ReadJson m_readJsonIns;
    public static ReadJson Instance
    {
        get
        {
            if (m_readJsonIns == null)
            {
                m_readJsonIns = new ReadJson();
            }
            return m_readJsonIns;
        }
    }

    public Dictionary<string, byte> m_allTableDic = new Dictionary<string, byte>();
    public Hashtable m_allHashMap = new Hashtable();
    public JSONNode m_mapJsonNode = null;
    public Dictionary<int, MapConfigAchieveItem> m_mapTable = null;

    public void ReadJsonForPath()
    {
        string jsonPath = Application.dataPath + "/Map";
        Debug.LogError("paht = " + jsonPath);
        TextAsset jsonText = Resources.Load("Map") as TextAsset;
        if (jsonText == null)
        {
            Debug.LogError("jsontext is error !!!");
        }
        else
        {
            m_mapJsonNode = JSON.Parse(jsonText.text);
        }
    }

    public void TestJson()
    {
        ReadJsonForPath();
        if (m_mapJsonNode == null)
        {
            Debug.LogError("???????");
            return;
        }
        MapDateJson mapjsondate = new MapDateJson();
        mapjsondate.loadFromJson(m_mapJsonNode);
        m_mapTable = mapjsondate.GetMapDate();
        foreach (var a in m_mapTable)
        {
            Debug.LogWarning("a = " + a.Key + " value = " + a.Value.Id);
        }
    }

    public Dictionary<int, MapConfigAchieveItem> GetMapConfig()
    {
        return m_mapTable;
    }

}