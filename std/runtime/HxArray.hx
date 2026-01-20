package runtime;

import haxe.Rest;
import go.Syntax;
import go.Slice;
import go.GoInt;
import go.Go;

// TODO: remove extern from class and functions when module resolution works correctly.
class HxArray {

    @:pure public inline extern static function getData<T>(arr: Array<T>): Slice<T>
        return Syntax.code('*{0}', arr);

    public inline extern static function setData<T>(arr: Array<T>, data: Slice<T>): Void
        Syntax.code('*{0} = {1}', arr, data);

    public inline extern static function push<T>(arr: Array<T>, value: T): GoInt {
        var data = getData(arr);
        setData(arr, Go.append(data, value));

        return data.length;
    }

    @:pure public inline extern static function concat<T>(on: Array<T>, arr: Array<T>): Array<T> {
        var newArr: Array<T> = on.copy();
        setData(newArr, Syntax.code('append(*{0}, *{1}...)', newArr, arr));

        return newArr;
    }

    @:pure public inline extern static function copy<T>(arr: Array<T>): Array<T> {
        var newArr: Array<T> = [];
        setData(newArr, Syntax.code('append(*{0}, *{1}...)', newArr, arr));

        return newArr;
    }

    public inline extern static function pop<T>(arr: Array<T>): Null<T> {
        var data = getData(arr);
        var lastIdx = data.length - 1;

        var last = data[lastIdx];
        setData(arr, data.sliceEnd(lastIdx));

        return last;
    }

    public inline extern static function reverse<T>(arr: Array<T>): Void {
        var data = getData(arr);
        var x = 0;
        var y = data.length - 1;

        while (x < y) {
            var dx = data[x];
            var dy = data[y];
            data[x] = dy;
            data[y] = dx;

            x++;
            y--;
        }
    }

    public inline extern static function shift<T>(arr: Array<T>): Null<T> {
        var data = getData(arr);
        if (data.length == 0) {
            return null; // TODO: won't work until Null<T> is implemented
        }

        var first = data[0];
        setData(arr, data.slice(1));

        return first;
    }

    public inline extern static function unshift<T>(arr: Array<T>, value: T): Void {
        setData(arr, Syntax.code('append(*{0}, *{1}...)', ([value] : Array<T>), arr));
    }

    public inline extern static function insert<T>(arr: Array<T>, pos: Int, value: T): Void {
        var length = arr.length;
        var clampedPos = if (pos > length) length;
            else if (pos < 0) length + pos < 0 ? 0 : length + pos;
            else pos;

        var grow = Go.append(getData(arr), value);
        setData(arr, grow);

        Go.copy(grow.slice(clampedPos + 1), grow.slice(clampedPos));

        grow[clampedPos] = value;
    }

    public inline extern static function splice<T>(arr: Array<T>, pos: Int, len: Int): Array<T> {
        var data = getData(arr);
        var length = data.length;

        if (len < 0) {
            return [];
        }

        var start: GoInt = if (pos < 0) {
            var p = length + pos;
            p < 0 ? 0 : p;
        } else {
            pos;
        };

        if (start > length) {
            return [];
        }

        var removeLen: GoInt = if (start + len > length) {
            length - start;
        } else {
            len;
        }

        if (removeLen <= 0) {
            return [];
        }

        var removed: Array<T> = [];

        setData(
            removed,
            Syntax.code(
                'append(*{0}, *{1}[{2}:{3}]...)',
                removed,
                arr,
                start,
                start + removeLen
            )
        );

        setData(
            arr,
            Syntax.code(
                'append(*{0}[:{1}], *{0}[{2}:]...)',
                arr,
                start,
                start + removeLen
            )
        );

        return removed;
    }

    public inline extern static function slice<T>(arr: Array<T>, pos: Int, ?end: Int): Array<T> {
        var data = getData(arr);
        var length = data.length;

        var start: GoInt = if (pos < 0) {
            var p = length + pos;
            p < 0 ? 0 : p;
        } else {
            pos;
        };

        var clampedEnd: GoInt = if (end == null) {
            length;
        } else if (end < 0) {
            var e = length + end;
            e < 0 ? 0 : e;
        } else {
            end;
        };

        var stop: GoInt = clampedEnd > length ? length : clampedEnd;
        if (start > length || stop <= start) {
            return [];
        }

        var result: Array<T> = [];

        setData(
            result,
            Syntax.code(
                'append(*{0}, *{1}[{2}:{3}]...)',
                result,
                arr,
                start,
                stop
            )
        );

        return result;
    }

    public inline extern static function remove<T>(arr: Array<T>, x: T): Bool {
        var data = getData(arr);
        var length = data.length;

        var i: GoInt = 0;
        var index: GoInt = -1;

        while (i < length) {
            if (data[i] == x) {
                index = i;
                break;
            }
            i++;
        }

        if (index == -1) {
            return false;
        }

        setData(
            arr,
            Syntax.code(
                'append(*{0}[:{1}], *{0}[{2}:]...)',
                arr,
                index,
                index + 1
            )
        );

        return true;
    }

    public inline extern static function indexOf<T>(arr: Array<T>, x: T, ?fromIndex: Int): GoInt {
        var data = getData(arr);
        var length = data.length;

        var start: GoInt = if (fromIndex == null) {
            0;
        } else if (fromIndex < 0) {
            var idx = length + fromIndex;
            idx < 0 ? 0 : idx;
        } else {
            fromIndex;
        }

        if (start >= length) {
            return -1;
        }

        var i: GoInt = start;
        var res: GoInt = -1;
        while (i < length) {
            if (data[i] == x) {
                res = i;
                break;
            }
            i++;
        }

        return res;
    }

    public inline extern static function lastIndexOf<T>(arr: Array<T>, x: T, ?fromIndex: Int): GoInt {
        var data = getData(arr);
        var length = data.length;

        var start: GoInt = if (fromIndex == null) {
            length - 1;
        } else if (fromIndex < 0) {
            var idx = length + fromIndex;
            idx < 0 ? -1 : idx;
        } else if (fromIndex >= length) {
            length - 1;
        } else {
            fromIndex;
        }

        if (start < 0) {
            return -1;
        }

        var i: GoInt = start;
        var res: GoInt = -1;

        while (i >= 0) {
            if (data[i] == x) {
                res = i;
                break;
            }
            i--;
        }

        return res;
    }

    @:pure public inline extern static function contains<T>(arr: Array<T>, x: T): Bool {
        var data = getData(arr);
        var length = data.length;

        var i: GoInt = 0;
        var res: Bool = false;
        while (i < length) {
            if (data[i] == x) {
                res = true;
                break;
            }
            i++;
        }

        return res;
    }

    public inline extern static function join<T>(arr: Array<T>, ?separator: String): String {
        var data = getData(arr);
        var length = data.length;
        var sep: String = if (separator == null) "," else separator;

        if (length == 0) {
            return "";
        }

        var result: String = "";
        var i: GoInt = 0;

        while (i < length) {
            result += data[i];

            if (i < length - 1) {
                result += sep;
            }

            i++;
        }

        return result;
    }

    public inline extern static function toString<T>(arr: Array<T>): String {
        return Std.string(arr);
    }

}
