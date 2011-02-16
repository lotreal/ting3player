package com.ting3.player.controller
{
    import tao.debugger.Console;

    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import org.puremvc.as3.multicore.interfaces.INotification;
    import org.puremvc.as3.multicore.patterns.command.AsyncCommand; 
    import com.ting3.player.model.ConfigProxy;
    import com.ting3.player.Signal;
    import flash.display.LoaderInfo;
    
    public class LoadConfigCommand extends AsyncCommand
    {
	private var application: Main;
	private var loader: URLLoader;

	public function LoadConfigCommand() 
	{
	    loader = new URLLoader;
	    loader.addEventListener(Event.COMPLETE, onLoadComplete);
	}

	override public function execute(notification:INotification):void 
	{
	    loader.load(new URLRequest(notification.getBody().config));
            application = notification.getBody().app as Main;
	}
	
	private function onLoadComplete(e:Event):void 
	{
	    var configProxy:ConfigProxy = facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
            configProxy.setXML(new XML(loader.data));
            loadConfigFromFlashvars(application);
	    sendNotification(Signal.APP_CONFIG_LOADED);
	    this.commandComplete();
	}

        private function loadConfigFromFlashvars(app:Main):void {
	    var params:Object = LoaderInfo(app.loaderInfo).parameters;
            // Console.log(this, params);
        }
    }
}
