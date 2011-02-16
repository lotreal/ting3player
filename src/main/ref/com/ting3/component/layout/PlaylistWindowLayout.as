package com.ting3.component.layout 
{
    import org.aswing.Container;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    
    import com.ting3.component.board.PlayListWindow;
    import com.ting3.component.board.playlistWindow.ToolBar;
    import com.ting3.component.lookAndFeel.IXComponentUI;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class PlaylistWindowLayout extends AlignElementsLayout
    {
	private var tool:ToolBar;
	
	public function PlaylistWindowLayout(tool:ToolBar) 
	{
	    this.tool = tool;
	}
	
	override public function layoutContainer(target:Container):void 
	{
	    var listWin:PlayListWindow = PlayListWindow(target);
	    var ui:IXComponentUI = listWin.getUI() as IXComponentUI;
	    //黙认的list显示区域范围
	    var listRect:IntRectangle = ui.getRectang(ui.getPrefix() + "list.position");
	    
	    var oriSize:IntDimension = listWin.getOriginalSize();
	    var nowSize:IntDimension = listWin.getSize();
	    
	    //计算实际list显示范围
	    var splRet:IntRectangle = listRect.clone();
	    splRet.width += nowSize.width - oriSize.width;
	    splRet.height += nowSize.height - oriSize.height;
	    listWin.getSplitPane().setBounds(splRet);
	    
	    //toolbar:
	    layoutAlignElement(tool, nowSize, oriSize);
	    //closebutton:
	    layoutAlignElement(listWin.getCloseButton(), nowSize, oriSize);
	}
	
    }

}
