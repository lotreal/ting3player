package  com.ting3.player.controller
{
    import tao.debugger.Console;
    import org.puremvc.as3.multicore.interfaces.INotification;
    import com.ting3.player.model.vo.TrackVO;
    
    public class PlayCommand extends BasicCommand
    {
	
	public function PlayCommand() 
	{
	    
	}
	
	
	override public function execute(note:INotification):void 
	{
	    var s:TrackVO = note.getBody() as TrackVO;
	    if (s != null) 
            {
		getMp3CoreProxy().playSong(s);
	    }
            else {
        	if (getMp3CoreProxy().isPause())
                {
        	    getMp3CoreProxy().play();
        	}
                // else
                // {
        	//     getListProxy().selectDefaultSong();
        	//     getMp3CoreProxy().playSong(getListProxy().getCurrentSong());
        	// }
            }
	}
	
    }

}
