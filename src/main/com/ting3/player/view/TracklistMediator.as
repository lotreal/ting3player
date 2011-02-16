package com.ting3.player.view
{
    import tao.debugger.Console;
    import flash.events.Event;
    import com.ting3.player.Signal;
    import com.ting3.player.gui.Tracklist;

    import org.aswing.event.SelectionEvent;
    import org.puremvc.as3.multicore.interfaces.INotification;
    import org.aswing.VectorListModel;
    import tao.aswing.event.ListItemActionEvent;

    public class TracklistMediator extends BasicMediator
    {
	public static const NAME:String = 'TracklistMediator';
        private var model:VectorListModel;

	protected function get tracklist(): Tracklist
	{
	    return viewComponent as Tracklist;
	}

	public function TracklistMediator(viewComponent:Tracklist)
        {
            super(NAME, viewComponent);
            model = tracklist.getModel() as VectorListModel;
        }
	
        override public function onRegister():void{
            // getTracklistProxy().tracklistModel = tracklist.getModel();
    	    tracklist.addEventListener(ListItemActionEvent.ACTION, __action);
        }

	override public function listNotificationInterests() : Array {
	    return [Signal.APP_TRACKLIST_LOADED];
	}
	
	override public function handleNotification(note:INotification) : void {
	    switch(note.getName()){
		case Signal.APP_TRACKLIST_LOADED:
		    updateTracklist();
   		    break;
	    }
	}

	private function __action(e:ListItemActionEvent):void{
            Console.log(this, 'I get item action ' + e.getAction());
            Console.log(this, e.getValue());
	}

	private function updateTracklist():void{
            tracklist.removeSelectionListener(playSong);

            model.clear();
            model.appendAll(getTracklistProxy().getTracklist());

            tracklist.addSelectionListener(playSong);
            tracklist.setSelectedIndex(0);
	}

	private function playSong(e:SelectionEvent):void{
	    this.sendNotification(Signal.APP_PLAY, tracklist.getSelectedTrack());
	}

	public function next():void{
            tracklist.next();
	}

	public function prev():void{
            tracklist.prev();
	}

	public function hasNext():Boolean{
            return tracklist.hasNext();
	}

	public function hasPrev():Boolean{
            return tracklist.hasPrev();
	}
    }
}
