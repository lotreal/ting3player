package tao.aswing.laf
{
    import tao.debugger.Console;
    
    import org.aswing.Component;
    import org.aswing.plaf.basic.BasicPanelUI;
    
    import tao.aswing.XRate;
    import tao.aswing.XUtils;

    public class XRateUI extends BasicPanelUI implements IXComponentUI
    {
        protected var rate:XRate;

	override public function installUI(c:Component):void {
            rate = XRate(c);
            super.installUI(c);
	}

	public function getPrefix():String{
            return XUtils.getSkinID(rate);
	}
    }
}
