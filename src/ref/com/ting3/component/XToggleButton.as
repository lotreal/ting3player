package com.ting3.component
{
    import org.aswing.Icon;
    import org.aswing.JToggleButton;
    
    public class XToggleButton extends JToggleButton
    {
	public function XToggleButton(text:String="", icon:Icon=null)
	{
	    super(text, icon);
	}
	
	public function setXmlField(field:String):void{
	    this.putClientProperty("xmlField", field);
	}
	
	override public function getUIClassID():String {
	    return "XToggleButtonUI";
	}
    }
}
