package com.ting3.component.layout
{
    import org.aswing.Container;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    
    import com.ting3.component.board.LyricWindow;
    import com.ting3.component.lookAndFeel.IXComponentUI;
    
    public class LyricWindowLayout extends AlignElementsLayout
    {
	private var lyricWin:LyricWindow;
	
	public function LyricWindowLayout()
	{
	    super();
	}
	
	override public function layoutContainer(target:Container):void {
	    lyricWin = target as LyricWindow;
	    var nowSize:IntDimension = target.getSize();
	    var oriSize:IntDimension = lyricWin.getOriginalSize();
	    
	    layoutAlignElement(lyricWin.closeButton, nowSize, oriSize);
	    layoutLyric(oriSize, nowSize);
	}
	
	private function layoutLyric(oriSize:IntDimension, nowSize:IntDimension):void{
	    var ui:IXComponentUI = lyricWin.getLyric().getUI() as IXComponentUI;
	    var rect:IntRectangle = ui.getRectang(ui.getPrefix() + "position").clone();
	    rect.resize(nowSize.width - oriSize.width, nowSize.height - oriSize.height);
	    lyricWin.getLyric().setBounds(rect);
	}
    }
}
