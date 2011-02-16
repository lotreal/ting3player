package com.ting3.player.model 
{
    import tao.debugger.Console;
    import flash.events.Event;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.utils.Dictionary;

    import com.ting3.player.model.vo.PlaylistVO;
    import org.aswing.util.ArrayList;

    public class ConfigProxy extends BasicProxy
    {
	public static const NAME:String = "ConfigProxy";

        public var xml:XML;

	public var playlistSet:Array;
	public var defaultPlaylist:PlaylistVO = null;

	public function ConfigProxy() 
	{
	    super(NAME);
	}

        public function getSkinUrl(skin_id:String):String
        {
            return xml..skin.(@id == xml.skins.@default).@location.toString();
        }

        public function setXML(xml:XML):void
        {
            this.xml = xml;
            parseXml(xml);
        }

        private function parseXml(xml:XML):void
        {
            playlistSet = new Array(); 
            for each (var cat:XML in xml.playlists.category)
            {
                var v:Array = new Array();
                for each (var playlist:XML in cat.playlist)
                {
                    var pl:PlaylistVO = PlaylistVO.fromXml(playlist)
                    v.push(pl);
                    if (playlist.@default == 'true') defaultPlaylist = pl;
                }
                playlistSet.push(cat.@title.toString());
                playlistSet.push(v);
            }
        }
    }
}
