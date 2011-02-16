package  tao.aswing.laf
{
    import tao.debugger.Console;
    import flash.display.BitmapData;
    
    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.basic.BasicToggleButtonUI;
    import org.aswing.skinbuilder.SkinButtonBackground;
    
    import tao.aswing.XToggleButton;
    import tao.utils.MusicUtils;
    import tao.aswing.XUtils;
    
    public class XToggleButtonUI extends BasicToggleButtonUI implements IXComponentUI
    {
	private var pSize:IntDimension;
	
	public function XToggleButtonUI()
	{
	    super();
	}
	
	override public function installUI(c:Component):void{
	    button = XToggleButton(c);

	    var p:String = getPrefix();
	    var image:BitmapData = XUtils.getBitmapData(this, p + "image") || new BitmapData(4, 1, true, 0x00ffffff);
	    pSize = new IntDimension(image.width / 4, image.height);
	    this.putDefault(p + "bg", 					new SkinButtonBackground(p));
	    this.putDefault(p + "defaultImage",		MusicUtils.copyAndCreateBitmap(image, 0));
	    this.putDefault(p + "rolloverImage",		MusicUtils.copyAndCreateBitmap(image, 1));
	    this.putDefault(p + "pressedImage",		MusicUtils.copyAndCreateBitmap(image, 2));
	    this.putDefault(p + "disabledImage",		MusicUtils.copyAndCreateBitmap(image, 3));
	    
	    this.putDefault(p + "selectedImage",				getDefault(p + "pressedImage"));
	    this.putDefault(p + "rolloverSelectedImage",		getDefault(p + "rolloverImage"));
	    this.putDefault(p + "disabledSelectedImage",		getDefault(p + "disabledImage"));
	    super.installUI(c);
	}
	
	override public function getPreferredSize(c:Component):IntDimension{
	    return pSize;
	}
	
	public function getPrefix():String {
            return XUtils.getSkinID(button);
	}
	
	override protected function getPropertyPrefix():String {
	    return getPrefix();
	}
    }
}
