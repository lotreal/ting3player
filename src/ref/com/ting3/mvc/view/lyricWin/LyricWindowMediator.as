package com.ting3.mvc.view.lyricWin
{
    import org.puremvc.as3.multicore.interfaces.INotification;
    
    import com.ting3.component.board.LyricWindow;
    import com.ting3.component.board.PlayerWindow;
    import com.ting3.geom.Song;
    import com.ting3.mvc.Signal;
    import com.ting3.mvc.view.BasicMediator;
    
    public class LyricWindowMediator extends BasicMediator
    {
	public static const NAME:String = "LyricWindowMediator";
	
	private var lyricWin:LyricWindow;
	private var playerWin:PlayerWindow;
	
	public function LyricWindowMediator(win:LyricWindow, playWin:PlayerWindow) {
	    super(NAME);
	    
	    lyricWin = win;
	    playerWin = playWin;
	    
	    init();
	}
	
	private function init():void{
	    lyricWin.getLyric().setModel(playerWin.getProgress().getModel());
	}
	
	override public function listNotificationInterests():Array {
	    return [Signal.APP_PLAY_BEGIN];
	}
	
	override public function handleNotification(note:INotification):void{
	    switch(note.getName()){
		case Signal.APP_PLAY_BEGIN:
		var s:Song = note.getBody() as Song;
		lyricWin.getLyric().loadLrc(s);
		break;
	    }
	}
	
	
    }
}
