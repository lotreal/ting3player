package com.ting3.mvc.controller.startup
{
    import org.puremvc.as3.multicore.interfaces.INotification;
    import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
    
    import com.ting3.mvc.Signal;
    import com.ting3.mvc.model.ConfigProxy;
    import com.ting3.mvc.view.AppMediator;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class InitializeAppCommand extends AsyncCommand
    {
	
	public function InitializeAppCommand() 
	{
	    
	}
	
	
	override public function execute(notification:INotification):void 
	{
	    var app:Main = notification.getBody().app as Main;
	    facade.registerMediator(new AppMediator(app));
	    
	    //app ready
	    this.sendNotification(Signal.APP_READY);
	    //换上黙认皮肤
	    var configProxy:ConfigProxy = facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
	    this.sendNotification(Signal.APP_SET_SKIN, configProxy.getDefaultSkinID());
	}
	
    }

}
