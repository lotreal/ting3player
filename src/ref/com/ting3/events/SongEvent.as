package com.ting3.events
{
    import flash.events.Event;
    
    import com.ting3.geom.Song;
    
    public class SongEvent extends Event
    {
	public static const INVALID:String = "invalid";
	
	public var song:Song;
	
	public function SongEvent(type:String, s:Song)
	{
	    song = s;
	    super(type);
	}
    }
}
