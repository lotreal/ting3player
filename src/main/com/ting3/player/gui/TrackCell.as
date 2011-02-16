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

    import com.ting3.player.model.vo.TrackVO;

    public class TrackCell extends XActionListCell implements ListCell {
        private var track:TrackVO;

	private var title:JLabel;
	private var artist:JLabel;

        public function TrackCell() {
        }

	override public function setCellValue(v:*):void{
            track = v as TrackVO;
            title.setText(track.title);
            artist.setText(track.artist);
	}
	
	override public function getCellValue():*{
	    return track;
	}

        override protected function setContent():void
        {
            title = new JLabel();
            title.setHorizontalAlignment(JLabel.LEFT);
            title.setIcon(new ColorIcon(ASColor.GRAY, 3, 3));
            title.setPreferredWidth(200);
            title.setBorder(new EmptyBorder(null, new Insets(0,50,0,10)));
	    content_pane.append(title, BorderLayout.WEST);

	    artist = new JLabel();
	    content_pane.append(artist, BorderLayout.CENTER);
        }

        override protected function setAction():void
        {
            addAction('S', 'share');
            addAction('F', 'fav');
        }
    }
}
