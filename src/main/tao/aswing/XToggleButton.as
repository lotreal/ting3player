package tao.aswing
{
    import org.aswing.Icon;
    import org.aswing.JToggleButton;
    
    public class XToggleButton extends JToggleButton
    {
	public function XToggleButton(skin_id:String, text:String="", icon:Icon=null)
	{
	    super(text, icon);
            XUtils.setSkinID(this, skin_id);
	}
	
	override public function getUIClassID():String {
	    return "XToggleButtonUI";
	}
    }
}
