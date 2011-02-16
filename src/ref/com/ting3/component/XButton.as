package com.ting3.component
{
    import org.aswing.JButton;
    
    public class XButton extends JButton
    {
	public function XButton()
	{
	    super();
	}
	
	public function setXmlField(field:String):void{
	    this.putClientProperty("xmlField", field);
	}
	
	override public function getUIClassID():String {
	    return "XButtonUI";
	}
    }
}
