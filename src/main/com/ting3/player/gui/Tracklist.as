package com.ting3.player.gui
{
    import tao.debugger.Console;
    import org.aswing.JList;
    import org.aswing.VectorListModel;
    import org.aswing.GeneralListCellFactory;

    import tao.aswing.XActionList;
    import com.ting3.player.gui.TrackCell;
    import com.ting3.player.model.vo.TrackVO;
    
    public class Tracklist extends XActionList {
        public function Tracklist() {
            super();
            this.setCellFactory(new GeneralListCellFactory(TrackCell, false, true, 24));
            this.setVisibleCellWidth(136);
            this.setVisibleRowCount(9);
        }

        public function getSelectedTrack():TrackVO
        {
            return getSelectedValue() as TrackVO;
        }

	public function selectDefaultSong():void{
            if (isSelectionEmpty()) setSelectedIndex(0);
	}
	
	public function next():void{
	    setSelectedIndex(getSelectedIndex() + 1);
	}
	
	public function prev():void{
	    setSelectedIndex(getSelectedIndex() - 1);
	}
	
	public function hasNext():Boolean{
	    return (getSelectedIndex() < getModel().getSize() - 1);
	}
	
	public function hasPrev():Boolean{
	    return (getSelectedIndex() > 0);
	}
    }
}
