import go.haxe.HxString;

@:coreType
extern class String {
    var length(default, null):Int;

    function new(string:String): Void;

    inline function toUpperCase():String {
        return HxString.toUpperCase(this);
    }
    inline function toLowerCase():String {
        return HxString.toLowerCase(this);
    }

    inline function charAt(index:Int):String {
        return HxString.charAt(this, index);
    }
    inline function charCodeAt(index:Int):Null<Int> {
        return HxString.charCodeAt(this, index);
    }
    inline function indexOf(str:String, ?startIndex:Int):Int {
       return HxString.indexOf(this, str, startIndex);
    }
    inline function lastIndexOf(str:String, ?startIndex:Int):Int {
        return HxString.lastIndexOf(this, str, startIndex);
    }
    inline function split(delimiter:String):Array<String> {
        return HxString.split(this, delimiter);
    }
    inline function substr(pos:Int, ?len:Int):String {
        return HxString.substr(this, pos, len);
    }
    inline function substring(startIndex:Int, ?endIndex:Int):String {
        return HxString.substring(this, startIndex, endIndex);
    }
    inline function toString():String {
        return HxString.toString(this);
    }
    @:pure inline static function fromCharCode(code:Int):String {
        return HxString.fromCharCode(code);
    }

}