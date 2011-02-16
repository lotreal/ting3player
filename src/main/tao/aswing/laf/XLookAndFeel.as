package tao.aswing.laf
{
    import tao.debugger.Console;

    import flash.display.BitmapData;
    
    import org.aswing.JLabel;
    import org.aswing.UIDefaults;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.ASColorUIResource;
    import org.aswing.plaf.ASFontUIResource;
    import org.aswing.plaf.basic.BasicLookAndFeel;
    import org.aswing.skinbuilder.SkinMenuItemBackground;
    
    import tao.geom.MRectangle;
    
    public class XLookAndFeel extends BasicLookAndFeel
    {
	private var skinProxy:IXmlSkin;
	
	public function XLookAndFeel(skinProxy:IXmlSkin)
	{
	    this.skinProxy = skinProxy;
	    super();
	}
	
	override protected function initClassDefaults(table:UIDefaults):void {
	    super.initClassDefaults(table);
	    var classDefaults:Array = [
		"XButtonUI",       XButtonUI,
                "XLyricUI",        XLyricUI,
                "XRateUI",         XRateUI,
		"XSliderUI",       XSliderUI,
		"XToggleButtonUI", XToggleButtonUI,
	    ];
	    
	    table.putDefaults(classDefaults);
	}
	
	override protected function initComponentDefaults(table:UIDefaults):void {
	    super.initComponentDefaults(table);
	    var skinXml:XML = skinProxy.getSkinXml();
	    var lyricXml:XML = skinProxy.getLyricXml();
	    var lyricWinXML:XML = skinXml.lyric_window[0];
	    
	    //菜单
	    var skinDefaults:Array = [
		// "MenuItem.rolloverImage", MenuItem_rolloverImage, 
		// "MenuItem.pressedImage", MenuItem_rolloverImage, 
		// "MenuItem.bg", SkinMenuItemBackground,
		
		// "PopupMenu.bgImage", PopupMenu_bgImage, 
		// "PopupMenu.bg", MPopupMenuBackground,
		// "PopupMenu.opaque", false,
		// "PopupMenu.border", MPopupMenuBorder,
	    ];
	    table.putDefaults(skinDefaults);

	    var playerWindowXml:XML = skinXml.player_window[0];

	    //player window:
	    skinDefaults = [
		"PlayerWindow.background", getBitmap(playerWindowXml.@image),
		//play
		"XButtonUI.play.image", getBitmap(playerWindowXml.play.@image),
		"XButtonUI.play.position", parseRect(playerWindowXml.play.@position),

		//pause
		"XButtonUI.pause.image", getBitmap(playerWindowXml.pause.@image),
		"XButtonUI.pause.position", parseRect(playerWindowXml.pause.@position),
		//next
		"XButtonUI.next.image", getBitmap(playerWindowXml.next.@image),
		"XButtonUI.next.position", parseRect(playerWindowXml.next.@position),
		//stop
		"XButtonUI.stop.image", getBitmap(playerWindowXml.stop.@image),
		"XButtonUI.stop.position", parseRect(playerWindowXml.stop.@position),
		//prev
		"XButtonUI.prev.image", getBitmap(playerWindowXml.prev.@image),
		"XButtonUI.prev.position", parseRect(playerWindowXml.prev.@position),

		"XSliderUI.normal.progress.position", parseRect(playerWindowXml.progress.@position),
		"XSliderUI.normal.progress.barImage", getBitmap(playerWindowXml.progress.@bar_image),
		"XSliderUI.normal.progress.thumbImage", getBitmap(playerWindowXml.progress.@thumb_image),
		"XSliderUI.normal.progress.fillImage", getBitmap(playerWindowXml.progress.@fill_image),
		"XSliderUI.normal.progress.vertical", String(playerWindowXml.progress.@vertical).toLocaleLowerCase() == "true",
		"XSliderUI.normal.volume.position", parseRect(playerWindowXml.volume.@position),
		"XSliderUI.normal.volume.barImage", getBitmap(playerWindowXml.volume.@bar_image),
		"XSliderUI.normal.volume.thumbImage", getBitmap(playerWindowXml.volume.@thumb_image),
		"XSliderUI.normal.volume.fillImage", getBitmap(playerWindowXml.volume.@fill_image),
		"XSliderUI.normal.volume.vertical", String(playerWindowXml.volume.@vertical).toLocaleLowerCase() == "true",
		
		"XToggleButtonUI.normal.mute.image", getBitmap(playerWindowXml.mute.@image),
		"XToggleButtonUI.normal.mute.position", parseRect(playerWindowXml.mute.@position),

		"XToggleButtonUI.rate.image", getBitmap(playerWindowXml.star.@image),		
		"LyricWindow.background", getBitmap(lyricWinXML.@image),
		"LyricWindow.position", parseRect(lyricWinXML.@position),
		"LyricWindow.resizeRect", parseRect(lyricWinXML.@resize_rect),
		
		"XLyricUI.default.position", parseRect(lyricWinXML.lyric.@position),

		"XLyricUI.default.textColor", parseColor(lyricXml.lyric.@textcolor),
		"XLyricUI.default.hilightColor", parseColor(lyricXml.lyric.@hilightcolor),

	    ];
	    table.putDefaults(skinDefaults);
	}

	private function getBitmap(fileName:String):BitmapData{
	    return skinProxy.getBitmap(fileName);
	}
	
	private function parseRect(s:String):IntRectangle{
	    return MRectangle.create(s);
	}
	
	private function parseColor(vStr:String):ASColorUIResource {
	    var v:uint = uint("0x" + vStr.split("#").join(""));
	    return new ASColorUIResource(v);
	}
    }
}
