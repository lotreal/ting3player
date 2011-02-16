package com.ting3.mvc.view.listWin
{
    import com.ting3.component.board.PlayListWindow;
    import com.ting3.mvc.view.BasicMediator;
    
    public class ListWindowMediator extends BasicMediator
    {
	public static const NAME:String = "ListWindowMediator";
	
	private var listWin:PlayListWindow;
	
	public function ListWindowMediator(win:PlayListWindow)
	{
	    super(NAME);
	    listWin = win;
	}
	
	override public function onRegister():void{
	    facade.registerMediator(new SongListMediator(listWin));
	}
    }
}
