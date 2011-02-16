package tao.aswing
{
    import org.aswing.JSlider;
    
    public class XSlider extends JSlider
    {
	public function XSlider(skin_id:String, orient:int = 0, min:int = 0, max:int = 100, value:int = 0) {
	    super(orient, min, max, value);
            XUtils.setSkinID(this, skin_id);
	}
	
	override public function getUIClassID():String {
	    return "XSliderUI";
	}
    }
}
