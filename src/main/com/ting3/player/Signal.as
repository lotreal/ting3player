package com.ting3.player
{
    public class Signal
    {
	public static const APP_STARTUP :String = "startup";
	public static const APP_READY   :String = "ready";
	public static const APP_QUIT    :String = "quit";

	public static const APP_CONFIG_LOAD    :String = "config_load";
	public static const APP_CONFIG_LOADING :String = "config_loading";
	public static const APP_CONFIG_LOADED  :String = "config_loaded";

	public static const APP_SKIN_LOAD    :String = "skin_load";
	public static const APP_SKIN_LOADING :String = "skin_loading";
	public static const APP_SKIN_LOADED  :String = "skin_loaded";
	public static const APP_SET_SKIN     :String = "set_skin";

	public static const APP_TRACKLIST_LOAD    :String = "tracklist_load";
	public static const APP_TRACKLIST_LOADING :String = "tracklist_loading";
	public static const APP_TRACKLIST_LOADED  :String = "tracklist_loaded";

	public static const APP_TRACK_LOADING :String = "track_loading";
	public static const APP_PLAY       :String = "play";
	public static const APP_PLAY_BEGIN :String = "play_begin";
	public static const APP_PLAYING    :String = "playing";
	public static const APP_PLAY_END   :String = "play_end";

	public static const APP_PAUSE :String = "pause";

	public static const APP_PREV :String = "prev";
	public static const APP_NEXT :String = "next";

	public static const APP_VOLUME_CHANGED :String = "volume_changed";
	public static const APP_STATUS_CHANGED :String = "status_changed";
    }
}
