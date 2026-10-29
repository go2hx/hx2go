package go;

@:runtimeValue
@:forward
@:forwardStatics
@:go.AbstractNoGenericErasure
abstract Value<T>(T) {

    @:from
    @:pure public static extern inline function of<T>(x: T): Value<T> {
        return cast x;
    }

    @:to
    @:pure
    private extern inline function norm(): T {
        return cast this;
    }

    public extern inline function ptr(): Pointer<T> {
        var tmp = norm();
        return Pointer.addressOf(tmp);
    }

}