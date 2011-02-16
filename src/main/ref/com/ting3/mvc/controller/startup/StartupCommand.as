package com.ting3.mvc.controller.startup
{
    import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class StartupCommand extends AsyncMacroCommand
    {
	public function StartupCommand():void {
	    this.addSubCommand(LoadConfigCommand);
	    this.addSubCommand(LoadPlaylistCommand);
	    this.addSubCommand(InitializeAppCommand);
	}
    }

}
