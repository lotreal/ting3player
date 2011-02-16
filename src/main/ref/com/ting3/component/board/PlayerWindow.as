package com.ting3.component.board
{
    import flash.events.MouseEvent;
    
    import org.aswing.ASColor;
    import org.aswing.Container;
    import org.aswing.JPanel;
    
    import com.ting3.component.XButton;
    import com.ting3.component.MLabel;
    import com.ting3.component.XSlider;
    import com.ting3.component.XToggleButton;
    import com.ting3.component.board.playerWindow.*;
    import com.ting3.component.layout.PlayerWindowLayout;

    /**
    * 播放器主控制面板 
    * @author tangzx
    * 
    */	
    public class PlayerWindow extends AbstractBoard
    {
	private var buttonPlay:XButton;
	private var buttonPause:XButton;
	private var buttonStop:XButton;
	private var buttonPrev:XButton;
	private var buttonNext:XButton;
	private var buttonClose:XButton;
	private var buttonMini:XButton;
	private var buttonMiniMode:XButton;
	private var buttonMute:XToggleButton;
	
	private var progressBar:XSlider;
	private var volumeBar:XSlider;
	//LED:
	private var led:Led;
	//info
	private var info:SongInfo;
	//
	private var stereo:MLabel;
	private var status:MLabel;
	
	public function PlayerWindow() {
	    super(new PlayerWindowLayout(this));
	    var pane:Container = this;
	    
	    buttonPlay = new XButton;
	    buttonPlay.setXmlField("play");
	    pane.append(buttonPlay);
	    
	    buttonPause = new XButton;
	    buttonPause.setXmlField("pause");
	    pane.append(buttonPause);
	    
	    buttonStop = new XButton;
	    buttonStop.setXmlField("stop");
	    buttonStop.setEnabled(false);
	    pane.append(buttonStop);
	    
	    buttonPrev = new XButton;
	    buttonPrev.setXmlField("prev");
	    pane.append(buttonPrev);
	    
	    buttonNext = new XButton;
	    buttonNext.setXmlField("next");
	    pane.append(buttonNext);
	    
	    buttonClose = new XButton;
	    buttonClose.setXmlField("exit");
	    buttonClose.setToolTipText("退出");
	    pane.append(buttonClose);
	    
	    buttonMini = new XButton;
	    buttonMini.setXmlField("minimize");
	    buttonMini.setToolTipText("最小化");
	    pane.append(buttonMini);
	    
	    buttonMiniMode = new XButton;
	    buttonMiniMode.setXmlField("minimode");
	    buttonMiniMode.setToolTipText("迷你模式");
	    pane.append(buttonMiniMode);
	    
	    //静音
	    buttonMute = new XToggleButton;
	    buttonMute.setXmlField("normal.mute");
	    append(buttonMute);
	    
	    progressBar = new XSlider;
	    progressBar.setEnabled(false);
	    progressBar.setXmlField("normal.progress");
	    pane.append(progressBar);
	    
	    volumeBar = new XSlider;
	    //volumeBar.setOpaque(true);
	    volumeBar.setBackground(ASColor.CYAN);
	    volumeBar.setXmlField("normal.volume");
	    pane.append(volumeBar);
	    
	    //LED
	    led = new Led(progressBar.getModel());
	    led.setXmlField("normal");
	    pane.append(led);
	    
	    //info:
	    info = new SongInfo;
	    info.setXmlField("normal");
	    pane.append(info);
	    
	    //
	    stereo = new MLabel("立体音");
	    stereo.setXmlField("stereo");
	    pane.append(stereo);
	    
	    status = new MLabel("停止");
	    status.setXmlField("status");
	    pane.append(status);
	    
	    // var buttonPlay2:XButton = new XButton;
	    // buttonPlay2.setXmlField("play2");
	    // pane.append(buttonPlay2);

	    pane.mouseChildren = true;
	    mouseChildren = true;
	    setPlayStatus(false);
	}
	
	public function getProgress():XSlider{
	    return progressBar;
	}
	
	public function getVolumeBar():XSlider{
	    return volumeBar;
	}
	
	public function getButtonPlay():XButton {
	    return buttonPlay;
	}
	
	public function getButtonPause():XButton{
	    return buttonPause;
	}
	
	public function getButtonNext():XButton{
	    return buttonNext;
	}
	
	public function getButtonPrev():XButton{
	    return buttonPrev;
	}
	
	public function getButtonStop():XButton{
	    return buttonStop;
	}
	
	public function getInfo():SongInfo{
	    return info;
	}
	
	public function getStereo():MLabel{
	    return stereo;
	}
	
	public function getStatus():MLabel{
	    return status;
	}
	
	public function getLed():Led{
	    return led;
	}
	
	public function setPlayStatus(isPlay:Boolean):void{
	    buttonPause.setVisible(isPlay);
	    buttonPlay.setVisible(!isPlay);
	}
	
	public function getButtonMini():XButton{
	    return buttonMini;
	}
	
	public function getButtonMute():XToggleButton {
	    return buttonMute;
	}
	/*override protected function checkMove(e:MouseEvent):void{
	    
	}*/
	
	override public function getUIClassID():String {
	    return "PlayerWindowUI";
	}
    }
}
