package go;

@:coreType
@:runtimeValue
extern abstract GoArray<T, @:const Size: Int> {

    public var length(get, never): GoInt;
    private inline function get_length(): GoInt {
        return Go.len(this);
    }

    // note: marked as extern to force inline
    @:arrayAccess @:pure private extern inline function get(index: Int): T {
        return Syntax.code("{0}[{1}]", this, (index : Int));
    }

    // note: marked as extern to force inline
    @:arrayAccess private extern inline overload function set(index: Int, value: T): T {
        Syntax.code("{0}[{1}] = {2}", this, (index : Int), (value : T));
        return value; // statement cannot be used as expression
    }

    @:to public inline function toSlice(): Slice<T> {
        return Syntax.code("{0}[:]", this);
    }

    @:pure public inline extern overload function slice(low: GoInt, high: GoInt, max: GoInt): Slice<T> {
        return Syntax.code("{0}[{1}:{2}:{3}]", this, (low : GoInt), (high : GoInt), (max : GoInt));
    }

    @:pure public inline extern overload function slice(low: GoInt, high: GoInt): Slice<T> {
        return Syntax.code("{0}[{1}:{2}]", this, (low : GoInt), (high : GoInt));
    }

    @:pure public inline extern overload function slice(low: GoInt): Slice<T> {
        return Syntax.code("{0}[{1}:]", this, (low : GoInt));
    }

    @:pure public inline extern overload function sliceEnd(high: GoInt): Slice<T> {
        return Syntax.code("{0}[:{1}]", (this : Slice<T>), (high : GoInt));
    }

}