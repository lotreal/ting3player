﻿package com.ting3.component.board
{
    import org.aswing.GeneralListCellFactory;
    import org.aswing.JList;
    import org.aswing.JScrollPane;
    import org.aswing.JSplitPane;
    import org.aswing.resizer.DefaultResizer;
    import org.aswing.resizer.ResizerController;
    
    import com.ting3.component.XButton;
    import com.ting3.component.board.playlistWindow.ToolBar;
    import com.ting3.component.board.playlistWindow.cell.SongListCell;
    import com.ting3.component.layout.PlaylistWindowLayout;
    import com.ting3.geom.SongList;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class PlayListWindow extends AbstractBoard
    {
	//主要的SplitPane
	private var splitPanel:JSplitPane;
	//歌曲表单列表
	private var listOfList:JList;
	//装歌曲表单列表的JScrollPane
	private var scrollPaneForList:JScrollPane;
	//工具栏
	private var tool:ToolBar;
	//关闭按钮
	private var closeButton:XButton;
	
	public function PlayListWindow() 
	{
	    scrollPaneForList = new JScrollPane;
	    
	    splitPanel = new JSplitPane();
	    //分割线停靠在35%处
	    splitPanel.setResizeWeight(0.35);
	    splitPanel.setDividerSize(5);
	    
	    super();
	    ResizerController.create(this, new DefaultResizer);
	    this.createListOfList();
	    //tool bar.
	    tool = new ToolBar;
	    append(tool);
	    
	    //关闭按钮:
	    closeButton = new XButton;
	    closeButton.setXmlField("playListWindow.close");
	    append(closeButton);
	    
	    append(splitPanel);
	    mouseChildren = true;
	    setLayout(new PlaylistWindowLayout(tool));
	}
	
	/**
	* 歌曲列表的列表 
	* 
	*/		
	private function createListOfList():void{
	    listOfList = new JList;
	    listOfList.setCellFactory(new GeneralListCellFactory(SongListCell));
	    
	    scrollPaneForList.setView(listOfList);
	    scrollPaneForList.setHorizontalScrollBarPolicy(1);
	    splitPanel.setLeftComponent(scrollPaneForList);
	}
	
	public function getSplitPane():JSplitPane{
	    return splitPanel;
	}
	
	public function getListOfList():JList{
	    return listOfList;
	}
	
	/**
	* 切换歌曲列表 
	* @param list
	* 
	*/		
	public function switchList(list:SongList):void{
	    splitPanel.setRightComponent(list.getHolder());
	}
	
	public function getCloseButton():XButton{
	    return closeButton;
	}
	
	override public function getUIClassID():String {
	    return "PlayListWindowUI";
	}
	
    }
    
}
