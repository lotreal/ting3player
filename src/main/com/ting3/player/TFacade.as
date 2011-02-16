package com.ting3.player
{
    import tao.debugger.Console;

    import org.puremvc.as3.multicore.patterns.facade.Facade;
    
    import com.ting3.player.controller.StartupCommand;
    import com.ting3.player.controller.LoadConfigCommand;
    import com.ting3.player.controller.LoadTracklistCommand;
    import com.ting3.player.controller.PlayCommand;
    import com.ting3.player.controller.SkinCommand;

    import com.ting3.player.model.ConfigProxy;
    import com.ting3.player.model.TracklistProxy;
    import com.ting3.player.model.MP3PlayCoreProxy;
    import com.ting3.player.model.SkinProxy;
    import com.ting3.player.model.ComponentsModelProxy;
    
    public class TFacade extends Facade
    {
	public function TFacade(key:String) 
	{
	    super(key);
	}
	
	override protected function initializeController():void 
	{
	    super.initializeController();
	    this.registerCommand(Signal.APP_STARTUP, StartupCommand);
	    this.registerCommand(Signal.APP_CONFIG_LOAD, LoadConfigCommand);
	    this.registerCommand(Signal.APP_TRACKLIST_LOAD, LoadTracklistCommand);

	    this.registerCommand(Signal.APP_PLAY, PlayCommand);

	    this.registerCommand(Signal.APP_SET_SKIN, SkinCommand);
	}
	
	
	override protected function initializeModel():void 
	{
	    super.initializeModel();
	    this.registerProxy(new ConfigProxy());
	    this.registerProxy(new TracklistProxy());
	    this.registerProxy(new MP3PlayCoreProxy());
	    this.registerProxy(new SkinProxy());
	    this.registerProxy(new SkinProxy());
	    this.registerProxy(new ComponentsModelProxy());
	}
	
	
	public function startup(app:Main):void {
	    this.sendNotification(Signal.APP_STARTUP, {
                    app: app,
                    config: "../assets/my/player/config" 
                });
	}
    }
}
