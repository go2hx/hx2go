import go.Regexp as GoRegexp;
import go.regexp.Regexp;
import go.Slice;
import go.Byte;
import go.Go;
import go.Pointer;
import go.GoInt;
import go.Syntax;
import go.unicode.Utf8;

// TODO: not pcre2 compliant, which it should be, but good enough for now...
class EReg {

    var re: Pointer<Regexp>;
    var str: String;
    var matchPos: Array<GoInt>;
    var global: Bool;

    private inline function byteSub(s: String, a: Int, b: Int): String {
        return Syntax.code("{0}[{1}:{2}]", s, a, b);
    }

    private inline function byteFrom(s: String, a: Int): String {
        return Syntax.code("{0}[{1}:]", s, a);
    }

    private inline function byteLen(s: String): Int {
        return Go.len(s);
    }

    private inline function charToByte(s: String, pos: Int): Int {
        var i = 0;
        var n = byteLen(s);

        while (pos > 0 && i < n) {
            i += Utf8.decodeRuneInString(byteFrom(s, i)).size;
            pos--;
        }

        return i;
    }

    public function new(r: String, opt: String) {
        var flags = "";
        if (opt != null) {
            if (opt.indexOf("i") != -1) flags += "i";
            if (opt.indexOf("m") != -1) flags += "m";
            if (opt.indexOf("s") != -1) flags += "s";
            global = opt.indexOf("g") != -1; // must be specific order
        }

        var pattern = flags.length > 0 ? "(?" + flags + ")" + r : r;
        // TODO remove once we get a different regexp engine
        // temp fix to evade haxe.Template failing compilation
        var compiled = GoRegexp.compile(pattern);
        if (compiled.isOk()) {
            re = compiled.sure();
        }
    }

    public function match(s: String): Bool {
        var idx: Slice<GoInt> = re.findStringSubmatchIndex(s);
        if (idx == null || idx.length == 0) {
            matchPos = null;
            return false;
        }

        matchPos = idx;
        str = s;

        return true;
    }

    public function matched(n: Int): String {
        if (matchPos == null) {
            throw "No string matched";
        }

        if (n < 0 || n * 2 + 1 >= matchPos.length) {
            return null;
        }

        var a = matchPos[n * 2];
        var b = matchPos[n * 2 + 1];
        if (a < 0 || b < 0) {
            return null;
        }

        return byteSub(str, a, b);
    }

    public function matchedLeft(): String {
        if (matchPos == null) {
            return null;
        }

        return byteSub(str, 0, matchPos[0]);
    }

    public function matchedRight(): String {
        if (matchPos == null) {
            return null;
        }

        return byteFrom(str, matchPos[1]);
    }

    public function matchedPos(): {pos: Int, len: Int} {
        if (matchPos == null) {
            return null;
        }

        var begin = matchPos[0];
        var end = matchPos[1];

        return {
            pos: Utf8.runeCountInString(byteSub(str, 0, begin)),
            len: Utf8.runeCountInString(byteSub(str, begin, end))
        };
    }

    public function matchSub(s: String, pos: Int, len: Int = -1): Bool {
        var byte = charToByte(s, pos);
        var sub = len < 0 ? byteFrom(s, byte) : byteSub(s, byte, charToByte(s, pos + len));
        var idx: Slice<GoInt> = re.findStringSubmatchIndex(sub);
        if (idx == null || idx.length == 0) {
            matchPos = null;
            return false;
        }

        matchPos = idx;
        str = s;

        for (i in 0...matchPos.length) {
            if (matchPos[i] >= 0) matchPos[i] += byte;
        }

        return true;
    }

    public function matchedNum(): Int {
        return matchPos == null ? 0 : Std.int(matchPos.length / 2);
    }

    public function split(s: String): Array<String> {
        return re.split(s, global ? -1 : 2).toArray();
    }

    public function replace(s: String, by: String): String {
        if (global) {
            return re.replaceAllString(s, by);
        }

        var idx: Slice<GoInt> = re.findStringSubmatchIndex(s);
        if (idx == null || idx.length == 0) {
            return s;
        }

        var before = byteSub(s, 0, idx[0]);
        var after = byteFrom(s, idx[1]);
        var dst: Slice<Byte> = new Slice<Byte>(0);
        dst = re.expandString(dst, by, s, idx);

        return before + Go.string(dst) + after;
    }

    public function map(s: String, f: EReg->String): String {
        var matches: Slice<Slice<GoInt>> = global ? re.findAllStringSubmatchIndex(s, -1) : {
            var m = re.findStringSubmatchIndex(s);
            m == null ? [] : [m];
        }

        var buf = new StringBuf();
        var pos = 0;
        var mi = 0;
        var bytes = byteLen(s);

        while (pos < bytes) {
            while (mi < matches.length && matches[mi][0] < pos) {
                mi++;
            }

            if (mi >= matches.length) {
                break;
            }

            var idx = matches[mi];
            var start = idx[0];
            var end = idx[1];

            buf.add(byteSub(s, pos, start));

            matchPos = idx;
            str = s;

            buf.add(f(this));

            if (end == start) {
                if (end < s.length) {
                    var size = Utf8.decodeRuneInString(byteFrom(s, end)).size;
                    buf.add(byteSub(s, end, end + size));
                    pos = end + size;
                } else pos = end + 1;
            } else {
                pos = end;
            }

            mi++;

            if (!global) {
                break;
            }
        }

        buf.add(byteFrom(s, pos > bytes ? bytes : pos));

        return buf.toString();
    }

    public static function escape(s: String): String {
        return GoRegexp.quoteMeta(s);
    }

}