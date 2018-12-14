using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using SimpleJSON;

[Serializable]
public class MapDateJson
{
    private Hashtable hash = new Hashtable();

    // 从Json文件中载入信息保存至Hashtable
    public void loadFromJson(JSONNode data)
    {
        if (data == null)
            Debug.Log("read faild");
        else
        {
            for (int i = 0; i < data.Count; i++)
            {
                MapConfigAchieveItem node = new MapConfigAchieveItem();
                node.Id = data[i]["achieve_id"];
                Debug.LogError("typeddd =  " + data[i]["achieve_id"].GetType());
                node.Name = data[i]["achieve_name"];
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

}
