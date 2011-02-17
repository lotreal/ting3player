package com.ting3.player.view
{
    import tao.debugger.Console;
    import flash.events.Event;
    import com.ting3.player.Signal;
    import com.ting3.player.gui.Player;

    import org.aswing.event.InteractiveEvent;
    import org.aswing.event.SelectionEvent;
    import org.puremvc.as3.multicore.interfaces.INotification;
    import org.aswing.VectorListModel;

    import tao.aswing.XSlider;
    import tao.aswing.XToggleButton;
    import tao.aswing.event.ListItemActionEvent;
    import com.ting3.player.view.TracklistMediator;

    public class PlayerMediator extends BasicMediator
    {
	public static const NAME:String = 'PlayerMediator';

	protected function get player(): Player
	{
	    return viewComponent as Player;
	}

	public function PlayerMediator(viewComponent:Player)
        {
            super(NAME, viewComponent);
        }
	
        override public function onRegister():void{
            getModelProxy().progress = player.getProgress().getModel();

	    player.getVolumeBar().addStateListener(onChangeVolume);
	    player.getProgress().addStateListener(onSeek);
	    
	    player.getButtonPause().setModel(getModelProxy().getPauseModel());
	    player.getButtonPause().addActionListener(pauseMP3);
	    
	    player.getButtonPlay().setModel(getModelProxy().getPlayModel());
	    player.getButtonPlay().addActionListener(playMP3);
	    
	    player.getButtonNext().setModel(getModelProxy().getNextModel());
	    player.getButtonNext().addActionListener(nextMP3);
	    
	    player.getButtonPrev().setModel(getModelProxy().getPrevModel());
	    player.getButtonPrev().addActionListener(prevMP3);
	    
	    // player.getButtonStop().setModel(getModelProxy().getStopModel());
	    // player.getButtonStop().addActionListener(stopMP3);
	    
	    player.getButtonMute().setModel(getModelProxy().getMuteModel());
	    player.getButtonMute().addSelectionListener(switchMute);
	    
	    // player.getInfo().setModel(getModelProxy().getSongInfoModel());
	    
	    // player.getButtonMini().addActionListener(switchToMini);
	    // //初始化音量大小
	    // player.getVolumeBar().setValue(getPlayCoreProxy().getVolume() * 100);
	    // player.getProgress().setModel(getPlayCoreProxy().getTimeModel());
	    // player.getLed().setModel(getPlayCoreProxy().getTimeModel());
	    updateUI();

        }

	override public function listNotificationInterests() : Array {
	    return [
                Signal.APP_PLAYING,
                Signal.APP_PLAY_BEGIN,
                Signal.APP_TRACK_LOADING,
                Signal.APP_STATUS_CHANGED,
            ];
	}
	
	override public function handleNotification(note:INotification) : void {
	    switch(note.getName()){
		case Signal.APP_TRACK_LOADING:
                    onTrackLoading(note);
		case Signal.APP_PLAY_BEGIN:
                    onPlayBegin(note);
		case Signal.APP_PLAYING:
		    onPlayProgress();
		    break;
		case Signal.APP_STATUS_CHANGED:
		    updateUI();
		    break;
	    }
	}

	private function updateUI():void{
	    // player.getProgress().setEnabled(!getPlayCoreProxy().isStop());
	    // player.getButtonStop().setEnabled(!getPlayCoreProxy().isStop());
	    player.setPlayStatus(getPlayCoreProxy().isPlay());
	    player.getButtonNext().setEnabled(getTracklistMediator().hasNext());
	    player.getButtonPrev().setEnabled(getTracklistMediator().hasPrev());
	    
	    // updateStereo();
	    // updateStatus();
	}

        protected var bytesTotal:uint;

	private function onPlayBegin(note:INotification):void{
            // bytesTotal = uint(note.getBody());
            // // Console.log(this, 'begin:' + this.getPlayCoreProxy().getLength());
	    // player.getProgress().setMaximum(bytesTotal);
	    player.getProgress().setMaximum(this.getPlayCoreProxy().getTotalTime());
	}

	private function onPlayProgress():void{
	    if(player.getProgress().getValueIsAdjusting()) return;
	    player.getProgress().setValue(this.getPlayCoreProxy().getCurrentTime());
	}

	private function onTrackLoading(note:INotification):void{
            // Console.log(this, this.getPlayCoreProxy().getETime() + '/' + this.getPlayCoreProxy().getTotalTime());
	    player.getProgress().setMaximum(this.getPlayCoreProxy().getTotalTime());
	    player.getProgress().setExtent(this.getPlayCoreProxy().getETime());
	}

	private function onChangeVolume(e:InteractiveEvent):void{
	    var p:Number = player.getVolumeBar().getValue() / 100;
	    getPlayCoreProxy().setVolume(p);
            Console.log(this, 'volume: ' + p);
	    // if(player.getVolumeBar().getValueIsAdjusting()){
	    //     // player.getStatus().setText("音量:" + player.getVolumeBar().getValue() + "%");
	    // } else {
	    //     // updateStatus();
	    // }
	}

	//跳播
	private function onSeek(e:InteractiveEvent):void{
	    var s:XSlider = player.getProgress();
	    if(s.getValueIsAdjusting()){
	    } else if(!e.isProgrammatic()) {
		getPlayCoreProxy().seek(s.getValue() / s.getMaximum(), false);
	    }
	}

	//play
	private function playMP3(e:Event):void{
	    this.sendNotification(Signal.APP_PLAY);
	}

	//暂停
	private function pauseMP3(e:Event):void{
	    getPlayCoreProxy().pause();
	}

        protected function getTracklistMediator():TracklistMediator {
            return facade.retrieveMediator(TracklistMediator.NAME) as TracklistMediator;
        }

	//播放下一首
	private function nextMP3(e:Event):void{
            getTracklistMediator().next();
	}
	
	//播放上一首
	private function prevMP3(e:Event):void{
            getTracklistMediator().prev();
	}

	private function switchMute(e:InteractiveEvent):void {
	    var b:XToggleButton = player.getButtonMute();
	    var v:Number;
	    if(b.isSelected()){
		b.putClientProperty("volume", player.getVolumeBar().getValue());
		v = 0;
	    } else {
		v = Number(b.getClientProperty("volume"));
	    }
            Console.log(this, 'mute' + v);
	    player.getVolumeBar().setValue(v);
	    player.getVolumeBar().setEnabled(v != 0);
	}

    }
}
