package com.ting3.mvc 
{

    import tao.debugger.Console;

    import org.puremvc.as3.multicore.patterns.facade.Facade;
    
    import com.ting3.mvc.controller.*;
    import com.ting3.mvc.controller.mp3.*;
    import com.ting3.mvc.controller.startup.*;
    import com.ting3.mvc.model.*;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class MFacade extends Facade
    {
	
	public function MFacade(key:String) 
	{
	    super(key);
	}
	
	
	override protected function initializeController():void 
	{
	    super.initializeController();
	    //换肤命令
	    this.registerCommand(Signal.APP_SET_SKIN,	ReskinCommand);
	    this.registerCommand(Signal.APP_STARTUP, 		StartupCommand);
	    //播放器命令
	    this.registerCommand(Signal.APP_PLAY,			PlayCommand);
	    this.registerCommand(Signal.APP_PREV,			PrevCommand);
	    this.registerCommand(Signal.APP_NEXT,			NextCommand);
	}
	
	
	override protected function initializeModel():void 
	{
	    super.initializeModel();
	    this.registerProxy(new MP3ListProxy);
	    this.registerProxy(new ConfigProxy);
	    this.registerProxy(new MP3PlayCoreProxy);
	    this.registerProxy(new SkinLoaderProxy);
	    this.registerProxy(new ComponentsModelProxy);
	}
	
	
	public function startup(app:Main):void {
	    Console.log(this, "read config");
	    this.sendNotification(Signal.APP_STARTUP, { app:app, config:"config.xml", playlist:"list.xml"});
	    /*this.sendNotification(Signal.APP_STARTUP, { app:app, 
	            config:"http://www.you-gogo.com/jsp/game/qqm/config.xml",
	            playlist:"http://www.you-gogo.com/jsp/game/qqm/list.xml"});*/
	}
	
	
    }

}
