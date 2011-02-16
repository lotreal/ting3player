package tao.aswing.laf
{
    import tao.debugger.Console;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    
    import org.aswing.Component;
    import org.aswing.JSlider;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    import org.aswing.graphics.Graphics2D;
    import org.aswing.skinbuilder.SkinSliderUI;
    
    import tao.aswing.XSlider;
    import tao.utils.MusicUtils;
    import tao.aswing.XUtils;
    
    public class XSliderUI extends SkinSliderUI implements IXComponentUI
    {
	private var tImageH:int;
	private var tImageW:int;
	
	public function XSliderUI()
	{
	    super();
	}

	override public function installUI(c:Component):void{
	    slider = XSlider(c);
	    var p:String = this.getPrefix();
	    var vertical:Boolean = getBoolean(p + "vertical");
	    slider.setOrientation(vertical ? JSlider.VERTICAL : JSlider.HORIZONTAL);
	    //vertical = false;
	    var trackImage:Bitmap = new Bitmap(XUtils.getBitmapData(this, p + "barImage"));
	    var trackProgressImage:Bitmap = new Bitmap(XUtils.getBitmapData(this, p + "fillImage"));
	    var thumbImage:BitmapData = XUtils.getBitmapData(this, p + "thumbImage") || new BitmapData(4,1, true, 0x00FFFFFF);
	    
	    if(vertical){
		this.putDefault(p + "vertical.trackImage", trackImage);
		this.putDefault(p + "vertical.trackDisabledImage", trackImage);
		this.putDefault(p + "vertical.trackProgressImage", trackProgressImage);
		this.putDefault(p + "vertical.trackProgressDisabledImage", trackProgressImage);
		
		this.putDefault(p + "thumbVertical.defaultImage", MusicUtils.copyAndCreateBitmap(thumbImage, 0, 4));
		this.putDefault(p + "thumbVertical.pressedImage", MusicUtils.copyAndCreateBitmap(thumbImage, 1, 4));
		this.putDefault(p + "thumbVertical.rolloverImage", MusicUtils.copyAndCreateBitmap(thumbImage, 2, 4));
		this.putDefault(p + "thumbVertical.disabledImage", MusicUtils.copyAndCreateBitmap(thumbImage, 3, 4));
	    } 
	    {
		this.putDefault(p + "horizontal.trackImage", trackImage);
		this.putDefault(p + "horizontal.trackDisabledImage", trackImage);
		this.putDefault(p + "horizontal.trackProgressImage", trackProgressImage);
		this.putDefault(p + "horizontal.trackProgressDisabledImage", trackProgressImage);
		
		this.putDefault(p + "thumbHorizontal.defaultImage", MusicUtils.copyAndCreateBitmap(thumbImage, 0, 4));
		this.putDefault(p + "thumbHorizontal.pressedImage", MusicUtils.copyAndCreateBitmap(thumbImage, 1, 4));
		this.putDefault(p + "thumbHorizontal.rolloverImage", MusicUtils.copyAndCreateBitmap(thumbImage, 2, 4));
		this.putDefault(p + "thumbHorizontal.disabledImage", MusicUtils.copyAndCreateBitmap(thumbImage, 3, 4));
	    }
	    this.putDefault(p + "thumbIcon", new XSliderThumb(getPrefix()));
	    super.installUI(c);
	    if(isVertical()){
		tImageW = vertical_trackProgressImage.width;
		tImageH = vertical_trackProgressImage.height;
		
		trackOriginalLength = horizontal_trackImage.height;
	    } else {
		tImageH = horizontal_trackProgressDisabledImage.height;
		tImageW = horizontal_trackProgressDisabledImage.width;
	    }
            slider.stage.addEventListener(MouseEvent.MOUSE_MOVE, __onMoveThumb, false, 0, true);
	}

	private function __onMoveThumb(e:MouseEvent):void{
            // Console.log(this, e.localX);
	}

	
	override protected function paintTrackProgress(g:Graphics2D, trackDrawRect:IntRectangle):void {
	    progressContainer.visible = slider.getPaintTrack();
	    if(!progressContainer.visible){
		return;
	    }
	    
	    if(progressContainer.numChildren > 0){
		progressContainer.removeChildAt(0);
	    }
	    var tImage:DisplayObject;
	    if(slider.isEnabled()){
		if(isVertical()){
		    tImage = vertical_trackProgressImage;
		}else{
		    tImage = horizontal_trackProgressImage;
		}
	    }else{
		if(isVertical()){
		    tImage = vertical_trackProgressDisabledImage;
		}else{
		    tImage = horizontal_trackProgressDisabledImage;
		}
	    }
	    progressContainer.addChild(tImage);
	    
	    var rect:IntRectangle = trackDrawRect.clone();
	    var width:int;
	    var height:int;
	    var x:int;
	    var y:int;
	    var inverted:Boolean = slider.getInverted();
	    if(isVertical()){
		//width = rect.width;
		width = tImageW;
		height = thumbRect.y + thumbRect.height/2 - rect.y;
		x = rect.x;
		if(inverted){
		    y = rect.y;
		}else{
		    height = rect.y + rect.height - thumbRect.y - thumbRect.height/2;
		    y = thumbRect.y + thumbRect.height/2;
		}
		height=0;
		progressContainer.x = x;
	    }else{
		//height = rect.height;
		height = tImageH;
		if(inverted){
		    width = rect.x + rect.width - thumbRect.x - thumbRect.width/2;
		    x = thumbRect.x + thumbRect.width/2;
		}else{
		    width = thumbRect.x + thumbRect.width/2 - rect.x;
		    x = rect.x;
		}
		y = rect.y + (rect.height - tImageH)/2;
		progressContainer.y = y;
	    }
	    
	    tImage.x = x;
	    tImage.y = y;
	    tImage.scrollRect = new Rectangle(x,y,width,height);
	}
	
	public function getPrefix():String
	{
            return XUtils.getSkinID(slider);
	}
	
	override protected function getPropertyPrefix():String {
	    return getPrefix();
	}
	
	override public function getPreferredSize(c:Component):IntDimension{
	    var rect:IntRectangle = XUtils.getRectang(slider);
	    return rect.getSize();
	}
    }
}

import org.aswing.Component;
import org.aswing.skinbuilder.OrientableThumb;

class XSliderThumb extends OrientableThumb
{
    private var p:String;

    public function XSliderThumb(pp:String)
    {
	p = pp;
    }

    override protected function getPropertyPrefix():String
    {
	return p;
    }
    
    override protected function paint():void{
	super.paint();
    }
}
