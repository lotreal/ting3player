package tao.aswing.event
{
    import tao.debugger.Console;
    import flash.events.Event;
    import org.aswing.ListCell;

    public class ListItemActionEvent extends Event {
	public static const ACTION:String = "listItemAction";

        private var action:String;
	private var value:*;
	private var cell:ListCell;

        public function ListItemActionEvent(action:String, value:* = null, cell:ListCell = null){
	    super(ACTION);
            this.action = action;
	    this.value = value;
	    this.cell = cell;
	}

        public function getAction():String {
            return action;
        }

        public function getValue():* {
            return value;
        }

        public function setValue(value:*):void {
            this.value = value;
        }

        public function getCell():ListCell {
            return cell;
        }

        public function setCell(value:ListCell):void {
            this.cell = value;
        }

	override public function clone():Event{
		return new ListItemActionEvent(action, value, cell);
	}
    }
}
