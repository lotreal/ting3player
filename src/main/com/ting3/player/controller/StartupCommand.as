package com.ting3.player.controller
{
    import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

    public class StartupCommand extends AsyncMacroCommand
    {
        public function StartupCommand()
        {
	    this.addSubCommand(LoadConfigCommand);
	    this.addSubCommand(InitializeAppCommand);
        }
    }
}
