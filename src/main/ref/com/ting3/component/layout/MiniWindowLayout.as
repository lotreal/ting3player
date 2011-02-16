package com.ting3.component.layout
{
    import org.aswing.Component;
    import org.aswing.Container;
    import org.aswing.EmptyLayout;
    import org.aswing.geom.IntRectangle;
    
    import com.ting3.component.lookAndFeel.IXComponentUI;
    
    public class MiniWindowLayout extends EmptyLayout
    {
	public function MiniWindowLayout()
	{
	    super();
	}
	
	override public function layoutContainer(target:Container) : void {
	    var count:int = target.getComponentCount();
	    for(var i:int = 0; i < count; i++){
		var c:Component = target.getComponent(i);
		var ui:IXComponentUI = c.getUI() as IXComponentUI;
		if(ui != null){
		    var bounds:IntRectangle = ui.getRectang(ui.getPrefix() + "position");
		    c.pack();
		    c.setLocation(bounds.getLocation());
		}
	    }
	}
    }
}
