package com.ting3.player.model 
{
    import tao.debugger.Console;
    import com.riaidea.utils.zip.ZipArchive;
    import com.riaidea.utils.zip.ZipFile;
    
    import flash.display.BitmapData;
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    
    import com.ting3.player.Signal;
    import tao.utils.BMPDecoder;
    import tao.utils.BitmapDataUtil;
    import tao.aswing.laf.IXmlSkin;

    public class SkinProxy extends BasicProxy implements IXmlSkin
    {
	public static const NAME:String = "SkinProxy";
	
	public function SkinProxy(data:Object = null) 
	{
	    super(NAME, data);
	}
	
	//zip
	private var zip:ZipArchive;	
	//XML配置文件
	private var skinXML:XML;
	private var listXML:XML;
	private var lrcXML:XML;
	//缕空色
	private var tnpetColor:Number;	
	//BMP解析
	private var bmpDecoder:BMPDecoder = new BMPDecoder;
	//当前解析索引
	private var decodeIndex:int = 0;
	//一帧解析几个
	private var decodeCount:int = 10;
	//解析完成的BMP
	private var bmpMap:Object =  { };
	private var ready:Boolean;
	
	/**
	* 加载皮肤文件
	* @param	url
	*/
	public function loadSkin(data:ByteArray):void {
	    data.endian = Endian.LITTLE_ENDIAN;


	    zip = new ZipArchive;
	    zip.open(data);
	    ready = false;
	    
	    bmpMap = new Object;
	    skinXML = parseXML(fixXML(getZipFileByName("Skin.xml").data.toString()));
	    listXML = parseXML(getZipFileByName("playlist.xml").data.toString());
	    lrcXML  = parseXML(getZipFileByName("lyric.xml").data.toString());
	    //缕空色
	    // tnpetColor = Number(skinXML.@transparent_color.split("#").join("0x"));
	    //解析索引计数
	    decodeIndex = 0;
            Console.log(this, 'skin loaded');
            Console.log(this, skinXML);
	    //线程式解析BMP
	    decodeBMP();

            Console.log(this, bmpMap);
	    ready = true;
	    //完成
	    this.sendNotification(Signal.APP_SKIN_LOADED);
	}
	
	/**
	* 解析BMP
	*/
	private function decodeBMP():void
	{
	    decodeCount = zip.numFiles;
	    for (var c:int = 0; c < decodeCount; c++) {
		var zipFile:ZipFile = zip.getFileAt(c);
		var zipName:String = zipFile.name.toLocaleLowerCase();
		if (zipName.indexOf(".bmp") != -1) {
		    var bitmap:BitmapData = bmpDecoder.decode(zipFile.data);
		    bmpMap[zipName] = BitmapDataUtil.transparent(bitmap, tnpetColor);
		}
	    }
	}
	
	
	
	/**
	* 忽略大小写名称取file
	* @param	name
	* @return
	*/
	public function getZipFileByName(name:String):ZipFile {
	    for (var i:Number = 0; i < zip.numFiles; i++) {
		if (name.toLocaleLowerCase() == zip.getFileAt(i).name.toLocaleLowerCase()) {
		    return zip.getFileAt(i);
		}
	    }
	    return null;
	}
	
	
	public function getBitmap(libName:String):BitmapData {
	    libName = libName.toLocaleLowerCase();
	    var bmp:BitmapData = bmpMap[libName] as BitmapData;
	    if(bmp)
	    return bmp.clone();
	    return bmpMap[libName];
	}
	
	private function parseXML(str:String):XML{
	    return new XML(str.toLocaleLowerCase());
	}
	
	public function getSkinXml():XML {
	    return skinXML;
	}
	
	public function getListXml():XML{
	    return listXML;
	}
	
	public function getLyricXml():XML{
	    return lrcXML;
	}

	private function fixXML(xmlString:String):XML {
	    var reg:RegExp = /= *([^\"'])+[ |\/]/;
            return new XML(xmlString.replace(reg, "=\"$1\" ").toLocaleLowerCase());
	}
    }
}
