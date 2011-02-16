package tao.aswing
{
    import org.aswing.JPanel;
    import org.aswing.LayoutManager;
    
    public class XPanel extends JPanel
    {
	public function XPanel(skin_id:String = null, layout:LayoutManager=null)
	{
	    super(layout);
            XUtils.setSkinID(this, skin_id);
	}
	
	override public function getUIClassID():String {
	    return "XPanelUI";
	}
    }
}
