package tao.aswing
{
    import tao.debugger.Console;
    import org.aswing.Component;
    import org.aswing.JList;
    import org.aswing.ListCell;
    import org.aswing.ListCellFactory;
    import flash.events.Event;
    import tao.aswing.event.ListItemActionEvent;

    public class XActionList extends JList {
        
        public function XActionList(listData:*=null, cellFactory:ListCellFactory=null) {
            super(listData, cellFactory);
            // XUtils.setSkinID(this, skin_id);
        }

        override protected function addHandlersToCell(cellCom:Component):void{
            super.addHandlersToCell(cellCom);
    	    cellCom.addEventListener(ListItemActionEvent.ACTION, __action);
        }
        
        override protected function removeHandlersFromCell(cellCom:Component):void{
            super.removeHandlersFromCell(cellCom);
    	    cellCom.removeEventListener(ListItemActionEvent.ACTION, __action);
        }

	public function addCellActionListener(listener:Function, priority:int=0, useWeakReference:Boolean=false):void{
    	        addEventListener(ListItemActionEvent.ACTION, listener, false, priority, useWeakReference);
	}

	protected function __action(e:ListItemActionEvent):void{
            var cellCom:* = e.currentTarget;
	    var cell:ListCell = getCellByCellComponent(Component(cellCom));
            e.setValue(cell.getCellValue());
            e.setCell(cell);
	    dispatchEvent(e);
	}
    }
}
