package com.ting3.player.controller 
{
    import tao.debugger.Console;

    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    
    import org.aswing.JOptionPane;
    import org.puremvc.as3.multicore.interfaces.INotification;
    
    import com.ting3.player.model.ConfigProxy;
    import com.ting3.player.model.SkinProxy;
    
    public class SkinCommand extends BasicCommand
    {
	private var loader: URLLoader;
	private var configProxy: ConfigProxy;
	
	public function SkinCommand() 
	{
	    loader = new URLLoader;
	    loader.dataFormat = URLLoaderDataFormat.BINARY;
	    loader.addEventListener(Event.COMPLETE, onLoadComplete);
	    loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
	    loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
	}
	
	override public function execute(notification:INotification):void 
	{
	    configProxy = facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
            var url:String = configProxy.getSkinUrl(String(notification.getBody()));
            Console.log(this, 'skin loading...' + url);
	    loader.load(new URLRequest(url));
	}
	
	private function onLoadComplete(e:Event):void
        {
	    var ba:ByteArray = loader.data;
	    configProxy = facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
	    var skinProxy:SkinProxy = facade.retrieveProxy(SkinProxy.NAME) as SkinProxy;
	    skinProxy.loadSkin(ba);
	}
	
	private function onLoadError(e:Event):void
        {
	    JOptionPane.showMessageDialog("错误", "无效的皮肤，加载失败.");
	}
	
	private function onProgress(e:ProgressEvent):void
        {
	    var p:Number = (e.bytesLoaded / e.bytesTotal) * 100;
	}
    }
}
