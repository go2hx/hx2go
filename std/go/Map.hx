package go;

@:coreType
@:runtimeValue
abstract Map<K, V> {
    @:pure private extern static function _create<T>(): T;

    public inline function new() {
        this = _create();
    }

    @:arrayAccess
    public inline extern function set(key: K, value: V): Void {
        Syntax.code("{0}[{1}] = {2}", this, key, value);
    }

    @:arrayAccess
    @:pure
    public inline extern function get(key: K): V {
        return Syntax.code("{0}[{1}]", this, key);
    }

    public inline extern function exists(key: K): Bool {
        var ok: Bool = false;
        Syntax.code("_, {2} = {0}[{1}]", this, key, ok);

        return ok;
    }

    public inline extern function remove(key: K): Void {
        Syntax.code("delete({0}, {1})", this, key);
    }

    public inline extern function size(): GoInt {
        return Syntax.code("len({0})", this);
    }

    public inline extern function keys(): Slice<K> {
        var keys: Slice<K> = new Slice();
        Syntax.code("for k := range {0} {{1} = append({1}, k)}", this, keys);

        return keys;
    }

    public inline extern function values(): Slice<V> {
        var values: Slice<V> = new Slice();
        Syntax.code("for _, v := range {0} {{1} = append({1}, v)}", this, values);

        return values;
    }

    public inline extern function clear(): Void {
        Syntax.code("clear({0})", this);
    }

}