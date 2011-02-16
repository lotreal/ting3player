package com.ting3.player.model.vo
{
    public class PlaylistVO
    {
        public var playlist_id : String;
        public var title       : String;
        public var location    : String;

        public static function fromXml(playlist:XML):PlaylistVO {
            var pl:PlaylistVO = new PlaylistVO();
            // pl.playlist_id = playlist.@id.toString();
            pl.title = playlist.toString();
            pl.location = playlist.@location.toString();
            return pl;
        }

    }
}
