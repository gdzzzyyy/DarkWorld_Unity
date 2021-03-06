﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class MapConfigAchieveItem
{
    private int _configId = 0;
    private string _configName = "";
    private int _configX = 0;
    private int _configY = 0;
    private string _configImage = "";

    public int Id
    {
        get { return _configId; }
        set { _configId = value; }
    }

    public string Name
    {
        get { return _configName; }
        set { _configName = value; }
    }

    public int RacePosX
    {
        get { return _configX; }
        set { _configX = value; }
    }

    public int RacePosY
    {
        get { return _configY; }
        set { _configY = value; }
    }

    public string Image
    {
        get { return _configImage; }
        set { _configImage = value; }
    }

    public void loadDataFromJson(MapDateJson achieve, int key)
    {
        MapConfigAchieveItem temp = (MapConfigAchieveItem)achieve.GetItem(key);
        _configX = temp.RacePosX;
        _configY = temp.RacePosY;
    }
}