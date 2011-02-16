package com.ting3.player.model 
{
    import tao.debugger.Console;
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;

    import org.aswing.ListSelectionModel;
    
    import com.ting3.player.model.vo.TrackVO;

    public class TracklistProxy extends BasicProxy
    {
	public static const NAME:String = "TracklistProxy";

        private var xml:XML;
        private var ns:Namespace = new Namespace("http://xspf.org/ns/0/"); 
        private var tracklist:Array;

	public function TracklistProxy() 
	{
	    super(NAME);
	}

        public function setXML(xml:XML):void {
            this.xml = xml;
            updateTracklist();
        }

        public function updateTracklist():Array {
            tracklist = new Array();
            for each (var track:XML in xml.ns::trackList.ns::track)
            {
                tracklist.push(TrackVO.fromXml(track, ns));
            }
            return tracklist;
        }

        public function getTracklist():Array {
            return tracklist;
        }

        public function getSelection(idx:int):TrackVO
        {
            // Console.log(this, idx);
            // Console.log(this, 'Play: ' + TrackVO(tracklist[idx]).title);
            return TrackVO(tracklist[idx]);
        }






    }
}
