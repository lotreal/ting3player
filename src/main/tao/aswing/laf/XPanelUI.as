package tao.aswing.laf
{
    import tao.debugger.Console;
    import flash.display.BitmapData;
    
    import org.aswing.Component;
    import org.aswing.JPanel;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.basic.BasicPanelUI;

    import org.aswing.graphics.Graphics2D;
    

    import tao.aswing.XPanel;
    import tao.aswing.XUtils;
    import tao.geom.MRectangle;

    public class XPanelUI extends BasicPanelUI implements IXComponentUI
    {
	override public function installUI(c:Component):void {
	    var p:JPanel = JPanel(c);
	    installDefaults(p);
	}
    }
}
