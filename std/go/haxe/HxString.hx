package go.haxe;

import go.Strings;

class HxString {
    // TODO: remove comment, templ
    public static function toUpperCase(s: String):String {
        return Strings.toUpper(s);
    }

    public static function toLowerCase(s: String):String {
        return Strings.toLower(s);
    }

    public static function charAt(s: String, index:Int):String {
        return "".toLowerCase() + Syntax.code("string(([]rune)({0})[{1}])", s, index);
    }
    public static function charCodeAt(s: String, index:Int): Null<Int> {
        // If index is negative or exceeds s.length, null is returned.
        if (index < 0 || index > s.length) {
            return null;
        }

        var code:go.Int32 = Syntax.code("([]rune)({0})[{1}]", s, index);
        return code;
    }
    public static function indexOf(s: String, str:String, ?startIndex:Int):Int {
        if (startIndex != null ) {
            if (startIndex >= s.length) {
                return -1;
            }
            s = Syntax.code("string(([]rune)({0})[{1}:])", s, (startIndex : Int));
        }
        return Strings.index(s, str);
    }
    public static function lastIndexOf(s: String, str:String, ?startIndex:Int):Int {
        if (startIndex != null ) {
            if (startIndex >= s.length) {
                return -1;
            }
            s = Syntax.code("string(([]rune)({0})[{1}:])", s, (startIndex : Int));
        }
        return Strings.lastIndex(s, str);
    }
    public static function split(s: String, delimiter:String):Array<String> {
        var x = Strings.split(s, delimiter);
        return x;
    }
    public static function substr(s: String, pos:Int, ?len:Int):String {
        var startIndex = if (pos < 0) {
            // If pos is negative, its value is calculated from the end of s String by s.length + pos. 
            s.length + pos;
        }else{
            pos;
        }
        // If s yields a negative value, 0 is used instead.
        if (startIndex < 0)
            startIndex = 0;
        var end = if (len != null) {
            startIndex + len;
        }else{
            s.length;
        }

        // if len is negative
        if (len != null && len < 0) {
            return "";
        }

        // If the calculated position + len exceeds s.length, the characters from that position to the end of s String are returned.
        if (end > s.length)
            end = s.length;

        return Syntax.code("string(([]rune)({0})[{1}:{2}])", s, startIndex, (end : Int));
    }
    public static function substring(s: String, startIndex:Int, ?endIndex:Int):String {
        if (endIndex == null)
            endIndex = s.length;

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
        // If the (possibly swapped) endIndex is omitted or exceeds s.length, s.length is used instead.
        if (endIndex > s.length)
            endIndex = s.length;
        // If the (possibly swapped) startIndex exceeds s.length, the empty String "" is returned.
        if (startIndex > s.length)
            return "";
        return Syntax.code("string(([]rune)({0})[{1}:{2}])", s, startIndex, (endIndex : Int));
    }
    @:pure public static function toString(s:String):String {
        return s;
    }
    @:pure public static function fromCharCode(code:Int):String {
        return Syntax.code("string(rune({0}))", code);
    }
}