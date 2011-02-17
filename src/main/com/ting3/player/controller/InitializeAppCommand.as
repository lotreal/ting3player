package com.ting3.player.controller
{
    import org.puremvc.as3.multicore.interfaces.INotification;
    import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
    
    import com.ting3.player.Signal;
    import com.ting3.player.model.ConfigProxy;
    import com.ting3.player.view.AppMediator;
    
    public class InitializeAppCommand extends AsyncCommand
    {
	override public function execute(notification:INotification):void 
	{
	    var app:Main = notification.getBody().app as Main;
	    facade.registerMediator(new AppMediator(app));
	    // var configProxy:ConfigProxy = facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
	    this.sendNotification(Signal.APP_SET_SKIN, 'test');
	    // this.sendNotification(Signal.APP_SET_SKIN, configProxy.getDefaultSkinID());
	}
	
    }

}
