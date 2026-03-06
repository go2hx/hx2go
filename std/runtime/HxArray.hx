package runtime;

import haxe.Rest;
import go.Syntax;
import go.Slice;
import go.GoInt;
import go.Go;

// TODO: remove extern from class and functions when module resolution works correctly.
class HxArray {

    @:pure public static function getData<T>(arr: Array<T>): Slice<T>
        return Syntax.code('(*{0})', arr);

    public static function setData<T>(arr: Array<T>, data: Slice<T>): Void
        Syntax.code('(*{0}) = {1}', arr, data);

    public static function push<T>(arr: Array<T>, value: T): GoInt {
        var data = getData(arr);
        setData(arr, Go.append(data, value));

        return data.length + 1;
    }

    @:pure public static function concat<T>(on: Array<T>, arr: Array<T>): Array<T> {
        var newArr: Array<T> = on.copy();
        setData(newArr, Syntax.code('append({0}, {1}...)', getData(newArr), getData(arr)));

        return newArr;
    }

    @:pure public static function copy<T>(arr: Array<T>): Array<T> {
        var newArr: Array<T> = [];
        setData(newArr, Syntax.code('append({0}, {1}...)', getData(newArr), getData(arr)));

        return newArr;
    }

    public static extern inline function pop<T>(arr: Array<T>): Null<T> {
        var data = getData(arr);
        var lastIdx = data.length - 1;

        if (lastIdx < 0) {
            return null; // TODO: won't work until Null<T> is implemented
        }

        var last = data[lastIdx];
        setData(arr, data.sliceEnd(lastIdx));

        return last;
    }

    public static function reverse<T>(arr: Array<T>): Void {
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

    public static extern inline function shift<T>(arr: Array<T>): Null<T> {
        var data = getData(arr);
        if (data.length == 0) {
            return null; // TODO: won't work until Null<T> is implemented
        }

        var first = data[0];
        setData(arr, data.slice(1));

        return first;
    }

    public static function unshift<T>(arr: Array<T>, value: T): Void {
        setData(arr, Syntax.code('append({0}, {1}...)', getData(([value] : Array<T>)), getData(arr)));
    }

    public static function insert<T>(arr: Array<T>, pos: Int, value: T): Void {
        var length = arr.length;
        var clampedPos = if (pos > length) length;
            else if (pos < 0) length + pos < 0 ? 0 : length + pos;
            else pos;

        var grow = Go.append(getData(arr), value);
        setData(arr, grow);

        Go.copy(grow.slice(clampedPos + 1), grow.slice(clampedPos));

        grow[clampedPos] = value;
    }

    public static function splice<T>(arr: Array<T>, pos: Int, length: Int): Array<T> {
        var data = getData(arr);
        var length = data.length;

        if (length < 0) {
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

        var removeLen: GoInt = if (start + length > length) {
            length - start;
        } else {
            length;
        }

        if (removeLen <= 0) {
            return [];
        }

        var removed: Array<T> = [];

        setData(
            removed,
            Syntax.code(
                'append({0}, {1}[{2}:{3}]...)',
                getData(removed),
                getData(arr),
                start,
                start + removeLen
            )
        );

        setData(
            arr,
            Syntax.code(
                'append({0}[:{1}], {0}[{2}:]...)',
                getData(arr),
                start,
                start + removeLen
            )
        );

        return removed;
    }

    public static extern inline function slice<T>(arr: Array<T>, pos: Int, ?end: Int): Array<T> {
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
                'append({0}, {1}[{2}:{3}]...)',
                getData(result),
                getData(arr),
                start,
                stop
            )
        );

        return result;
    }

    public static extern inline function remove<T>(arr: Array<T>, x: T): Bool {
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
                'append({0}[:{1}], {0}[{2}:]...)',
                getData(arr),
                index,
                index + 1
            )
        );

        return true;
    }

    public static extern inline function indexOf<T>(arr: Array<T>, x: T, ?fromIndex: Int): GoInt {
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

    public static extern inline function lastIndexOf<T>(arr: Array<T>, x: T, ?fromIndex: Int): GoInt {
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

    @:pure public static extern inline function contains<T>(arr: Array<T>, x: T): Bool {
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

    public static extern inline function join<T>(arr: Array<T>, ?separator: String): String {
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

    public static function map<X, Y>(arr: Array<X>, f: X->Y): Array<Y> {
        var output: Array<Y> = [];

        for (x in arr) {
            output.push(f(x));
        }

        return output;
    }

    public static function filter<T>(arr: Array<T>, f: T->Bool): Array<T> {
        var output: Array<T> = [];

        for (x in arr) {
            if (f(x)) {
                output.push(x);
            }
        }

        return output;
    }

    public static function sort<T>(arr: Array<T>, f: T->T->Int): Void {
        var data = getData(arr);
        var length = data.length;

        for (i in 0...length) {
            for (j in 0...length - i - 1) {
                if (f(data[j], data[j + 1]) > 0) {
                    var temp = data[j];
                    data[j] = data[j + 1];
                    data[j + 1] = temp;
                }
            }
        }
    }

    public static function resize<T>(arr: Array<T>, length: Int): Void {
        var data = getData(arr);
        var dataLength = data.length;

        if (length < dataLength) {
            setData(arr, data.slice(0, length));
        } else if (length > dataLength) {
            var newData = Syntax.code("make([]Hx_Param__T, {0})", length);
            Go.copy(newData, data);
            setData(arr, newData);
        }
    }

    public static function toString<T>(arr: Array<T>): String {
        return Std.string(arr);
    }

}
