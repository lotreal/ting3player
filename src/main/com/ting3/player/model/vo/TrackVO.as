package com.ting3.player.model.vo
{
    import tao.util.StringUtils;

    public class TrackVO
    {
        public var song_id  : String;
        public var title    : String;
        public var artist   : String;
        public var location : String;
        public var lyric    : String;

        public var url_invalid : Boolean;

        public static function fromXml(track:XML, ns:Namespace):TrackVO {
            var t:TrackVO = new TrackVO();
            t.song_id = track.ns::song_id;
            t.title = track.ns::title;
            t.artist = track.ns::artist;
            t.location = StringUtils.decryptionUrl(track.ns::location);
            t.lyric = track.ns::lyric;
            return t;
        }
    }
}
