package tao.aswing.layout
{
    import tao.debugger.Console;

    import org.aswing.Component;
    import org.aswing.Container;
    import org.aswing.EmptyLayout;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    
    import tao.aswing.XUtils;
    import tao.aswing.laf.IXComponentUI;

    import org.aswing.plaf.ComponentUI;    
    public class AbsoluteLayout extends EmptyLayout
    {
	public function AbsoluteLayout()
	{
	}
	
	override public function layoutContainer(target:Container) : void
        {
	    var count:int = target.getComponentCount();
	    for(var i:int = 0; i < count; i++) 
            {
		var c:Component = target.getComponent(i);
		var bounds:IntRectangle = XUtils.getRectang(c);
                if (bounds != null) c.setLocation(bounds.getLocation());
                Console.log(this, c.toString());
                Console.log(this, bounds.toString());
		c.pack();
	    }
	}
	
	override public function preferredLayoutSize(target:Container) : IntDimension {
	    return new IntDimension(1, 1);
	}
	
	override public function minimumLayoutSize(target:Container) : IntDimension {
	    return target.getInsets().getOutsideSize();
	}
	
	override public function maximumLayoutSize(target:Container) : IntDimension {
	    return IntDimension.createBigDimension();
	}
    }
}
