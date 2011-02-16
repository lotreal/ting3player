package com.ting3.player.gui
{
    import tao.debugger.Console;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.utils.Dictionary;
    
    import org.aswing.AssetBackground;
    import org.aswing.Container;
    import org.aswing.JPanel;
    import org.aswing.JLabel;
    import org.aswing.JButton;
    import org.aswing.BoxLayout;
    import org.aswing.BorderLayout;
    import org.aswing.JTabbedPane;
    import org.aswing.JAccordion;
    import org.aswing.JList;
    import org.aswing.JScrollPane;
    import org.aswing.VectorListModel;
    import org.aswing.geom.IntDimension;
    import org.aswing.ASColor; 
    import org.aswing.border.LineBorder;
    import org.aswing.event.SelectionEvent;
    import org.aswing.JOptionPane;

    import tao.aswing.XButton;
    import tao.aswing.XSlider;
    import tao.aswing.XRate;

    import com.ting3.player.gui.PlaylistCell;
    import com.ting3.player.model.vo.PlaylistVO;

    import tao.aswing.XActionList;
    import tao.aswing.XLyric;

    import org.aswing.GeneralListCellFactory;

    public class AppWindow extends JPanel
    {
	private var pane:Container;

        private var playlistSet:JAccordion;
        private var tracklist:Tracklist;
        private var playerUI:Player;

        private var lyric:XLyric;

	public function AppWindow() 
	{
	    super();
	    pane = this;
	    pane.setLayout(new BorderLayout());
            pane.setPreferredSize(new IntDimension(500,500));

            playerUI = new Player();
            pane.append(playerUI, BorderLayout.NORTH);

            var statusUI:JPanel = new JPanel(new BoxLayout());
            statusUI.setPreferredHeight(136);
            // statusUI.append(new JLabel('播放偏好设置'));
            statusUI.setBorder(new LineBorder(null, ASColor.BLUE));

            lyric = new XLyric();
            statusUI.append(lyric);

	    // var b1:XRate = new XRate();
	    // statusUI.append(b1);

            pane.append(statusUI, BorderLayout.SOUTH);

            playlistSet = new JAccordion();
            pane.append(playlistSet, BorderLayout.WEST);

            tracklist = new Tracklist();
            pane.append(new JScrollPane(tracklist), BorderLayout.CENTER);
	}

        public function createPlaylistSet(pl:Array, 
            defaultPlaylist:PlaylistVO,
            listSetChangedHandler:Function,
            listSelectionHandler:Function,
            listActionHandler:Function):void
        {
	    for(var i:Number = 0; i < pl.length; i += 2) {
                var key:String = pl[i];
                var v:Array = pl[i + 1] as Array;
                Console.log(this, 'create playlistSet '+ key + v.length);

                var model:VectorListModel = new VectorListModel();
                var list:XActionList = new XActionList(model,
                    new GeneralListCellFactory(PlaylistCell, false, true, 24));
                list.setVisibleCellWidth(136);
                list.setVisibleRowCount(9);

                list.addSelectionListener(listSelectionHandler);
    	        list.addCellActionListener(listActionHandler);
                playlistSet.appendTab(new JScrollPane(list), pl[i]);

                for (var j:int = 0; j < v.length; j++) {
                    model.append(v[j]);
                    if (v[j] == defaultPlaylist) {
                        list.setSelectedIndex(j);
                        playlistSet.setSelectedIndex(int(i/2));
                    }
                }
            }
            playlistSet.addStateListener(listSetChangedHandler);
        }

        public function getPlayer():Player {
            return playerUI;
        }

        public function getTracklist():Tracklist {
            return tracklist;
        }

        public function getPlaylistSet():JAccordion {
            return playlistSet;
        }

        public function getLyric():XLyric {
            return lyric;
        }

        public function getProgress():XSlider {
            return playerUI.getProgress();
        }

	// override public function doLayout():void { 
        //     Console.log(this, 'dolayout');
        // }

        override public function getUIClassID():String {
	    return "AppWindowUI";
        }
    }
}
