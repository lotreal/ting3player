package com.ting3.component.lookAndFeel.playlistWindow 
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.SimpleButton;
    import flash.geom.Rectangle;
    
    import org.aswing.Component;
    import org.aswing.JButton;
    import org.aswing.geom.IntDimension;
    
    import com.ting3.component.board.playlistWindow.ToolBar;
    import com.ting3.component.lookAndFeel.XComponentUI;
    import com.ting3.component.lookAndFeel.SimpleButtonBackground;
    import com.ting3.utils.BitmapDataUtil;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class MToolBarUI extends XComponentUI
    {
	private var image:Bitmap;
	private var hotImage:Bitmap;
	private var tool:ToolBar;
	private var pw:int;
	private var ph:int;
	public function MToolBarUI() 
	{
	    super();
	}
	
	override public function installUI(c:Component):void {
	    tool = ToolBar(c);
	    var imageBitmapData:BitmapData = getBitmapData(getPrefix() + "image");
	    image = new Bitmap(imageBitmapData);
	    var hotBitmapData:BitmapData = getBitmapData(getPrefix() + "hotImage") || imageBitmapData;
	    hotImage = new Bitmap(hotBitmapData);
	    pw = image.width / 7;
	    ph = image.height;
	    
	    createButton(tool.getAddButton(), 0);
	    createButton(tool.getDelButton(), 1);
	    createButton(tool.getListButton(), 2);
	    createButton(tool.getSortButton(), 3);
	    createButton(tool.getSearchButton(), 4);
	    createButton(tool.getEditButton(), 5);
	    createButton(tool.getModelButton(), 6);
	    
	    tool.doLayout();
	}
	
	private function createButton(b:JButton, index:int):void
	{
	    var s:SimpleButton = new SimpleButton(BitmapDataUtil.bitmapCut(image, new Rectangle(pw * index, 0, pw, ph)),
		BitmapDataUtil.bitmapCut(hotImage, new Rectangle(pw * index, 0, pw, ph)),
		BitmapDataUtil.bitmapCut(image, new Rectangle(pw * index, 0, pw, ph)),
		BitmapDataUtil.bitmapCut(image, new Rectangle(pw * index, 0, pw, ph)));
	    b.setBackgroundDecorator(new SimpleButtonBackground(s));
	    b.setPreferredSize(new IntDimension(pw, ph));
	    b.pack();
	}
	
	override public function uninstallUI(c:Component):void {
	    //tool.getAddButton().setBackgroundDecorator(null);
	    tool = null;
	}
	
	override public function getPrefix():String {
	    return "ToolBar.";
	}
	
    }

}
