package com.ting3.player.view
{
    import tao.debugger.Console;
    import com.ting3.player.Signal;

    import tao.aswing.XLyric;
    import org.puremvc.as3.multicore.interfaces.INotification;
    import com.ting3.player.model.vo.TrackVO;

    public class LyricMediator extends BasicMediator
    {
	public static const NAME:String = 'LyricMediator';
        private var lyric:XLyric;

	public function LyricMediator(viewComponent:XLyric)
        {
            super(NAME, viewComponent);
            lyric = viewComponent;
        }

	override public function onRegister():void
        {
	    lyric.setModel(getModelProxy().progress);
        }

	override public function listNotificationInterests():Array
        {
	    return [Signal.APP_PLAY_BEGIN];
	}
	
	override public function handleNotification(note:INotification):void
        {
	    switch(note.getName()){
		case Signal.APP_PLAY_BEGIN:
                var t:TrackVO = note.getBody() as TrackVO;
                lyric.loadLrc(t.lyric);
		break;
	    }
	}
    }
}
