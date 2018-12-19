using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using SimpleJSON;

[Serializable]
public class MapDateJson
{
    private Dictionary<int, MapConfigAchieveItem> hash = new Dictionary<int, MapConfigAchieveItem>();

    // 从Json文件中载入信息保存至Hashtable
    public void loadFromJson(JSONNode data)
    {
        if (data == null)
            Debug.Log("read faild");
        else
        {
            int id = 0;
            for (int i = 0; i < data.Count; i++)
            {
                MapConfigAchieveItem node = new MapConfigAchieveItem();
                node.Id = id;
                id++;
                node.RacePosX = data[i]["x"];
                node.RacePosY = data[i]["y"];
                //Debug.LogError("typeddd =  " + data[i]["x"].GetType() + "   data[i][x] = " + data[i]["x"]);
                hash.Add(node.Id, node);
            }
        }
    }

    // 从Hashtable中返回键为key的值
    public MapConfigAchieveItem GetItem(int key)
    {
        MapConfigAchieveItem itemAchieve = (MapConfigAchieveItem)hash[key];
        return itemAchieve;
    }

    public Dictionary<int, MapConfigAchieveItem> GetMapDate()
    {
        return hash;
    }

}
