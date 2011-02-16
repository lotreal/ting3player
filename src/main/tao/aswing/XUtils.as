package tao.aswing
{
    import tao.debugger.Console;
    import org.aswing.plaf.ComponentUI;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.SimpleButton;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;

    import tao.aswing.laf.IXComponentUI;
    import tao.geom.MRectangle;

    public class XUtils
    {
        public static const XP_SKINID:String = 'x_skin_id';
        public static const XP_POSITION:String = 'x_position';

	public static function getPosition(c:Component):IntRectangle
        {
            return c.getClientProperty(XP_POSITION) as IntRectangle;
	}

	public static function setPosition(c:Component, rect:IntRectangle):void
        {
            c.putClientProperty(XP_POSITION, rect);
	}

	public static function getSkinID(c:Component):String
        {
            var id:String = [c.getUIClassID(), c.getClientProperty(XP_SKINID) || 'default'].join('.') + '.';
            // Console.log(XUtils, id);
            return id;
	}

	public static function setSkinID(c:Component, id:String):void
        {
            c.putClientProperty(XP_SKINID, id);
	}

	public static function getBitmapData(ui:ComponentUI, key:String):BitmapData
        {
	    return ui.getInstance(key) as BitmapData;
	}

	public static function getRectang(c:Component):IntRectangle
        {
            var key:String =  getSkinID(c) + "position";
            var bounds:IntRectangle = c.getUI().getInstance(key) as IntRectangle;
            if (bounds == null) bounds = getPosition(c);
	    return bounds;
	}

	public static function createScrollBarButton(bmp:BitmapData, incr:Boolean = true):SimpleButton {
	    var b:SimpleButton = new SimpleButton;
	    var hIndex:int = incr ? 0 : 1;
	    b.upState = copyAndCreateBitmap(bmp, 0, 3, hIndex, 2);
	    b.overState = copyAndCreateBitmap(bmp, 1, 3, hIndex, 2);
	    b.downState = copyAndCreateBitmap(bmp, 2, 3, hIndex, 2);
	    return b;
	}
	
	public static function copyAndCreateBitmap(source:BitmapData, wIndex:int, wSplitNum:int = 4, hIndex:int = 0, hSplitNum:int = 1):Bitmap{
	    return new Bitmap(copyAndCreateBitmapData(source, wIndex, wSplitNum, hIndex, hSplitNum));
	}
	
	public static function copyAndCreateBitmapData(source:BitmapData, wIndex:int, wSplitNum:int = 4, hIndex:int = 0, hSplitNum:int = 1):BitmapData{
	    var pw:int = source.width / wSplitNum;
	    var ph:int = source.height / hSplitNum;
	    
	    var targetBitmapData:BitmapData = new BitmapData(pw, ph, true, 0x00ffffff);
	    targetBitmapData.copyPixels(source, new Rectangle(wIndex * pw, hIndex * ph, pw, ph), new Point);
	    return targetBitmapData;
	}
    }
}
