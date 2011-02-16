package tao.aswing.laf
{
    import flash.display.BitmapData;
    
    public interface IXmlSkin
    {
	function getSkinXml():XML;

	function getLyricXml():XML;

	function getBitmap(fileName:String):BitmapData
    }
}
