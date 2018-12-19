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
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        m_canDrag = true;

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
