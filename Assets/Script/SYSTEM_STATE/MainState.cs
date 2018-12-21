using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//状态机控制
public class MainState {
    private static MainState m_mainStateInstance;
    public MainState GetMainStateIns()
    {
        if(m_mainStateInstance == null)
        {
            return new MainState();
        }

        return m_mainStateInstance;
    }

    public Dictionary<int, MasterDate> m_master;
    

    //实例化玩家每个人信息
    //实例化玩家方每个人的状态机
    public void InsMasterState(int masterId, MasterDate masterDate)
    {
        
    }

    //主状态机
    public void MainStateUpdate(float dTime)
    {

    }
	
}
