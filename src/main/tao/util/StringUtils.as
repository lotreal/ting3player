package tao.util
{
    import tao.debugger.Console;
    import flash.utils.ByteArray;
    import flash.system.Capabilities;

    public class StringUtils
    {
	public static function readMultiByte(ba:ByteArray):String {
            return ba.toString();
            var ret:String;
            var flag:ByteArray = new ByteArray();
            Console.log(StringUtils, ba.toString());
            ba.readBytes(flag, 0, 2);
            var f:String = flag.readUnsignedShort().toString(16);
            ba.position = 0;
            Console.log(StringUtils, "FLAG: " + f);
            switch (f)
            {
                case "fffe":
                Console.log(StringUtils, "Unicode");
                ret = ba.readMultiByte(ba.length, "unicode");
                break;

                case "feff":
                Console.log(StringUtils, "Unicode big endian");
                ret = ba.readMultiByte(ba.length,"unicodeFFFE");
                break;

                case "efbb":
                Console.log(StringUtils, "UTF-8");
                ret = ba.readMultiByte(ba.length, "utf-8");
                break;

                default:
                Console.log(StringUtils, "ANSI");
                //可以自行添加别的国家的默认编码
                var lang:String = Capabilities.language;
                Console.log(StringUtils, lang);

                if (lang=="zh-CN")
                ret = ba.readMultiByte(ba.length, "GBK");

                if (lang=="zh-TW")
                ret = ba.readMultiByte(ba.length, "big5");

                if (lang=="en")
                ret = ba.readMultiByte(ba.length, "us-ascii");

                if (lang=="ja")
                ret = ba.readMultiByte(ba.length, "shift_jis");
            }
            return ret;
        }

        public static function decryptionUrl(sourceString:String):String
        {
            var first:Number = Number(sourceString.charAt(0));
            var code:String = sourceString.substring(1);
            var _loc5:int = Math.floor(code.length / first);
            var _loc6:int = code.length % first;
            var _loc2:Array = new Array();
            var i:int;

            for (i = 0; i < _loc6; ++i)
            {
                if (_loc2[i] == undefined)
                {
                    _loc2[i] = "";
                }
                _loc2[i] = code.substr((_loc5 + 1) * i, _loc5 + 1);
            }
            for (i = _loc6; i < first; ++i)
            {
                _loc2[i] = code.substr(_loc5 * (i - _loc6) + (_loc5 + 1) * _loc6, _loc5);
            }
            // hFaF54mt%m1%_pt2i1253pF.3F%%fn%5531e2%EA.tF58%x%4E42i238.
            var _loc4:String = "";
            for (i = 0; i < _loc2[0].length; ++i)
            {
                for (var j:int = 0; j < _loc2.length; ++j)
                {
                    _loc4 = _loc4 + _loc2[j].charAt(i);
                }
            }
            // http%3A%2F%2Ff1.xiami.net%2F113%2F435%2F5%5E84_5%5E84.mp3
            _loc4 = unescape(_loc4);
            // http://f1.xiami.net/113/435/5^84_5^84.mp3
            var url:String = "";
            for (i = 0; i < _loc4.length; ++i)
            {
                if (_loc4.charAt(i) == "^")
                {
                    url = url + "0";
                    continue;
                }
                url = url + _loc4.charAt(i);
            }
            // http://f1.xiami.net/113/435/5084_5084.mp3
            return (url);
        }

    }
}
