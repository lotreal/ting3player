package com.ting3.mvc 
{
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class Signal
    {
	//=============================================================================
	//重设皮肤
	public static const APP_SET_SKIN:String = "reSetSkin";
	//配置XML加载完成
	public static const APP_CONFIG_LOADED:String = "configLoadComplete";
	//皮肤加载完成
	public static const APP_SKIN_LOADED:String = "skinLoadComplete";
	//程序准备就绪
	public static const APP_READY:String = "appReady";
	//音乐列表加载完成
	public static const APP_PLAYLIST_LOADED:String = "playlistLoadComplete";
	//启动
	public static const APP_STARTUP:String = "startUp";
	//切换
	public static const APP_SWITCH_MINIMODE:String = "switchMinimode";
	
	
	//下一首
	public static const APP_NEXT:String = "next";
	//上一首
	public static const APP_PREV:String = "prev";
	//播放
	public static const APP_PLAY:String = "play";
	//当播放时
	public static const APP_PLAY_BEGIN:String = "onPlay";
	
	//=============================================================================
	//声音
	
	//播放进度
	public static const APP_PLAYING:String = "playProgress";
	//音量设置
	public static const APP_VOLUME_CHANGED:String = "soundVolume";
	//状态以生改变
	public static const APP_STATUS_CHANGED:String = "statusChange";
	//=============================================================================
	
    }

}
