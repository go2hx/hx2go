package go;

@:coreType
@:runtimeValue
extern abstract GoArray<T, @:const Size: Int> {

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

}