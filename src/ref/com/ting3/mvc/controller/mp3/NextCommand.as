package com.ting3.mvc.controller.mp3 
{
    import org.puremvc.as3.multicore.interfaces.INotification;
    
    import com.ting3.mvc.controller.BasicCommand;
    
    /**
    * ...
    * 下一曲命令
    * @author tangzx <com.ting3>
    */
    public class NextCommand extends BasicCommand
    {
	
	public function NextCommand() 
	{
	    
	}
	
	override public function execute(notification:INotification):void {
	    this.getListProxy().selectNextSong();
	    this.getMp3CoreProxy().playSong(getListProxy().getCurrentSong());
	}
	
    }

}
