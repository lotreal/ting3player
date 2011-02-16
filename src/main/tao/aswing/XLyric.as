package tao.aswing
{
    import flash.events.Event;
    import org.aswing.JSlider;
    
    public class XLyric extends JSlider
    {
	private var model:LyricModel;
	
	public function XLyric(skin_id:String = 'default')
	{
	    this.setLrcModel(new LyricModel);
            XUtils.setSkinID(this, skin_id);
	}
	
	
	public function loadLrc(s:String):void{
	    model.loadLrc(s);
	}
	
	public function getAllLrc():Array{
	    return model.getLrc();
	}
	
	public function setLrcModel(m:LyricModel):void{
	    if(model){
		model.removeStateListener(onLrcChange);
	    }
	    model = m;
	    if(model){
		model.addStateListener(onLrcChange);
	    }
	}
	
	private function onLrcChange(e:Event):void{
	    this.dispatchEvent(e);
	}
	
	public function addLrcListener(listener:Function):void{
	    model.addStateListener(listener);
	}
	
	public function removeLrcListener(listener:Function):void{
	    model.removeStateListener(listener);
	}
	
	override public function getUIClassID():String{
	    return "XLyricUI";
	}
    }
}
