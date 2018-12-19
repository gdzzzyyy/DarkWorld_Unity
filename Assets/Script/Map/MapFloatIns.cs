using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//Map的ui显示控制
public class MapFloatIns : MonoBehaviour {
    public Transform m_masterTran;

	// Use this for initialization
	void Start () {
        ReadJson.Instance.TestJson();
        Dictionary<int, MapConfigAchieveItem> mapConfig = ReadJson.Instance.GetMapConfig();
        if (mapConfig == null)
        {
            Debug.LogError("config is null");
            return;
        }
        InstanceMapFloor(mapConfig);
    }

    //实例化地图数据  并且显示层  数据层   怪物层分离加入manager，识别使用唯一的key。
    void InstanceMapFloor(Dictionary<int, MapConfigAchieveItem> mapconfig)
    {
        GameObject mapObj = (GameObject)Resources.Load("Prefab/MapObj");
        GameObject cardObj = (GameObject)Resources.Load("Prefab/CardObj");
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
            MapSingle floorMapSingle = floorObj.GetComponent<MapSingle>();
            if(floorMapSingle == null)
            {
                continue;
            }
           
            floorObj.name = (a.Key).ToString() ;
            floorObj.transform.parent = mapParent;
            floorObj.transform.position = new Vector3(x , y , 0);
           
            if (a.Key == 10 && m_masterTran != null)
            {
                GameObject masterObj = GameObject.Instantiate<GameObject>(cardObj);
                masterObj.name = "master";
                masterObj.transform.parent = floorObj.transform;
                UIDrag floorDrag = masterObj.GetComponent<UIDrag>();
                masterObj.transform.localPosition = new Vector3(0, 0, -20);
                if (floorDrag != null)
                {
                    floorDrag.SetInfo(a.Key, true, true);
                }
            }

            floorMapSingle.SetMapSingleDate( a.Key);
            MapSingleDate mapSingleDate = new MapSingleDate();
            mapSingleDate.MapObjId = a.Key;
            mapSingleDate.MapSingleDateInfo = floorMapSingle;
            MapManager.Instance.SetMapInfo(a.Key, mapSingleDate);
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
