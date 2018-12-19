using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MasterManager {
    private static MasterManager m_masterManagerIns;
    public static MasterManager GetMasterManagerIns()
    {
        if (m_masterManagerIns == null)
        {
            return new MasterManager();
        }
        else
        {
            return m_masterManagerIns;
        }
    }

    Dictionary<int, MasterDate> m_mapHasMasterDateInfo = null;
    public void SetMapHasMaster(int masterId,MasterDate masterInfo)
    {
        if (m_mapHasMasterDateInfo.ContainsKey(masterId))
        {
            m_mapHasMasterDateInfo[masterId] = masterInfo;
            return;
        }
        m_mapHasMasterDateInfo.Add(masterId, masterInfo);
    }

}
