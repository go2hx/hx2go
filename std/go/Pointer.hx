package go;

@:runtimeValue
@:forward
@:forwardStatics
@:go.AbstractNoGenericErasure
abstract Pointer<T>(T) {

    public var value(get, set): T;

    @:from
    @:pure public static extern inline function addressOf<T>(x: T): Pointer<T> { // TODO: add AsVar<T>
        return cast x;
    }

    @:to
    @:pure private extern inline function get_value(): T {
        return cast this;
    }

    private extern inline function set_value(x: T): T {
        Syntax.code("*{0} = {1}", this, x);
        return x;
    }

}