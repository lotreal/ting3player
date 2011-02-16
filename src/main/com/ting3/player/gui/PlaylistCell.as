package com.ting3.player.gui
{
    import tao.debugger.Console;
    import tao.aswing.XActionListCell;

    import org.aswing.ASColor; 
    import org.aswing.BorderLayout;
    import org.aswing.JLabel;
    import org.aswing.Insets;
    import org.aswing.ListCell;
    import org.aswing.border.EmptyBorder;

    import com.ting3.player.model.vo.PlaylistVO;

    public class PlaylistCell extends XActionListCell implements ListCell {
	private var title:JLabel;
        private var playlist:PlaylistVO;

        public function PlaylistCell() {
        }

	override public function setCellValue(v:*):void{
            playlist = v as PlaylistVO;
            title.setText(playlist.title);
	}

	override public function getCellValue():*{
	    return playlist;
	}

        override protected function setContent():void
        {
	    title = new JLabel();
            title.setIcon(new ColorIcon(ASColor.GRAY, 3, 3));
	    content_pane.append(title, BorderLayout.WEST);
        }

        override protected function setAction():void
        {
            addAction('S', 'share');
            addAction('F', 'fav');
        }
    }
}
