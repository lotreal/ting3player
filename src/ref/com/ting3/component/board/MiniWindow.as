package com.ting3.component.board
{
    import org.aswing.JPanel;
    import org.aswing.LayoutManager;
    
    import com.ting3.component.XButton;
    import com.ting3.component.XSlider;
    import com.ting3.component.XToggleButton;
    import com.ting3.component.board.playerWindow.Led;
    import com.ting3.component.board.playerWindow.SongInfo;
    import com.ting3.component.layout.MiniWindowLayout;
    
    public class MiniWindow extends AbstractBoard
    {
	private var playButton:XButton;
	private var pauseButton:XButton;
	private var stopButton:XButton;
	private var nextButton:XButton;
	private var prevButton:XButton;
	private var lrcButton:XButton;
	private var exitButton:XButton;
	private var minimodeButton:XButton;
	private var minimizeButton:XButton;
	
	private var muteButton:XToggleButton;
	
	private var info:SongInfo;
	private var volume:XSlider;
	private var progress:XSlider;
	private var led:Led;
	
	public function MiniWindow()
	{
	    super(new MiniWindowLayout);
	    
	    pauseButton = new XButton;
	    pauseButton.setXmlField("mini.pause");
	    append(pauseButton);
	    
	    playButton = new XButton;
	    playButton.setXmlField("mini.play");
	    append(playButton);
	    
	    stopButton = new XButton;
	    stopButton.setXmlField("mini.stop");
	    append(stopButton);
	    
	    nextButton = new XButton;
	    nextButton.setXmlField("mini.next");
	    append(nextButton);
	    
	    prevButton = new XButton;
	    prevButton.setXmlField("mini.prev");
	    append(prevButton);
	    
	    muteButton = new XToggleButton;
	    muteButton.setXmlField("mini.mute");
	    append(muteButton);
	    
	    exitButton = new XButton;
	    exitButton.setXmlField("mini.exit");
	    append(exitButton);
	    
	    minimodeButton = new XButton;
	    minimodeButton.setXmlField("mini.minimode");
	    append(minimodeButton);
	    
	    minimizeButton = new XButton;
	    minimizeButton.setXmlField("mini.minimize");
	    append(minimizeButton);
	    
	    lrcButton = new XButton;
	    lrcButton.setXmlField("mini.lyric");
	    append(lrcButton);
	    
	    info = new SongInfo;
	    info.setXmlField("mini");
	    append(info);
	    
	    led = new Led;
	    led.setXmlField("mini");
	    append(led);
	    
	    progress = new XSlider;
	    progress.setXmlField("mini.progress");
	    append(progress);
	}
	
	public function getPlayButton():XButton{
	    return playButton;
	}
	public function getPauseButton():XButton{
	    return pauseButton;
	}
	public function getStopButton():XButton{
	    return stopButton;
	}
	public function getNextButton():XButton{
	    return nextButton;
	}
	public function getPrevButton():XButton{
	    return prevButton;
	}
	public function getMuteButton():XToggleButton {
	    return muteButton;
	}
	public function getMiniButton():XButton{
	    return this.minimodeButton;
	}
	
	public function getProgress():XSlider{
	    return this.progress;
	}
	
	public function getLed():Led{
	    return led;
	}
	
	public function getInfo():SongInfo{
	    return info;
	}
	
	public function setPlayStatus(isPlay:Boolean):void{
	    playButton.setVisible(!isPlay);
	    pauseButton.setVisible(isPlay);
	}
	
	override public function getUIClassID():String {
	    return "MiniWindowUI";
	}
    }
}
