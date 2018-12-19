using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System;

public class UIDrag : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler, IPointerClickHandler {
    public int m_nodeId = -1;
    public bool m_canDrag = true;
    public bool m_canClick = true;

    public void SetInfo(int id, bool canDrag = true, bool canClick = true)
    {
        m_nodeId = id;
        m_canDrag = canDrag;
        m_canClick = canClick;
    }

    private void Awake()
    {
        
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        m_canClick = false;
        if (m_nodeId == -1)
            return;

    }

    //感觉这个接口不会有作用
    public void OnDrag(PointerEventData eventData)
    {
        Vector3 screenSpace = eventData.pressEventCamera.WorldToScreenPoint(transform.position);
        transform.position = eventData.pressEventCamera.ScreenToWorldPoint(new Vector3(eventData.position.x, eventData.position.y, screenSpace.z));
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        m_canDrag = true;
        Ray ray = eventData.pressEventCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit[] rayHit = Physics.RaycastAll(ray);
        for (int i = 0; i < rayHit.Length; i++)
        {
            MapSingle aa = rayHit[i].transform.gameObject.GetComponent<MapSingle>();
            if (aa != null)
            {
                Vector3 zz = Camera.main.ScreenToWorldPoint(eventData.position);
                if (Math.Abs(zz.x - rayHit[i].transform.position.x) <= 0.5 && Math.Abs(zz.y - rayHit[i].transform.position.y) <= 0.5)
                {
                    this.transform.parent = rayHit[i].transform;
                    this.transform.localPosition = new Vector3(0, 0, -20);
                    if(aa.mapId != -1)
                    {
                        m_nodeId = aa.mapId;
                        return;
                    }
                }
            }
        }

        MapSingleDate oldMapSingle = MapManager.Instance.GetMapSingleInfoById(m_nodeId);
        if(oldMapSingle.MapSingleDateInfo == null)
        {
            Debug.LogError("oldmapsingle is null " + m_nodeId);
            return;
        }
        this.transform.parent = oldMapSingle.MapSingleDateInfo.transform;
        this.transform.localPosition = new Vector3(0, 0, -20);

    }

    public void OnPointerClick(PointerEventData eventData)
    {
    }

    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
