package tao.aswing
{
    import org.aswing.JButton;
    import org.aswing.Icon;
    
    public class XButton extends JButton
    {
	public function XButton(skin_id:String, text:String="", icon:Icon=null)
	{
	    super(text, icon);
            XUtils.setSkinID(this, skin_id);
	}
	
	override public function getUIClassID():String {
	    return "XButtonUI";
	}
    }
}
