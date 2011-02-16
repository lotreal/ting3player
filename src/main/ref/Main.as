package
{
    import tao.debugger.Console;

    import com.greensock.TweenLite;
    import com.greensock.easing.Linear;
    import com.greensock.plugins.TintPlugin;
    import com.greensock.plugins.TweenPlugin;
    
    import flash.display.Sprite;
    
    import org.aswing.AsWingManager;
    
    import com.ting3.mvc.MFacade;
    
    [SWF(width = "800", height = "600", frameRate = "30")]
    public class Main extends Sprite
    {
	private var facade:MFacade;
	
	public function Main()
	{
	    // Send a trace
	    Console.log(this, "Hello World!");

	    AsWingManager.initAsStandard(this);
	    Console.log(this, "aswing startup");
	    TweenLite.defaultEase = Linear.easeNone;
	    TweenPlugin.activate([TintPlugin]);
	    //T.initStage(this);
	    Console.log(this, "tween startup");
	    facade = new MFacade("music");
	    facade.startup(this);
	    Console.log(this, "music startup");
	}
    }
}
