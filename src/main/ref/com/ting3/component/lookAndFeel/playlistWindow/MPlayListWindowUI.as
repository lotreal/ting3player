package com.ting3.component.lookAndFeel.playlistWindow 
{
    import flash.display.BitmapData;
    
    import org.aswing.AssetBackground;
    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    
    import com.ting3.component.ScaleBitmap;
    import com.ting3.component.board.PlayListWindow;
    import com.ting3.component.lookAndFeel.XComponentUI;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class MPlayListWindowUI extends XComponentUI
    {
	private var background:ScaleBitmap;
	private var playlist:PlayListWindow;
	
	public function MPlayListWindowUI() 
	{
	    
	}
	
	override public function installUI(c:Component):void {
	    playlist = PlayListWindow(c);
	    
	    var pp:String = getPrefix();
	    var rsr:IntRectangle = this.getRectang(pp + "resizeRect");
	    var oriBmp:BitmapData = this.getBitmapData(pp + "background");
	    var oriSize:IntDimension = new IntDimension(oriBmp.width, oriBmp.height);
	    
	    background = new ScaleBitmap(oriBmp);
	    background.scale9Grid = rsr.toRectangle();
	    
	    playlist.setBackgroundDecorator(new AssetBackground(background));
	    playlist.setOriginalSize(oriSize);
	}
	
	override public function getPrefix():String {
	    return "PlayListWindow.";
	}
	
	override public function uninstallUI(c:Component):void {
	    c.setBackgroundDecorator(null);
	}
	
	override public function getMaximumSize(c:Component):IntDimension {
	    return IntDimension.createBigDimension();
	}
	
    }

}
