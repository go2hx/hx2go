package go.haxe;

import go.Strings;
import go.unicode.Utf8;

class HxString {
    // TODO: remove comment, templ
    public static function toUpperCase(s: String):String {
        return Strings.toUpper(s);
    }

    public static function toLowerCase(s: String):String {
        return Strings.toLower(s);
    }

    public static function charAt(s: String, index:Int): String {
        var v = charCodeAt(s, index);
        if (v == null) {
            return "";
        }

        return cast Go.string((v : Int));
    }

    public static function charCodeAt(s: String, index: Int): Null<Int> {
        var str_len = s.length;
        if (index < 0 || index > str_len) {
            return null;
        }

        var i = 0;
        var j = 0;
        while (i < str_len) {
            if (j == index) {
                var v = Utf8.decodeRuneInString(Syntax.code("{0}[{1}:]", s, i));
                return v.size == 0 ? null : v.r;
            }

            var b:Int = Syntax.code("int({0}[{1}])", s, i);
            i += if (b < 0x80) 1 else if (b < 0xE0) 2 else if (b < 0xF0) 3 else 4;
            j++;
        }

        return null;
    }

    public static function indexOf(s: String, str:String, ?startIndex:Int):Int {
        if (startIndex == null ) {
            return Strings.index(s, str);
        }
        if (startIndex < 0) {
            startIndex = 0;
        }
        if (startIndex > s.length) {
            startIndex = s.length;
        }

        var index = 0;
        var diff = 0;
        var s:Slice<Byte> = s;

        while (startIndex > index) {
            var obj = Utf8.decodeRune(s.slice(diff));
            diff += obj.size;
            index++;
        }
        var sliced:String = Go.string(s.slice(diff));
        var found:Int = Strings.index(sliced, str);

        return found < 0 ? -1 : found + startIndex;
    }
    public static function lastIndexOf(s: String, str:String, ?startIndex:Int):Int {
        if (startIndex != null ) {
            var end:Int = startIndex + str.length;
            if (end <= 0) {
                return -1;
            }
            if (end > s.length) {
                end = s.length;
            }

            var diff = 0;
            var s:Slice<Byte> = s;

            while (end > 0) {
                var obj = Utf8.decodeRune(s.slice(diff));
                diff += obj.size;
                end--;
            }

            var sliced:String = Go.string(s.slice(0, diff));
            return Strings.lastIndex(sliced, str);
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