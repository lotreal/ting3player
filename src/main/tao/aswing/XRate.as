package tao.aswing
{
    import tao.debugger.Console;
    import org.aswing.Component;
    import org.aswing.Container;
    import org.aswing.JPanel;

    import org.aswing.ToggleButtonModel;
    import org.aswing.BoxLayout;
    import org.aswing.event.AWEvent;
    import org.aswing.event.ReleaseEvent;

    import tao.aswing.XToggleButton;

    import flash.events.Event;
    import flash.events.MouseEvent;

    public class XRate extends JPanel {
        private var value:int = -1;
        private var len:int = 5;
        private var star_models:Vector.<ToggleButtonModel>;

        public function XRate() {
            super(new BoxLayout());
            star_models = new Vector.<ToggleButtonModel>(len, true);
            for (var i:int = 0; i < len; i++) {
	        var star:XToggleButton = new XToggleButton('rate');
	        star.putClientProperty("rate", i);
		star.addActionListener(__actionListener);
		star.addEventListener(MouseEvent.ROLL_OUT, __rollOutListener);
		star.addEventListener(MouseEvent.ROLL_OVER, __rollOverListener);
		star.addEventListener(MouseEvent.MOUSE_DOWN, __mouseDownListener);
		star.addEventListener(ReleaseEvent.RELEASE, __mouseReleaseListener);
                append(star);
                star_models[i] = star.getModel() as ToggleButtonModel;
            }
        }

        private function __actionListener(e:Event):void {
            var star:XToggleButton = e.target as XToggleButton;
            var idx:int = star.getClientProperty("rate")
            value = idx;

            for (var i:int = 0; i < len; i++) {
                star_models[i].setSelected(i <= value);
            }
            Console.log(this, 'value = ' + value);
        }

	private function __mouseDownListener(e:Event):void{
            var star:XToggleButton = e.target as XToggleButton;
            var idx:int = star.getClientProperty("rate")
            value = idx;

            for (var i:int = 0; i < len; i++) {
                star_models[i].setArmed(i <= value);
                star_models[i].setPressed(i <= value);
            }
	}

	private function __mouseReleaseListener(e:Event):void{
            var star:XToggleButton = e.target as XToggleButton;
            var idx:int = star.getClientProperty("rate")
            value = idx;

            for (var i:int = 0; i < len; i++) {
                star_models[i].setArmed(false);
                star_models[i].setPressed(false);
                star_models[i].setRollOver(false);
            }
	}

        private function __rollOutListener(e:Event):void {
            var star:XToggleButton = e.target as XToggleButton;
            var idx:int = star.getClientProperty("rate")

            for (var i:int = 0; i < len; i++) {
                star_models[i].setRollOver(false);
                star_models[i].setSelected(i <= value);
                star_models[i].setArmed(false);
            }
        }

        private function __rollOverListener(e:Event):void {
            var star:XToggleButton = e.target as XToggleButton;
            var idx:int = star.getClientProperty("rate")

            for (var i:int = 0; i < len; i++) {
                star_models[i].setRollOver(i <= idx );
                star_models[i].setSelected(false);
            }
        }

	override public function getUIClassID():String {
	    return "XRateUI";
	}
    }
}
