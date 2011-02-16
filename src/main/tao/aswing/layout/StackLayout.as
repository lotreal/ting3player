package tao.aswing.layout
{
    import tao.debugger.Console;
    
    import org.aswing.EmptyLayout;
    import org.aswing.Component;
    import org.aswing.Container;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntPoint;

    public class StackLayout extends EmptyLayout {
        
        public function StackLayout() {
            super();
        }
        
	override public function layoutContainer(target:Container) : void {
	    var td:IntDimension = target.getSize();
	    var nmembers:int = target.getComponentCount();

	    for(var i:int = 0; i < nmembers; i++) {
	    	var m:Component = target.getComponent(i);
        	m.setLocation(new IntPoint(0, 0));
                m.setSize(td);
            }
	}

    }
}
