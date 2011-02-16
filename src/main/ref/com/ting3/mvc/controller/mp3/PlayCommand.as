package com.ting3.mvc.controller.mp3 
{
    import org.puremvc.as3.multicore.interfaces.INotification;
    
    import com.ting3.geom.Song;
    import com.ting3.mvc.controller.BasicCommand;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class PlayCommand extends BasicCommand
    {
	
	public function PlayCommand() 
	{
	    
	}
	
	
	override public function execute(note:INotification):void 
	{
	    var s:Song = note.getBody() as Song;
	    
	    if (s != null) {
		getMp3CoreProxy().playSong(s);
	    }else {
		if (getMp3CoreProxy().isPause()) {
		    getMp3CoreProxy().play();
		}else {
		    getListProxy().selectDefaultSong();
		    getMp3CoreProxy().playSong(getListProxy().getCurrentSong());
		}
	    }
	}
	
    }

}
