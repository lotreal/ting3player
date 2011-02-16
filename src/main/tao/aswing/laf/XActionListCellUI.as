package tao.aswing.laf
{
    import tao.debugger.Console;
    import flash.display.BitmapData;
    import flash.events.MouseEvent;
    
    import org.aswing.ASColor; 
    import org.aswing.Component;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    import org.aswing.plaf.BaseComponentUI;
    import org.aswing.skinbuilder.SkinButtonBackground;
    import org.aswing.graphics.Graphics2D;
    import org.aswing.SolidBackground;
    import org.aswing.border.LineBorder;

    import tao.aswing.XUtils;
    import tao.aswing.XActionListCell;

    import tao.geom.MRectangle;

    public class XActionListCellUI extends BaseComponentUI implements IXComponentUI
    {
	protected var cell:XActionListCell;

	override public function installUI(c:Component) : void {
            Console.log(this, 'install~~~~~~~~~~~~~');
	    super.installUI(c);
            cell = XActionListCell(c);

            // cell.pane.setBackground(ASColor.GREEN);

	    // cell.content_pane.setBackgroundDecorator(new SolidBackground(ASColor.RED));
            cell.content_pane.setBackground(ASColor.WHITE);

	    cell.hover_pane.setBackgroundDecorator(new SolidBackground(ASColor.GREEN));
            cell.hover_pane.setBorder(new LineBorder(null, ASColor.RED));

            // cell.content_pane.addEventListener(MouseEvent.ROLL_OVER, _rollOverHandler);
            // cell.content_pane.addEventListener(MouseEvent.ROLL_OUT, _rollOutHandler);
	}

        private function _rollOverHandler(event:MouseEvent):void {
            Console.log(this, 'roll over');
            cell.content_pane.setBackground(ASColor.BLUE);
            cell.content_pane.validate();
        }

        private function _rollOutHandler(event:MouseEvent):void {
            Console.log(this, 'roll out');
            cell.content_pane.setBackground(ASColor.RED);
            cell.content_pane.validate();
        }
	
	override public function getPreferredSize(c:Component):IntDimension {
	    return cell.pane.getPreferredSize();
	}
    }
}
