package go;

@:coreType
@:runtimeValue
abstract Pointer<T> {

    public var value(get, set): T;

    @:pure public static extern inline function addressOf<T>(x: T): Pointer<T> { // TODO: add AsVar<T>
        return Syntax.code("(&{0})", x);
    }

    @:to
    @:pure private extern inline function get_value(): T {
        return Syntax.code("(*{0})", this);
    }

    private extern inline function set_value(x: T): T {
        Syntax.code("*{0} = {1}", this, x);
        return x;
    }

}
