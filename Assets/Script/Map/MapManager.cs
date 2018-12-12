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

    public List<MapSingleDate> m_AllMapObjList = new List<MapSingleDate>();

    //通过读表把地图信息加载
    public void SetMapInfo()
    {
        for(int row = 0; row < 10; row++)
        {
            for(int columns = 0; columns < 10; columns++)
            {
                //读表之后塞入数据
                m_AllMapObjList.Add(new MapSingleDate());
            }
        }
    }

    //获取地图的完整信息
    public List<MapSingleDate> GetMapInfo()
    {
        if (m_AllMapObjList != null && m_AllMapObjList.Count > 0)
        {
            return m_AllMapObjList;
        }
        return null;
    }

    
	
}
