package com.ting3.player.view
{
    import tao.debugger.Console;

    import flash.events.Event;
    import flash.events.ContextMenuEvent;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;

    import org.aswing.AsWingUtils;
    import org.aswing.UIManager;
    import org.aswing.event.SelectionEvent;
    import org.aswing.event.InteractiveEvent;
    import org.aswing.JList;

    import org.puremvc.as3.multicore.interfaces.INotification;

    import com.ting3.player.Signal;
    import com.ting3.player.model.vo.PlaylistVO;
    import com.ting3.player.gui.AppWindow;
    import tao.aswing.laf.XLookAndFeel;
    import tao.aswing.event.ListItemActionEvent;

    public class AppMediator extends BasicMediator
    {
	public static var NAME:String = "T3Mediator";
	private var app:Main;
	private var player:AppWindow;

	public function AppMediator(app:Main)
	{
            super(NAME);
            this.app = app;
	}

	override public function onRegister():void{
	    var menu:ContextMenu = new ContextMenu();
	    // menu.hideBuiltInItems();
	    menu.customItems.push(new ContextMenuItem("右键菜单", true, false));
	    app.contextMenu = menu;
            // createAppWindow();
            // updateAllUI();
	}

	override public function listNotificationInterests() : Array {
	    return [
                Signal.APP_READY,
                Signal.APP_SKIN_LOADED,
            ];
	}
	
	override public function handleNotification(note:INotification) : void {
	    switch(note.getName()){
		case Signal.APP_READY:
                    player.createPlaylistSet(
                        getConfigProxy().playlistSet, 
                        getConfigProxy().defaultPlaylist, 
                        playlistCategoryChanged, loadTracklist, __action);
		    break;

		case Signal.APP_SKIN_LOADED:
		    updateAllUI();
		    break;
	    }
	}

	private function __action(e:ListItemActionEvent):void{
            Console.log(this, 'I get item action ' + e.getAction());
            Console.log(this, e.getValue());
	}

	private function playlistCategoryChanged(e:Event):void{
	    var index:Number = player.getPlaylistSet().getSelectedIndex();
	    Console.log(this, "Selected : " + index);
	}


	private function updateAllUI():void{
	    if (player == null) {
                Console.log(this, 'create window');
		this.createAppWindow();
	    }

	    UIManager.setLookAndFeel(new XLookAndFeel(getSkinProxy()));
	    AsWingUtils.updateChildrenUI(app);
            Console.log(this, 'skin window');
	}
	
	private function createAppWindow():void{
	    player = new AppWindow();
	    app.addChildAt(player, 0);

	    player.setVisible(true);

	    facade.registerMediator(new TracklistMediator(player.getTracklist()));
	    facade.registerMediator(new PlayerMediator(player.getPlayer()));
	    facade.registerMediator(new LyricMediator(player.getLyric()));

	    player.pack();
	    // player.layoutWindows();
	    player.revalidate();
	    this.sendNotification(Signal.APP_READY);
	}

        private function loadTracklist(e:SelectionEvent):void {
	    this.sendNotification(Signal.APP_TRACKLIST_LOAD, 
                PlaylistVO(JList(e.target).getSelectedValue()));
        }
    }
}
