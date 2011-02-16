package com.ting3.player.gui
{
    import tao.debugger.Console;

    import org.aswing.Container;
    import org.aswing.JPanel;
    import org.aswing.JLabel;
    import org.aswing.BorderLayout;
    import org.aswing.ASColor; 
    import org.aswing.border.LineBorder;

    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;

    import tao.aswing.XUtils;
    import tao.aswing.XButton;
    import tao.aswing.XToggleButton;
    import tao.aswing.XSlider;
    import tao.aswing.XRate;

    import tao.aswing.layout.AbsoluteLayout;

    public class Player extends JPanel {
	private var buttonPlay:XButton;
	private var buttonPause:XButton;
	private var buttonStop:XButton;
	private var buttonPrev:XButton;
	private var buttonNext:XButton;

	private var buttonMute:XToggleButton;
	private var volumeBar:XSlider;

	// private var title:MLabel;
	// private var artist:MLabel;

	// private var elapsedtime:MLabel;
	// private var lefttime:MLabel;

        private var progressBar:XSlider;

	private var buttonDigg:XButton;
	private var buttonFav:XButton;
	private var buttonToclt:XButton;
	private var buttonDownload:XButton;
	private var buttonShare:XButton;

	private var buttonNormal:XButton;
	private var buttonShuffle:XButton;
	private var buttonRepeat:XButton;



        public function Player() {
            super(new AbsoluteLayout());

            var pane:JPanel = this;

            pane.setPreferredHeight(95);
            pane.setBorder(new LineBorder(null, ASColor.BLUE));

            appendButtons(pane);
            appendVol(pane);

            progressBar = new XSlider("normal.progress");
            progressBar.setShowValueTip(true);
            pane.append(progressBar, BorderLayout.SOUTH);

	    pane.mouseChildren = true;
	    mouseChildren = true;
	    setPlayStatus(false);
        }

	public function setPlayStatus(isPlay:Boolean):void{
	    buttonPause.setVisible(isPlay);
	    buttonPlay.setVisible(!isPlay);
	}

        private function appendButtons(pane:Container):Container {
            pane.setPreferredSize(new IntDimension(300,100));

	    buttonPrev = new XButton("prev");
	    pane.append(buttonPrev);

	    buttonPlay = new XButton("play");
	    pane.append(buttonPlay);
	    
	    buttonPause = new XButton("pause");
	    pane.append(buttonPause);
	    
	    buttonStop = new XButton("stop");
	    buttonStop.setEnabled(false);
	    pane.append(buttonStop);
	    
	    
	    buttonNext = new XButton("next");
	    pane.append(buttonNext);

	    var b1:XRate = new XRate();
            XUtils.setPosition(b1, new IntRectangle(300, 10));
	    pane.append(b1);
            return pane;
        }

        private function appendVol(pane:Container):Container {
	    volumeBar = new XSlider("normal.volume");
	    //volumeBar.setOpaque(true);
	    volumeBar.setBackground(ASColor.CYAN);
	    pane.append(volumeBar);

	    buttonMute = new XToggleButton('normal.mute');
	    pane.append(buttonMute);

            return pane;
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
	
	
	public function getButtonMute():XToggleButton {
	    return buttonMute;
	}

    }
}
