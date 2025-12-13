package go;

@:coreType
@:runtimeValue
extern abstract Slice<T> {
    @:pure private extern static function _create<T>(): T;

    public var length(get, never): Int32;
    private inline function get_length(): Int32 {
        return Go.len(this);
    }

    public var capacity(get, never): Int32;
    private inline function get_capacity(): Int32 {
        return Go.cap(this);
    }

    public inline function new() {
        this = _create();
    }

    public inline function append(v: T): Slice<T> {
        return Go.append(this, v);
    }

    public inline function copy(src: Slice<T>): Int32 {
        return Go.copy(this, src);
    }

    // note: marked as extern to force inline
    @:arrayAccess @:pure private extern inline function get(index: Int): T {
        return Syntax.code("{0}[{1}]", this, index);
    }

    // note: marked as extern to force inline
    @:arrayAccess private extern inline overload function set(index: Int, value: T): T {
        Syntax.code("{0}[{1}] = {2}", this, index, value);
        return value; // statement cannot be used as expression
    }

    @:pure public inline extern overload function slice(low: Int32, high: Int32, max: Int32): Slice<T> {
        return Syntax.code("{0}[{1}:{2}:{3}]", this, low, high, max);
    }

    @:pure public inline extern overload function slice(low: Int32, high: Int32): Slice<T> {
        return Syntax.code("{0}[{1}:{2}]", this, low, high);
    }

    @:pure public inline extern overload function slice(low: Int32): Slice<T> {
        return Syntax.code("{0}[{1}:]", this, low);
    }
}
