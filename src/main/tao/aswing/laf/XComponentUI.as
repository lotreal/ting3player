package tao.aswing.laf
{
    import flash.display.BitmapData;
    
    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.BaseComponentUI;
    import tao.aswing.XUtils;
    
    public class XComponentUI extends BaseComponentUI implements IXComponentUI
    {
	public function XComponentUI()
	{
	    super();
	}
	
	override public function getPreferredSize(c:Component):IntDimension {
	    var r:IntRectangle = XUtils.getRectang(c);
	    if(r) return r.getSize();
	    return null;
	}
	
	override public function getMaximumSize(c:Component) : IntDimension {
	    return this.getPreferredSize(c);
	}
	
	override public function getMinimumSize(c:Component) : IntDimension {
	    return this.getPreferredSize(c);
	}
    }
}
