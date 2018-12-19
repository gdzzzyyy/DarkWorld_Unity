using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//Map的ui显示控制
public class MapFloatIns : MonoBehaviour {


	// Use this for initialization
	void Start () {
        ReadJson.Instance.TestJson();
        Dictionary<int, MapConfigAchieveItem> mapConfig = ReadJson.Instance.GetMapConfig();
        if (mapConfig == null)
        {
            Debug.LogError("config is null");
            return;
        }
        InstanceMapFloat(mapConfig);
    }

    //实例化地图数据  并且显示层  数据层   怪物层分离加入manager，识别使用唯一的key。
    void InstanceMapFloat(Dictionary<int, MapConfigAchieveItem> mapconfig)
    {
        GameObject mapObj = (GameObject)Resources.Load("MapObj");
        Transform mapParent = this.transform.Find("MapSystemObj");
        if (mapObj == null)
        {
            Debug.LogError("mapobj is null");
            return;
        }
        if (mapParent == null)
        {
            Debug.LogError("mapparent is null");
            return;
        }

        foreach(var a in mapconfig)
        {
            int x = a.Value.RacePosX;
            int y = a.Value.RacePosY;
            GameObject floorObj = GameObject.Instantiate<GameObject>(mapObj);
            floorObj.name = (a.Key).ToString() ;
            floorObj.transform.parent = mapParent;
            floorObj.transform.position = new Vector3(x , y , 0);
            UIDrag floorDrag = floorObj.AddComponent<UIDrag>();
            floorDrag.SetInfo(a.Key, true, true);
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
