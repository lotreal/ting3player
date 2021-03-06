﻿package com.ting3.component.lookAndFeel.playerWindow
{
    import flash.display.Bitmap;
    import flash.display.Sprite;
    
    import org.aswing.AssetBackground;
    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    
    import com.ting3.component.board.PlayerWindow;
    import com.ting3.component.lookAndFeel.XComponentUI;
    
    public class PlayerWindowUI extends XComponentUI
    {
	private var window:PlayerWindow;
	private var groundAsset:Bitmap;
	
	public function PlayerWindowUI()
	{
	    super();
	}
	
	override public function installUI(c:Component) : void {
	    window = PlayerWindow(c);
	    var pp:String = this.getPrefix();
	    
	    groundAsset = new Bitmap(this.getBitmapData(pp + "background"));
	    var s:Sprite = new Sprite;
	    s.addChild(groundAsset);
	    window.setBackgroundDecorator(new AssetBackground(s));

	    installListeners();
	}
	
	private function installListeners():void{
	}
	
	override public function uninstallUI(c:Component) : void {
	    window.setBackgroundDecorator(null);
	}
	
	override public function getPrefix():String {
	    return "PlayerWindow.";
	}
	
	override public function getPreferredSize(c:Component) : IntDimension {
	    return new IntDimension(groundAsset.width, groundAsset.height);
	}
    }
}
