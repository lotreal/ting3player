package com.ting3.component.board 
{
    import org.aswing.JButton;
    import org.aswing.resizer.DefaultResizer;
    import org.aswing.resizer.ResizerController;
    
    import com.ting3.component.XButton;
    import com.ting3.component.board.lyricWindow.Lyric;
    import com.ting3.component.layout.LyricWindowLayout;
    import com.ting3.component.lookAndFeel.MLyricWindowUI;
    
    /**
    * ...
    * @author tangzx <com.ting3>
    */
    public class LyricWindow extends AbstractBoard
    {
	public var closeButton:XButton;
	
	private var lyric:Lyric;
	
	public function LyricWindow() 
	{
	    super(new LyricWindowLayout);
	    init();
	}
	
	protected function init():void{
	    ResizerController.create(this, new DefaultResizer);
	    
	    closeButton = new XButton;
	    closeButton.setXmlField("lyric.close");
	    append(closeButton);
	    
	    lyric = new Lyric;
	    append(lyric);
	}
	
	public function getLyric():Lyric{
	    return lyric;
	}
	
	override public function getUIClassID():String {
	    return "LyricWindowUI";
	}
	
    }

}
