package com.ting3.player.controller
{
    import tao.debugger.Console;

    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import org.puremvc.as3.multicore.interfaces.INotification;
    import com.ting3.player.model.TracklistProxy;
    import com.ting3.player.Signal;
    import com.ting3.player.model.vo.PlaylistVO;

    public class LoadTracklistCommand extends BasicCommand
    {
	private var _loader:URLLoader;
	public function LoadTracklistCommand() 
	{
	    _loader = new URLLoader;
	    _loader.addEventListener(Event.COMPLETE, _onLoadComplete);
	}
	
	private function _onLoadComplete(e:Event):void 
	{
	    var tracklistProxy:TracklistProxy = facade.retrieveProxy(TracklistProxy.NAME) as TracklistProxy;
	    tracklistProxy.setXML(new XML(_loader.data));
	    this.sendNotification(Signal.APP_TRACKLIST_LOADED);
	}
	
	override public function execute(notification:INotification):void 
	{
            var playlist:PlaylistVO = PlaylistVO(notification.getBody());
	    _loader.load(new URLRequest(playlist.location));
	}
    }

}
