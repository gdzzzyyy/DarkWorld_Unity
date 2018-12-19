using System.Collections;
using System.Collections.Generic;


//地图管理
public class MapManager {
    private static MapManager m_MapInstance;

    private MapManager() { }
    public static MapManager Instance
    {
        get
        {
            if(m_MapInstance == null)
            {
                m_MapInstance = new MapManager();
            }
            return m_MapInstance;
        }
    }

    public Dictionary<int, MapSingleDate> m_allMapInfoDic = new Dictionary<int, MapSingleDate>();//地图每个格子的基本信息 

    //通过读表把地图信息加载
    public void SetMapInfo(int mapFloorId, MapSingleDate mapSingleDate)
    {
        if(m_allMapInfoDic.ContainsKey(mapFloorId))
        {
            m_allMapInfoDic[mapFloorId] = mapSingleDate;
        }
        else
        {
            m_allMapInfoDic.Add(mapFloorId, mapSingleDate);
        }
    }

    //获取地图的完整信息
    public Dictionary<int, MapSingleDate> GetMapAllInfo()
    {
        if (m_allMapInfoDic != null && m_allMapInfoDic.Count > 0)
        {
            return m_allMapInfoDic;
        }
        return null;
    }

    //获取单个id下的地图信息
    public MapSingleDate GetMapSingleInfoById(int id)
    {
        if (m_allMapInfoDic.ContainsKey(id))
            return m_allMapInfoDic[id];
        else
            return null;
    }

    
    
	
}
