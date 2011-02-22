package com.ting3.player.model 
{
    import tao.debugger.Console;
    import flash.display.Shape;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;
    
    import org.aswing.BoundedRangeModel;
    import org.aswing.DefaultBoundedRangeModel;
    
    import com.ting3.player.Signal;
    import com.ting3.player.model.vo.TrackVO;
    
    
    public class MP3PlayCoreProxy extends BasicProxy
    {
	public static const NAME:String = "MP3PlayCoreProxy";
	
	private var _sound:Sound;
	private var _channel:SoundChannel;
	/**
	* 是不是已停止
	*/
	private var _isStop:Boolean = true;
	/**
	* 是不是已暂住
	*/
	private var _isPause:Boolean = false;
	/**
	* 记录当前播放头位置
	*/
	private var _currentTime:Number = 0;
	/**
	* 设置音量用
	*/
	private var _soundTransform:SoundTransform = new SoundTransform(0.7);
	
	private var _currentTrack:TrackVO;

	private var _totalTime:int = int.MAX_VALUE;

	private var timeModel:BoundedRangeModel = new DefaultBoundedRangeModel;

	private var tempShape:Shape = new Shape;
	
	public function MP3PlayCoreProxy() 
	{
	    super(NAME);
	}
	
	public function playTrack(t:TrackVO):void {
            Console.log(this, 'play track: ' + t);
	    _currentTrack = t;

	    stop();
	    if (_sound) {
		disposeSound(_sound);
	    }
	    
	    _sound = createSound();
	    _sound.load(new URLRequest(t.location));
	    disposeChannel();
	    _currentTime = 0;
            play();
	    sendNotification(Signal.APP_PLAY_BEGIN, t);
	}
	
	public function play():void
	{
	    _channel = getChannel(getCurrentTime());
	    _isPause = false;
	    _isStop = false;
	    tempShape.addEventListener(Event.ENTER_FRAME, __soundPlayProgress);
	    //EnterFrameManager.add(__soundPlayProgress);
	    __onStatusChange();
	}
	
	public function pause():void {
	    _isPause = true;
	    if (_channel) {
		tempShape.removeEventListener(Event.ENTER_FRAME, __soundPlayProgress);
		//EnterFrameManager.del(__soundPlayProgress);
		disposeChannel();
		__onStatusChange();
	    }
	}
	
	public function stop():void {
	    _isStop = true;
	    disposeChannel();
	    tempShape.removeEventListener(Event.ENTER_FRAME, __soundPlayProgress);
	    //EnterFrameManager.del(__soundPlayProgress);
	    __onStatusChange();
	}
	
	public function seek(percent:Number, isProgrammatic:Boolean = true):void {
	    _channel = getChannel(getTotalTime() * percent);
	    if (isPause()) {
		disposeChannel();
	    }
	}
	
	public function getETime():int {
	    return getTotalTime() - Math.ceil(_sound.length);
        }

	/**
	* 声音的总时长 毫秒
	* @return
	*/
	public function getTotalTime():int {
            return _totalTime;
	}
	
	
	/**
	* 当前时间
	* @return
	*/
	public function getCurrentTime():Number {
	    if (!isPause()) {
		if(_channel)
		_currentTime = _channel.position;
	    }
	    return _currentTime;
	}
	
	
	
	/**
	* 设置音量
	* @param	percent
	*/
	public function setVolume(percent:Number, isProgrammatic:Boolean = true):void {
	    _soundTransform.volume = Math.max(0, Math.min(1, percent));
	    if (_channel)
	    _channel.soundTransform = _soundTransform;
	    
	    this.sendNotification(Signal.APP_VOLUME_CHANGED, getVolume());
	}
	
	
	
	public function getVolume():Number {
	    return _soundTransform.volume;
	}
	
	/**
	* 是否在播放中
	*/
	public function isPlay():Boolean {
	    return !_isStop && !_isPause;
	}
	
	
	
	/**
	* 是否在暂停中
	*/
	public function isPause():Boolean {
	    return _isPause;
	}
	
	
	/**
	* 是否已停止
	*/
	public function isStop():Boolean {
	    return _isStop;
	}
	
	
	/**
	* 生成一个已初始化的声音对象
	* @return
	*/
	private function createSound():Sound {
	    var sd:Sound = new Sound;
	    sd.addEventListener(Event.COMPLETE, __onSoundLoadComplete);
	    sd.addEventListener(ProgressEvent.PROGRESS, __onSoundProgress);
	    sd.addEventListener(IOErrorEvent.IO_ERROR, __onSoundLoadError);
	    return sd;
	}
	
	
	
	private function disposeSound(sd:Sound):void {
	    try {
		sd.close();
	    } catch(e:*) {}
	    sd.removeEventListener(Event.COMPLETE, __onSoundLoadComplete);
	    sd.removeEventListener(ProgressEvent.PROGRESS, __onSoundProgress);
	    sd.removeEventListener(IOErrorEvent.IO_ERROR, __onSoundLoadError);
	}
	
	
	
	private function getChannel(time:Number):SoundChannel {
	    if (_channel) {
		_channel.stop();
		_channel.removeEventListener(Event.SOUND_COMPLETE, __onSoundPlayComplete);
	    }
	    
	    _channel = _sound.play(time);
	    _channel.soundTransform = _soundTransform;
	    _channel.addEventListener(Event.SOUND_COMPLETE, __onSoundPlayComplete);
	    return _channel;
	}
	
	private function disposeChannel():void {
	    if (_channel) {
		_currentTime = _channel.position;
		_channel.stop();
	    } else {
	        _currentTime = 0;
            }
	    _channel = null;
	}

	private function __onSoundPlayComplete(e:Event):void 
	{
	    stop();
	    this.sendNotification(Signal.APP_NEXT);
	}
	
	private function __onSoundProgress(e:ProgressEvent):void 
	{
	    if (_sound.bytesLoaded > 0) {
		_totalTime = int.MAX_VALUE;
            } else {
	        _totalTime = Math.ceil(_sound.length * _sound.bytesTotal / _sound.bytesLoaded);
            }
	    // this.sendNotification(Signal.APP_TRACK_LOADING, e.bytesLoaded);
	}
	
	private function __onSoundLoadError(e:IOErrorEvent):void {
	    _currentTrack.url_invalid = true;
	    //this.sendNotification(Signal.APP_NEXT);
	}
	
	private function __onSoundLoadOpen(e:Event):void {
            // Console.log(this, 'open:');
            // Console.log(this, _sound);
	}
	
	private function __onSoundLoadComplete(e:Event):void {
	    // 加载完成，非播放完成
	}
	
	private function __soundPlayProgress(e:Event = null):void {
	    this.sendNotification(Signal.APP_PLAYING);
	}
	
	private function __onStatusChange():void {
	    this.sendNotification(Signal.APP_STATUS_CHANGED);
	}
	
	/**
	* 获取播放状态 
	* @return 
	* 
	*/		
	public function getStatus():String {
	    var s:String = "停止";
	    if(!isStop()) {
		s = isPlay() ? "播放" : "暂停";
	    }
	    return s;
	}
	
	public function getCurrentSong():TrackVO{
	    return _currentTrack;
	}
	
	public function getTimeModel():BoundedRangeModel{
	    return timeModel;
	}
	
    }
}
