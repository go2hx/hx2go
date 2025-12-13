package go;

@:coreType
@:runtimeValue
extern abstract Slice<T> {
    @:pure private extern static function _create<T>(): T;

    public var length(get, never): Int32;
    private inline function get_length(): Int32 {
        return Go.len(this);
    }

    public inline function new() {
        this = _create();
    }

    public inline function append(v: T): Slice<T> {
        return Go.append(this, v);
    }
}
