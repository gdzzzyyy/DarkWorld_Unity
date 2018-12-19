using System.Collections;
using System.Collections.Generic;


//地图数据层  单个单个地块的数据
public class MapSingleDate
{
    //地图节点ID
    private int m_mapObjId;
    public int MapObjId
    {
        get { return m_mapObjId; }
        set { m_mapObjId = value; }
    }

    //地图节点类型
    private int m_mapObjType;
    public int MapObjType
    {
        get { return m_mapObjType; }
        set { m_mapObjType = value; }
    }

    //地图是否可行走
    private bool m_mapObjCanWalk;
    public bool MapObjCanWalk
    {
        get { return m_mapObjCanWalk; }
        set { m_mapObjCanWalk = value; }
    }

    //地图图片
    private string m_mapObjPic;
    public string MapObjPic
    {
        get { return m_mapObjPic; }
        set { m_mapObjPic = value; }
    }

    //地图怪物 NPC 的信息  肯定不是int    monster和npc共用一套
    private int m_mapBiologyInsId;
    public int MapBiologyInsId
    {
        get { return m_mapBiologyInsId; }
        set { m_mapBiologyInsId = value; }
    }


    //地图特殊属性  各种增益或者减效果
    private int m_mapBuff;
    public int MapBuff
    {
        get { return m_mapBuff; }
        set { m_mapBuff = value; }
    }

    private MapSingle m_mapSingleDate;
    public MapSingle MapSingleDateInfo
    {
        get { return m_mapSingleDate; }
        set { m_mapSingleDate = value; }
    }

}
