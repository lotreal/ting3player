package {
    import tao.debugger.Console;

    import com.greensock.TweenLite;
    import com.greensock.easing.Linear;
    import com.greensock.plugins.TintPlugin;
    import com.greensock.plugins.TweenPlugin;

    import flash.display.Sprite;

    import org.aswing.AsWingManager;

    import com.ting3.player.TFacade;

    [SWF(width="500", height="500", backgroundColor="#eeeeee", frameRate="30")]
    public class Main extends Sprite {
        public function Main() {
            Console.log(this, 'hello~');
	    AsWingManager.initAsStandard(this);

	    TweenLite.defaultEase = Linear.easeNone;
	    TweenPlugin.activate([TintPlugin]);

            var facade:TFacade = new TFacade('t3player');
            facade.startup(this);
        }
    }
}
