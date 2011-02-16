package com.ting3.component.layout
{
    import tao.debugger.Console;

    import org.aswing.Component;
    import org.aswing.Container;
    import org.aswing.EmptyLayout;
    import org.aswing.geom.IntDimension;
    import org.aswing.geom.IntRectangle;
    
    import com.ting3.component.board.PlayerWindow;
    import com.ting3.component.lookAndFeel.IXComponentUI;
    import com.ting3.component.lookAndFeel.XComponentUI;
    
    public class PlayerWindowLayout extends EmptyLayout
    {
	private var pw:PlayerWindow;
	
	public function PlayerWindowLayout(pw:PlayerWindow)
	{
	    super();
	    this.pw = pw;
	}
	
	override public function layoutContainer(target:Container) : void {
	    var count:int = target.getComponentCount();
	    for(var i:int = 0; i < count; i++){
		var c:Component = target.getComponent(i);
		var ui:IXComponentUI = c.getUI() as IXComponentUI;
		if(ui != null){
		    var bounds:IntRectangle = ui.getRectang(ui.getPrefix() + "position");
                    //Console.log(this, bounds);
		    c.pack();
		    c.setLocation(bounds.getLocation());
		}
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
