package tao.debugger
{
    import nl.demonsters.debugger.MonsterDebugger;

    public class Console {
        public static function log(target:Object, object:*, color:uint = 0x111111, functions:Boolean = false, depth:int = 4):void {
            MonsterDebugger.trace(target, object, color, functions, depth);
        };
    }
}
