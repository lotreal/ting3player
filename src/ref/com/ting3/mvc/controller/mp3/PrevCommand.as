package com.ting3.mvc.controller.mp3 
{
    import org.puremvc.as3.multicore.interfaces.INotification;
    
    import com.ting3.mvc.controller.BasicCommand;
    /**
    * ...
    * 播放上一首歌命令
    * @author tangzx <com.ting3>
    */
    public class PrevCommand extends BasicCommand
    {
	
	public function PrevCommand() 
	{
	    
	}
	
	override public function execute(notification:INotification):void 
	{
	    this.getListProxy().selectPrevSong();
	    this.getMp3CoreProxy().playSong(getListProxy().getCurrentSong());
	}
	
    }

}
