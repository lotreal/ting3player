package com.ting3.mvc.model
{
    import com.ting3.geom.Song;
    import com.ting3.geom.SongList;

    public class MP3ListProxy extends BasicProxy
    {
	public static const NAME:String = "MP3ListProxy";
	
	private var arrOfList:Array = [];
	
	private var list:SongList;
	private var curSong:Song;
	
	public function MP3ListProxy()
	{
	    super(NAME);
	}
	
	public function setXML(x:XML):void{
	    var songXmlList:XMLList = x.list;
	    for each(var list:XML in songXmlList){
		var sl:SongList = new SongList(list.@name);
		for each(var sXml:XML in list.mp3){
		    var s:Song = new Song(sXml.@name, sXml.@src, sXml.@lrc);
		    sl.addSong(s);
		}
		arrOfList.push(sl);
	    }
	}
	
	public function getAllLists():Array{
	    return arrOfList;
	}
	
	public function setCurrentList(list:SongList):void{
	    list = list;
	    curSong = list.getSelectedValue();
	}
	
	public function selectDefaultSong():void{
	    if(curSong == null)
	    list.setSelectedIndex(0);
	}
	
	public function selectNextSong():void{
	    list.setSelectedIndex(list.getSelectedIndex() + 1);
	}
	
	public function selectPrevSong():void{
	    list.setSelectedIndex(list.getSelectedIndex() - 1);
	}
	
	/**
	* 当前曲 
	* @return 
	* 
	*/		
	public function getCurrentSong():Song{
	    curSong = list.getSelectedValue();
	    return curSong;
	}
	
	
	public function hasNext():Boolean{
	    return list != null && (list.getSelectedIndex() < list.getModel().getSize() - 1);
	}
	
	public function hasPrev():Boolean{
	    return list != null && (list.getSelectedIndex() > 0);
	}
    }
}
