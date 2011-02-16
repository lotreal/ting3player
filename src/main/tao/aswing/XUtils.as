package tao.aswing
{
    import tao.debugger.Console;
    import org.aswing.plaf.ComponentUI;

    import flash.display.BitmapData;
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
            return [c.getUIClassID(), c.getClientProperty(XP_SKINID, 'default')].join('.') + '.';
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
    }
}
