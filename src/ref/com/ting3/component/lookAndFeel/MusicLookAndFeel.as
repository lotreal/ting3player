package com.ting3.component.lookAndFeel
{
    import flash.display.BitmapData;
    
    import org.aswing.JLabel;
    import org.aswing.UIDefaults;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.ASColorUIResource;
    import org.aswing.plaf.ASFontUIResource;
    import org.aswing.plaf.basic.BasicLookAndFeel;
    import org.aswing.skinbuilder.SkinMenuItemBackground;
    
    import com.ting3.component.lookAndFeel.lyricWindow.LyricUI;
    import com.ting3.component.lookAndFeel.playerWindow.LedUI;
    import com.ting3.component.lookAndFeel.playerWindow.PlayerWindowUI;
    import com.ting3.component.lookAndFeel.playerWindow.SongInfoUI;
    import com.ting3.component.lookAndFeel.playlistWindow.MPlayListWindowUI;
    import com.ting3.component.lookAndFeel.playlistWindow.MToolBarUI;
    import com.ting3.geom.MRectangle;
    import com.ting3.mvc.model.SkinLoaderProxy;
    
    public class MusicLookAndFeel extends BasicLookAndFeel
    {
	private var skinProxy:SkinLoaderProxy;
	
	public function MusicLookAndFeel(skinProxy:SkinLoaderProxy)
	{
	    this.skinProxy = skinProxy;
	    super();
	}
	
	override protected function initClassDefaults(table:UIDefaults):void {
	    super.initClassDefaults(table);
	    var classDefaults:Array = [
		"PlayerWindowUI", 	PlayerWindowUI, 
		"PlayListWindowUI", 	MPlayListWindowUI,
		"MiniWindowUI", 		MiniWindowUI,
		"LyricWindowUI",		MLyricWindowUI,
		"XButtonUI", 			XButtonUI,
		//splitPane
		"SplitPaneUI", 		SplitPaneUI,
		//led:
		"LedUI", 	LedUI,
		//info:
		"InfoUI", 	SongInfoUI,
		//MLabel
		"MLabelUI", 	MLabelUI,
		//slider:
		"XSliderUI",	XSliderUI,
		//togglebutton
		"XToggleButtonUI", 	XToggleButtonUI,
		//scrollbar:
		"ScrollBarUI", 		ScrollBarUI,
		//ToolBar:
		"ToolBarUI", 			MToolBarUI,
		//歌词
		"LyricUI", 			LyricUI,
	    ];
	    
	    table.putDefaults(classDefaults);
	}
	
	[Embed(source="assets/MenuItem_rolloverImage.png", scaleGridTop="11", scaleGridBottom="12", scaleGridLeft="6", scaleGridRight="51")]
	private var MenuItem_rolloverImage:Class;
	
	[Embed(source="assets/Menu_bg.png", scaleGridTop="7", scaleGridBottom="150", scaleGridLeft="30", scaleGridRight="40")]
	private var PopupMenu_bgImage:Class;
	
	override protected function initComponentDefaults(table:UIDefaults):void {
	    super.initComponentDefaults(table);
	    
	    var skinXml:XML = skinProxy.getSkinXml();
	    
	    //菜单
	    var skinDefaults:Array = [
		"MenuItem.rolloverImage", MenuItem_rolloverImage, 
		"MenuItem.pressedImage", MenuItem_rolloverImage, 
		"MenuItem.bg", SkinMenuItemBackground,
		
		"PopupMenu.bgImage", PopupMenu_bgImage, 
		"PopupMenu.bg", MPopupMenuBackground,
		"PopupMenu.opaque", false,
		"PopupMenu.border", MPopupMenuBorder,
	    ];
	    table.putDefaults(skinDefaults);
	    
	    var playerWindowXml:XML = skinXml.player_window[0];
	    //player window:
	    skinDefaults = [
		"PlayerWindow.background", 	skinProxy.getBitmap(playerWindowXml.@image),
		//play
		"XButton.play.image", 		getBitmap(playerWindowXml.play.@image),
		"XButton.play.position", 	parseRect(playerWindowXml.play.@position),
		//pause
		"XButton.pause.image", 		getBitmap(playerWindowXml.pause.@image),
		"XButton.pause.position", 	parseRect(playerWindowXml.pause.@position),
		//next
		"XButton.next.image", 		getBitmap(playerWindowXml.next.@image),
		"XButton.next.position", 	parseRect(playerWindowXml.next.@position),
		//stop
		"XButton.stop.image", 		getBitmap(playerWindowXml.stop.@image),
		"XButton.stop.position", 	parseRect(playerWindowXml.stop.@position),
		//prev
		"XButton.prev.image", 		getBitmap(playerWindowXml.prev.@image),
		"XButton.prev.position", 	parseRect(playerWindowXml.prev.@position),
		//exit
		"XButton.exit.image", 		getBitmap(playerWindowXml.exit.@image),
		"XButton.exit.position", 	parseRect(playerWindowXml.exit.@position),
		//minimize
		"XButton.minimize.image", 		getBitmap(playerWindowXml.minimize.@image),
		"XButton.minimize.position", 	parseRect(playerWindowXml.minimize.@position),
		//minimode
		"XButton.minimode.image", 		getBitmap(playerWindowXml.minimode.@image),
		"XButton.minimode.position", 	parseRect(playerWindowXml.minimode.@position),
		
		
		"Led.normal.position", 		parseRect(playerWindowXml.led.@position),
		"Led.normal.numberImage", 	getBitmap(playerWindowXml.led.@image),
		"Led.normal.align", 			String(playerWindowXml.led.@align),
		
		"Info.normal.position", 	parseRect(playerWindowXml.info.@position),
		"Info.normal.color",		parseColor(playerWindowXml.info.@color),
		"Info.font", 				new ASFontUIResource("宋体", playerWindowXml.info.@font_size),
		
		"MLabel.stereo.position", 	parseRect(playerWindowXml.stereo.@position),
		"MLabel.stereo.align", 		playerWindowXml.stereo.@align == "right" ? JLabel.RIGHT : JLabel.LEFT,
		"MLabel.stereo.color", 		parseColor(playerWindowXml.stereo.@color),
		
		"MLabel.status.position", 	parseRect(playerWindowXml.status.@position),
		"MLabel.status.align", 		playerWindowXml.status.@align == "right" ? JLabel.RIGHT : JLabel.LEFT,
		"MLabel.status.color", 		parseColor(playerWindowXml.status.@color),
		
		"XSlider.normal.progress.position", 	parseRect(playerWindowXml.progress.@position),
		"XSlider.normal.progress.barImage", 	getBitmap(playerWindowXml.progress.@bar_image),
		"XSlider.normal.progress.thumbImage", 	getBitmap(playerWindowXml.progress.@thumb_image),
		"XSlider.normal.progress.fillImage", 	getBitmap(playerWindowXml.progress.@fill_image),
		"XSlider.normal.progress.vertical", 	String(playerWindowXml.progress.@vertical).toLocaleLowerCase() == "true",
		"XSlider.normal.volume.position", 		parseRect(playerWindowXml.volume.@position),
		"XSlider.normal.volume.barImage", 		getBitmap(playerWindowXml.volume.@bar_image),
		"XSlider.normal.volume.thumbImage", 	getBitmap(playerWindowXml.volume.@thumb_image),
		"XSlider.normal.volume.fillImage", 		getBitmap(playerWindowXml.volume.@fill_image),
		"XSlider.normal.volume.vertical", 		String(playerWindowXml.volume.@vertical).toLocaleLowerCase() == "true",
		
		"XToggleButton.normal.mute.image", 		getBitmap(playerWindowXml.mute.@image),
		"XToggleButton.normal.mute.position", 	parseRect(playerWindowXml.mute.@position),
		
	    ];
	    table.putDefaults(skinDefaults);
	    
	    /*
	    * 歌曲列表窗体部分
	    * 
	    */
	    var playlistXML:XML = skinXml.playlist_window[0];
	    var listCfgXML:XML = skinProxy.getListXml().playlist[0];
	    skinDefaults = [
		"PlayListWindow.background", 			getBitmap(playlistXML.@image),
		"PlayListWindow.position", 				parseRect(playlistXML.@position),
		"PlayListWindow.resizeRect", 			parseRect(playlistXML.@resize_rect),
		"PlayListWindow.list.position", 		parseRect(playlistXML.playlist.@position),
		"PlayListWindow.list.selectedImage", 	getBitmap(playlistXML.playlist.@selected_image),
		"PlayListWindow.list.colorText", 		parseColor(listCfgXML.@color_text),
		"PlayListWindow.list.colorHilight", 	parseColor(listCfgXML.@color_hilight),
		"PlayListWindow.list.colorBkgnd", 		parseColor(listCfgXML.@color_bkgnd),
		"PlayListWindow.list.colorBkgnd2", 		parseColor(listCfgXML.@color_bkgnd2),
		"PlayListWindow.list.colorSelect", 		parseColor(listCfgXML.@color_select),
		//close button:
		"XButton.playListWindow.close.image",		getBitmap(playlistXML.close.@image),
		"XButton.playListWindow.close.position", 	parseRect(playlistXML.close.@position),
		"XButton.playListWindow.close.align", 		String(playlistXML.close.@align),
		
		"ScrollBarUI.buttonsImage", 	getBitmap(playlistXML.scrollbar.@buttons_image),
		"ScrollBarUI.thumbImage", 	getBitmap(playlistXML.scrollbar.@thumb_image),
		"ScrollBarUI.barImage", 		getBitmap(playlistXML.scrollbar.@bar_image),
		
		"ToolBar.position",	parseRect(playlistXML.toolbar.@position),
		"ToolBar.image",		getBitmap(playlistXML.toolbar.@image),
		"ToolBar.hotImage",	getBitmap(playlistXML.toolbar.@hot_image),
		"ToolBar.align", 		playlistXML.toolbar.@align,
	    ];
	    table.putDefaults(skinDefaults);
	    
	    /* 
	    *	歌词窗体部分
	    */
	    var lyricWinXML:XML = skinXml.lyric_window[0];
	    var lyricXML:XML = skinProxy.getLyricXML();
	    
	    skinDefaults = [
		"LyricWindow.background", 	getBitmap(lyricWinXML.@image),
		"LyricWindow.position", 		parseRect(lyricWinXML.@position),
		"LyricWindow.resizeRect", 	parseRect(lyricWinXML.@resize_rect),
		
		"Lyric.position", 		parseRect(lyricWinXML.lyric.@position),
		"Lyric.textColor", 		parseColor(lyricXML.lyric.@textcolor),
		"Lyric.hilightColor", 	parseColor(lyricXML.lyric.@hilightcolor),
		
		//close button:
		"XButton.lyric.close.image", 		getBitmap(lyricWinXML.close.@image),
		"XButton.lyric.close.position", 	parseRect(lyricWinXML.close.@position),
		"XButton.lyric.close.align", 		String(lyricWinXML.close.@align)
	    ];
	    table.putDefaults(skinDefaults);
	    
	    var miniXML:XML = skinXml.mini_window[0];
	    //mini window:
	    skinDefaults = [
		"MiniWindow.image", getBitmap(miniXML.@image),
		
		"XButton.mini.play.image", 				getBitmap(miniXML.play.@image),
		"XButton.mini.play.position", 			parseRect(miniXML.play.@position),
		
		"XButton.mini.pause.image", 				getBitmap(miniXML.pause.@image),
		"XButton.mini.pause.position", 			parseRect(miniXML.pause.@position),
		
		"XButton.mini.stop.image", 				getBitmap(miniXML.stop.@image),
		"XButton.mini.stop.position", 			parseRect(miniXML.stop.@position),
		
		"XButton.mini.pause.image", 				getBitmap(miniXML.pause.@image),
		"XButton.mini.pause.position", 			parseRect(miniXML.pause.@position),
		
		"XButton.mini.next.image", 				getBitmap(miniXML.next.@image),
		"XButton.mini.next.position",			parseRect(miniXML.next.@position),
		
		"XButton.mini.prev.image", 				getBitmap(miniXML.prev.@image),
		"XButton.mini.prev.position", 			parseRect(miniXML.prev.@position),
		
		"XButton.mini.exit.image", 				getBitmap(miniXML.exit.@image),
		"XButton.mini.exit.position", 			parseRect(miniXML.exit.@position),
		
		"XButton.mini.minimode.image", 			getBitmap(miniXML.minimode.@image),
		"XButton.mini.minimode.position", 		parseRect(miniXML.minimode.@position),
		
		"XButton.mini.minimize.image", 			getBitmap(miniXML.minimize.@image),
		"XButton.mini.minimize.position", 		parseRect(miniXML.minimize.@position),
		
		"XButton.mini.lyric.image", 				getBitmap(miniXML.lyric.@image),
		"XButton.mini.lyric.position", 			parseRect(miniXML.lyric.@position),
		
		"Info.mini.position", 	parseRect(miniXML.info.@position),
		"Info.mini.color", 		parseColor(miniXML.info.@color),
		
		"Led.mini.position", 		parseRect(miniXML.led.@position),
		"Led.mini.numberImage", 	getBitmap(miniXML.led.@image),
		"Led.mini.align", 		String(miniXML.led.@align),
		
		"XSlider.mini.progress.position", 		parseRect(miniXML.progress.@position),
		"XSlider.mini.progress.barImage", 		getBitmap(miniXML.progress.@bar_image),
		"XSlider.mini.progress.thumbImage", 	getBitmap(miniXML.progress.@thumb_image),
		"XSlider.mini.progress.fillImage", 		getBitmap(miniXML.progress.@fill_image),
		"XSlider.mini.progress.vertical", 		String(miniXML.progress.@vertical).toLocaleLowerCase() == "true",
		"XSlider.mini.volume.position", 		parseRect(miniXML.volume.@position),
		"XSlider.mini.volume.barImage", 		getBitmap(miniXML.volume.@bar_image),
		"XSlider.mini.volume.thumbImage", 		getBitmap(miniXML.volume.@thumb_image),
		"XSlider.mini.volume.fillImage",		getBitmap(miniXML.volume.@fill_image),
		"XSlider.mini.volume.vertical", 		String(miniXML.volume.@vertical).toLocaleLowerCase() == "true",
		
		//静音按钮
		"XToggleButton.mini.mute.image", 		getBitmap(miniXML.mute.@image),
		"XToggleButton.mini.mute.position", 	parseRect(miniXML.mute.@position),
	    ];
	    
	    table.putDefaults(skinDefaults);
	}
	0
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
