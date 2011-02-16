package tao.aswing
{
    import tao.debugger.Console;

    import org.aswing.ASColor; 
    import org.aswing.Component;
    import org.aswing.Container;
    import org.aswing.JPanel;
    import org.aswing.ListCell;
    import org.aswing.JLabel;
    import org.aswing.JButton;
    import org.aswing.JList;
    import org.aswing.JToolBar;
    import org.aswing.BorderLayout;
    import org.aswing.BoxLayout;
    import org.aswing.ViewportLayout;

    import org.aswing.SolidBackground;

    import org.aswing.border.LineBorder;

    import tao.aswing.layout.StackLayout;
    import tao.aswing.event.ListItemActionEvent;
    import tao.aswing.XButton;

    import flash.events.MouseEvent;
    import flash.events.Event;

    public class XActionListCell implements ListCell {
	public var pane:JPanel;
	public var content_pane:JPanel;
	public var hover_pane:JPanel;
	public var toolbar:JPanel;

	protected var rolloverBackground:ASColor;
	protected var rolloverForeground:ASColor;
	protected var realBackground:ASColor;
	protected var realForeground:ASColor;
		
        public function XActionListCell() {
	    pane = new JPanel(new StackLayout());

            content_pane = new JPanel(new BorderLayout());
            hover_pane = new JPanel(new BorderLayout());

            pane.append(content_pane);
            pane.append(hover_pane);

            toolbar = new JPanel();

            hover_pane.append(toolbar, BorderLayout.EAST);

            setContent();
            setAction();

	    pane.setOpaque(false);

            content_pane.setBackground(ASColor.WHITE);
	    // content_pane.setVisible(true);
	    content_pane.setOpaque(true);
            // content_pane.setAlpha(0.9);

	    hover_pane.setVisible(false);
	    hover_pane.setOpaque(false);
            //hover_pane.setAlpha(.2);

            toolbar.setAlpha(.8);


            pane.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
            pane.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
        }

	private function __labelRollover(e:MouseEvent):void{
	}
	
	private function __labelRollout(e:MouseEvent):void{
	}	

        private function rollOverHandler(event:MouseEvent):void {
	    hover_pane.setVisible(true);

	    if(rolloverBackground){
		content_pane.setBackground(rolloverBackground);
		content_pane.setForeground(rolloverForeground);
	    }

            // content_pane.setAlpha(0.5);
	    pane.validate();
        }

        private function rollOutHandler(event:MouseEvent):void {
            // content_pane.setAlpha(0.9);
	    hover_pane.setVisible(false);

	    if(realBackground){
		content_pane.setBackground(realBackground);
		content_pane.setForeground(realForeground);
	    }

            // cell.content_pane.validate();
            pane.validate();
        }

        protected function setContent():void
        {
        }

        protected function setAction():void
        {
        }

        protected function addAction(name:String, action:String):void
        {
            var btn:XButton = new XButton('');
            btn.addEventListener(MouseEvent.MOUSE_DOWN, function(e:Event):void{
                e.stopPropagation();
                onAction(action);
            });
            toolbar.append(btn);
        }

        protected function onAction(action:String):void
        {
            pane.dispatchEvent(new ListItemActionEvent(action));
        }

	protected var value:*;
	public function setCellValue(value:*) : void {
		this.value = value;
	}

	public function getCellValue():* {
		return value;
	}

	public function setListCellStatus(list:JList, selected:Boolean, index:int):void{
	    // var com:Component = getCellComponent();
	    var com:Component = content_pane;
	    if(selected){
		com.setBackground((realBackground = list.getSelectionBackground()));
		com.setForeground((realForeground = list.getSelectionForeground()));
	    }else{
		com.setBackground((realBackground = list.getBackground()));
		com.setForeground((realForeground = list.getForeground()));
	    }
	    com.setFont(list.getFont());
	    rolloverBackground = list.getSelectionBackground().changeAlpha(0.5);
	    rolloverForeground = list.getSelectionForeground();
	}

	public function getCellComponent():Component{
	    return pane;
	}
    }
}
