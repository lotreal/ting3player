package com.ting3.mvc.view.miniWin
{
    import flash.events.Event;
    
    import org.puremvc.as3.multicore.interfaces.INotification;
    
    import com.ting3.component.board.MiniWindow;
    import com.ting3.mvc.Signal;
    import com.ting3.mvc.view.BasicMediator;
    
    public class MiniWindowMediator extends BasicMediator
    {
	public static const NAME:String = "MiniWindowMediator";
	
	private var miniWin:MiniWindow;
	public function MiniWindowMediator(mini:MiniWindow)
	{
	    super(NAME);
	    miniWin = mini;
	}
	
	override public function onRegister():void{
	    miniWin.getPlayButton().setModel(getModelProxy().getPlayModel());
	    miniWin.getPauseButton().setModel(getModelProxy().getPauseModel());
	    miniWin.getStopButton().setModel(getModelProxy().getStopModel());
	    miniWin.getNextButton().setModel(getModelProxy().getNextModel());
	    miniWin.getPrevButton().setModel(getModelProxy().getPrevModel());
	    miniWin.getMuteButton().setModel(getModelProxy().getMuteModel());
	    miniWin.getInfo().setModel(getModelProxy().getSongInfoModel());
	    
	    miniWin.getMiniButton().addActionListener(switchToNormalMode);
	    
	    miniWin.getProgress().setModel(getPlayCoreProxy().getTimeModel());
	    miniWin.getLed().setModel(getPlayCoreProxy().getTimeModel());
	}
	
	override public function listNotificationInterests():Array {
	    return [Signal.APP_STATUS_CHANGED];
	}
	
	override public function handleNotification(note:INotification):void {
	    switch(note.getName()){
		case Signal.APP_STATUS_CHANGED:
		updateUI();
		break;
	    }
	}
	
	private function updateUI():void{
	    miniWin.setPlayStatus(getPlayCoreProxy().isPlay());
	}
	
	/**
	* 切换到正常状态界面 
	* @param e
	* 
	*/		
	private function switchToNormalMode(e:Event):void{
	    this.sendNotification(Signal.APP_SWITCH_MINIMODE, false);
	}
    }
}
