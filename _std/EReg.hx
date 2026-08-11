import go.Regexp_ as GoRegexp;
import go.regexp.Regexp;
import go.haxe.HxArray;
import go.Slice;
import go.Byte;
import go.Go;
import go.Pointer;
import go.GoInt;

// TODO: not pcre2 compliant, which it should be, but good enough for now...
class EReg {

    var re: Pointer<Regexp>;
    var str: String;
    var matchPos: Array<GoInt>;
    var global: Bool;

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

        matchPos = [];
        str = s;

        HxArray.setData(matchPos, idx);

        return true;
    }

    public function matched(n: Int): String {
        if (matchPos == null || n < 0 || n * 2 + 1 >= matchPos.length) {
            return null;
        }

        var a = matchPos[n * 2];
        var b = matchPos[n * 2 + 1];
        if (a < 0 || b < 0) {
            return null;
        }

        return str.substring(a, b);
    }

    public function matchedLeft(): String {
        if (matchPos == null) {
            return null;
        }

        return str.substring(0, matchPos[0]);
    }

    public function matchedRight(): String {
        if (matchPos == null) {
            return null;
        }

        return str.substring(matchPos[1]);
    }

    public function matchedPos(): {pos: Int, len: Int} {
        if (matchPos == null) {
            return null;
        }

        return {
            pos: matchPos[0],
            len: matchPos[1] - matchPos[0]
        };
    }

    public function matchSub(s: String, pos: Int, len: Int = -1): Bool {
        var sub = len < 0 ? s.substring(pos) : s.substring(pos, pos + len);
        var idx: Slice<GoInt> = re.findStringSubmatchIndex(sub);
        if (idx == null || idx.length == 0) {
            matchPos = null;
            return false;
        }

        matchPos = [];
        str = s;

        HxArray.setData(matchPos, idx);

        for (i in 0...matchPos.length) {
            if (matchPos[i] >= 0) matchPos[i] += pos;
        }

        return true;
    }

    public function matchedNum(): Int {
        return matchPos == null ? 0 : Std.int(matchPos.length / 2);
    }

    public function split(s: String): Array<String> {
        var parts: Slice<String> = re.split(s, -1);
        var result: Array<String> = [];

        HxArray.setData(result, parts);

        return result;
    }

    public function replace(s: String, by: String): String {
        if (global) {
            return re.replaceAllString(s, by);
        }

        var idx: Slice<GoInt> = re.findStringSubmatchIndex(s);
        if (idx == null || idx.length == 0) {
            return s;
        }

        var before = s.substring(0, idx[0]);
        var after = s.substring(idx[1]);
        var dst: Slice<Byte> = new Slice<Byte>(0);
        dst = re.expandString(dst, by, s, idx);

        return before + Go.string(dst) + after;
    }

    public function map(s: String, f: EReg->String): String {
        var buf = new StringBuf();
        var pos = 0;
        while (pos <= s.length) {
            var sub = s.substring(pos);
            var idx: Slice<GoInt> = re.findStringSubmatchIndex(sub);
            if (idx == null || idx.length == 0) {
                break;
            }

            var start = idx[0] + pos;
            var end = idx[1] + pos;
            buf.add(s.substring(pos, start));

            matchPos = [];
            str = s;

            HxArray.setData(matchPos, idx);

            for (i in 0...matchPos.length) {
                if (matchPos[i] >= 0) matchPos[i] += pos;
            }

            buf.add(f(this));

            if (end == start) {
                if (end < s.length) buf.add(s.charAt(end));
                pos = end + 1;
            } else {
                pos = end;
            }

            if (!global) {
                break;
            }
        }

        buf.add(s.substring(pos > s.length ? s.length : pos));

        return buf.toString();
    }

    public static function escape(s: String): String {
        return GoRegexp.quoteMeta(s);
    }

}