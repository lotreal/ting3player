package tao.aswing
{
    import tao.debugger.Console;

    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;

    import tao.util.StringUtils;
    
    public class LyricModel extends EventDispatcher
    {
        private var lrcAry:Array;
        private var loader:URLLoader;

        public function loadLrc(s:String):void
        {
            Console.log(this, s);
            lrcAry = [{ lrc:"***正在加载歌词***", time:int.MAX_VALUE }];
            if(loader)
            {
                loader.removeEventListener(Event.COMPLETE, onLoadComplete);
                loader.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
                loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoadError);
                try
                {
                    loader.close();
                } 
                catch(e:*) {}
            }
            
            loader = new URLLoader(new URLRequest(s));
            loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
            loader.addEventListener(Event.COMPLETE, onLoadComplete);
            loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onLoadError);
            this.fireChangeEvent();
        }

        private function onLoadComplete(e:Event):void
        {
            lrcAry = [];
            var lrc:String = StringUtils.readMultiByte(loader.data);
            Console.log(this, lrc);
            var offset:RegExp = /\[offset\:(.+)\]/;
            var line:RegExp = /(?P<mt>(\[\d{2}\:\d{2}\.\d{2}\])+) (?P<lrc>.*)/gx;
            var timeRe:RegExp = /\[(?P<mm>\d{2}) \: (?P<ss>\d{2}) \. (?P<ms>\d{2})\]/gx;
            do{
                var res:Object = line.exec(lrc);
                if(res)
                {
                    var multiTime:String = res.mt;
                    do
                    {
                        var timeRes:Object = timeRe.exec(multiTime);
                        if(timeRes != null)
                        {
                            var time:Number = Number(timeRes.mm) * 60 + Number(timeRes.ss);
                            time = time * 1000 + Number(timeRes.ms);
                            lrcAry.push({ time:time, lrc:res.lrc||" " });
                            // Console.log(this, res.lrc);
                        }
                    }while(timeRes != null)
                }
            }while(res != null)
            
            lrcAry.sortOn("time", Array.NUMERIC);
            
            var headAry:Array = [];
            headAry.push({ lrc:"*** ting3.com ***" });
            var ti:RegExp = /\[ti\:(.+)\]/;
            var ar:RegExp = /\[ar\:(.+)\]/;
            var by:RegExp = /\[by\:(.+)\]/;
            res = ti.exec(lrc);
            if(res) headAry.push({ lrc:"歌曲：" + res[1] });
            res = ar.exec(lrc);
            if(res) headAry.push({ lrc:"演唱：" + res[1] });
            
            var f:Object = lrcAry[0];
            var ps:Number = Number(lrcAry[0].time) / headAry.length;
            for(var i:int = 0; i < headAry.length; i++)
            headAry[i].time = ps * i;
            
            lrcAry = headAry.concat(lrcAry);
            //lrcAry.push({ lrc:"***完***", time:int.MAX_VALUE });
            Console.log(this, lrcAry);
            this.fireChangeEvent();
        }

        private function onLoadError(e:Event):void
        {
            lrcAry = [{ lrc:"***暂无歌词***", time:int.MAX_VALUE }];
            this.fireChangeEvent();
        }

        public function getLrc():Array
        {
            return lrcAry;
        }

        public function addStateListener(listener:Function):void
        {
            this.addEventListener(Event.CHANGE, listener);
        }

        public function removeStateListener(listener:Function):void
        {
            this.removeEventListener(Event.CHANGE, listener);
        }

        private function fireChangeEvent():void
        {
            this.dispatchEvent(new Event(Event.CHANGE));
        }
    }
}
