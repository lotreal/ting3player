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
    import org.aswing.border.LineBorder;

    import tao.aswing.layout.StackLayout;
    import tao.aswing.event.ListItemActionEvent;

    import flash.events.MouseEvent;
    import flash.events.Event;

    public class XActionListCell {
	protected var pane:JPanel;
	protected var content_pane:JPanel;
	protected var hover_pane:JPanel;
	protected var toolbar:JPanel;

        public function XActionListCell() {
	    pane = new JPanel(new StackLayout());
	    pane.setOpaque(true);
            pane.setBackground(ASColor.GREEN);

            content_pane = new JPanel(new BorderLayout());
            hover_pane = new JPanel(new BorderLayout());

            pane.append(content_pane);
            pane.append(hover_pane);

	    content_pane.setVisible(true);
	    content_pane.setOpaque(true);
            content_pane.setBackgroundDecorator(null);
            content_pane.setBackground(ASColor.RED);
            content_pane.setForeground(ASColor.RED);

	    hover_pane.setVisible(false);
	    hover_pane.setOpaque(true);
            hover_pane.setBackgroundDecorator(null);
            hover_pane.setBackground(ASColor.BLUE);
            // hover_pane.setAlpha(.5);
            // hover_pane.setBorder(new LineBorder(null, ASColor.RED));
            toolbar = new JPanel();
            // toolbar.setOpaque(true);
            // toolbar.append(new JLabel('buttons'));
            hover_pane.append(toolbar, BorderLayout.EAST);

            pane.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
            pane.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);

            setContent();
            setAction();
        }

        protected function setContent():void
        {
        }

        protected function setAction():void
        {
        }

        protected function addAction(name:String, action:String):void
        {
            var btn:JButton = new JButton(name);
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

        private function rollOverHandler(event:MouseEvent):void {
	    hover_pane.setVisible(true);
	    pane.validate();
        }

        private function rollOutHandler(event:MouseEvent):void {
	    hover_pane.setVisible(false);
            pane.validate();
        }

	public function setListCellStatus(list:JList, selected:Boolean, index:int):void{
	    if (selected) {
		pane.setBackground(list.getSelectionBackground());
		pane.setForeground(list.getSelectionForeground());
	    } else {
		pane.setBackground(list.getBackground());
		pane.setForeground(list.getForeground());

                content_pane.setBackground(ASColor.RED);
                content_pane.setForeground(ASColor.RED);
                hover_pane.setBackgroundDecorator(null);
                hover_pane.setBackground(ASColor.BLUE);
	    }
	}

	public function getCellComponent():Component{
	    return pane;
	}
    }
}
