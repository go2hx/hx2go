package go;
import haxe.Rest;

@:coreType
@:runtimeValue
extern abstract Slice<T> {
    @:pure private extern static function _create<T>(length:Int): T;

    public var length(get, never): GoInt;
    private inline function get_length(): GoInt {
        return Go.len(this);
    }

    public var capacity(get, never): GoInt;
    private inline function get_capacity(): GoInt {
        return Go.cap(this);
    }

    public inline function new(?length:Int) {
        this = _create(length ?? 0);
    }

    public inline function append(v: T): Slice<T> {
        return Go.append(this, v);
    }

    public inline function copy(src: Slice<T>): GoInt {
        return Go.copy(this, src);
    }

    // note: marked as extern to force inline
    @:arrayAccess @:pure private extern inline function get(index: Int): T {
        return Syntax.code("{0}[{1}]", (this : Slice<T>), (index : Int));
    }

    // note: marked as extern to force inline
    @:arrayAccess private extern inline overload function set(index: Int, value: T): T {
        Syntax.code("{0}[{1}] = {2}", (this : Slice<T>), (index : Int), (value : T));
        return value; // statement cannot be used as expression
    }

    public inline function iterator(): Iterator<T> {
        return toArray().iterator();
    }

    @:pure public inline extern overload function slice(low: GoInt, high: GoInt, max: GoInt): Slice<T> {
        return Syntax.code("{0}[{1}:{2}:{3}]", (this : Slice<T>), (low : GoInt), (high : GoInt), (max : GoInt));
    }

    @:pure public inline extern overload function slice(low: GoInt, high: GoInt): Slice<T> {
        return Syntax.code("{0}[{1}:{2}]", (this : Slice<T>), (low : GoInt), (high : GoInt));
    }

    @:pure public inline extern overload function slice(low: GoInt): Slice<T> {
        return Syntax.code("{0}[{1}:]", (this : Slice<T>), (low : GoInt));
    }

    @:pure public inline extern overload function sliceEnd(high: GoInt): Slice<T> {
        return Syntax.code("{0}[:{1}]", (this : Slice<T>), (high : GoInt));
    }

    @:to public inline function toArray(): Array<T> {
        return Syntax.code("(&{0})", (this : Slice<T>));
    }

    @:from public static inline function fromArray<T>(arr: Array<T>): Slice<T> {
        return Syntax.code("(*{0})", (arr : Array<T>));
    }

}