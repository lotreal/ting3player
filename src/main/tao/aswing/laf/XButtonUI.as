package tao.aswing.laf
{
    import tao.debugger.Console;
    import flash.display.BitmapData;
    
    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.basic.BasicButtonUI;
    import org.aswing.skinbuilder.SkinButtonBackground;
    import org.aswing.graphics.Graphics2D;
    
    import tao.aswing.XButton;
    import tao.aswing.XUtils;

    import tao.utils.MusicUtils;
    import tao.geom.MRectangle;

    public class XButtonUI extends BasicButtonUI implements IXComponentUI
    {
	private var pSize:IntDimension;
	
	override public function installUI(c:Component) : void {
	    this.button = XButton(c);
	    var pp:String = getPrefix();

	    //fix bug:
	    //容错模式, 如果XML配置里没设定按钮皮肤图片，则创建一个空的透明的位图显示，（防出错）
	    var bitmapData:BitmapData = XUtils.getBitmapData(this, pp + "image") || new BitmapData(100, 25, true, 0x00FF00FF);

	    pSize = new IntDimension(bitmapData.width / 4, bitmapData.height);
	    
	    //fix bug:
	    //在右对齐情况下，按钮向XML配置文件里设定的区域右靠
	    var align:String = getString(pp + "align");
	    if(align == "right"){
		var bounds:IntRectangle = XUtils.getRectang(button);
		bounds.move(bounds.width - pSize.width, 0);
	    }
	    
	    
	    this.putDefault(pp + "bg", 				new SkinButtonBackground(pp));
	    this.putDefault(pp + "defaultImage", 		MusicUtils.copyAndCreateBitmap(bitmapData, 0));
	    this.putDefault(pp + "rolloverImage", 	MusicUtils.copyAndCreateBitmap(bitmapData, 1));
	    this.putDefault(pp + "pressedImage", 		MusicUtils.copyAndCreateBitmap(bitmapData, 2));
	    this.putDefault(pp + "disabledImage", 	MusicUtils.copyAndCreateBitmap(bitmapData, 3));
	    
	    super.installUI(c);
	}
	
	override public function getPreferredSize(c:Component):IntDimension {
	    return pSize;
	}
	
	public function getPrefix():String{
            return XUtils.getSkinID(button);
	}
	
	override protected function getPropertyPrefix():String {
	    return getPrefix();
	}

        override public function paint(c:Component, g:Graphics2D, r:IntRectangle):void{
        }
    }
}
