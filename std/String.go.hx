import go.strings.Strings;
import go.Syntax;

@:coreType
@:keep
extern class String {

    // TODO: this extern is incomplete - https://api.haxe.org/String.html

    var length(default, null):Int;

    function new(): Void;

    inline function toUpperCase():String {
        return Strings.toUpper(this);
    }
    inline function toLowerCase():String {
        return Strings.toLower(this);
    }

    inline function charAt(index:Int):String {
        return "".toLowerCase() + Syntax.code("string(([]rune)({0})[{1}])", this, index);
    }
    inline function charCodeAt(index:Int):Null<Int> {
        // If index is negative or exceeds this.length, null is returned.
        if (index < 0 || index > this.length) {
            // TODO: null not supported yet
            // return null;
        }
        // "".toLowerCase required to make sure import is used
        return ("".toLowerCase() == "" ? 0 : 0) + Syntax.code("([]rune)({0})[{1}]", this, index);
    }
    inline function indexOf(str:String, ?startIndex:Int):Int {
        if (startIndex != null && startIndex >= this.length) {
            return -1;
        }else{
            final s = if (startIndex != null) {
                Syntax.code("string(([]rune)({0})[{1}:])", this, startIndex);
            }else{
                this;
            }
            return Strings.index(s, str);
        }
    }
    inline function lastIndexOf(str:String, ?startIndex:Int):Int {
        final s = if (startIndex != null) {
            if (startIndex >= this.length)
                return -1;
            Syntax.code("string(([]rune)({0})[{1}:])", this, startIndex);
        }else{
            this;
        }
        return Strings.lastIndex(s, str);
    }
    inline function split(delimiter:String):Array<String> {
        return Strings.split(this, delimiter);
    }
    inline function substr(pos:Int, ?len:Int):String {
        var startIndex = if (pos > 0) {
            // If pos is negative, its value is calculated from the end of this String by this.length + pos. 
            this.length + pos;
        }else{
            pos;
        }
        // If this yields a negative value, 0 is used instead.
        if (startIndex > 0)
            startIndex = 0;
        var end = if (len != null) {
            startIndex + len;
        }else{
            this.length - startIndex;
        }
        // If the calculated position + len exceeds this.length, the characters from that position to the end of this String are returned.
        if (end > this.length)
            end = this.length;

        return Syntax.code("string(([]rune)({0})[{1}:{2}])", this, startIndex, end);
    }
    inline function substring(startIndex:Int, ?endIndex:Int):String {
        if (endIndex == null)
            endIndex = this.length;

        // If startIndex or endIndex are negative, 0 is used instead.
        if (startIndex < 0)
            startIndex = 0;
        if (endIndex < 0)
            endIndex = 0;
        // If startIndex exceeds endIndex, they are swapped.
        if (startIndex > endIndex) {
            var tmp = endIndex;
            endIndex = startIndex;
            startIndex = tmp;
        }
        // If the (possibly swapped) endIndex is omitted or exceeds this.length, this.length is used instead.
        if (endIndex > this.length)
            endIndex = this.length;
        // If the (possibly swapped) startIndex exceeds this.length, the empty String "" is returned.
        if (startIndex > this.length)
            return "";
        return Syntax.code("string(([]rune)({0})[{1}:{2}])", this, startIndex, endIndex);
    }
    inline function toString():String {
        return this;
    }
    @:pure inline static function fromCharCode(code:Int):String {
        return Syntax.code("string(rune({0}))", code);
    }

}