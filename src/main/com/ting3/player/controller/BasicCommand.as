package com.ting3.player.controller 
{
    import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
    import com.ting3.player.model.ConfigProxy;
    import com.ting3.player.model.MP3PlayCoreProxy;

    public class BasicCommand extends SimpleCommand
    {
	
	public function BasicCommand() 
	{
	}

	public function getConfigProxy():ConfigProxy {
	    return facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
	}
	
	public function getMp3CoreProxy():MP3PlayCoreProxy {
	    return facade.retrieveProxy(MP3PlayCoreProxy.NAME) as MP3PlayCoreProxy;
	}

	// public function getListProxy():MP3ListProxy {
	//     return facade.retrieveProxy(MP3ListProxy.NAME) as MP3ListProxy;
	// }
    }
}
