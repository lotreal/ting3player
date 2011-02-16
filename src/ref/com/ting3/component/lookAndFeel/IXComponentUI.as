package com.ting3.component.lookAndFeel
{
    import flash.display.BitmapData;
    
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.ComponentUI;
    
    public interface IXComponentUI extends ComponentUI
    {
	function getBitmapData(key:String):BitmapData;
	
	function getRectang(key:String):IntRectangle;
	
	function getPrefix():String;
    }
}
