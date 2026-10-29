package go;

@:runtimeValue
@:forward
@:forwardStatics
@:forward.new
@:go.AbstractNoGenericErasure
extern abstract Value<T>(T) {

    @:from
    @:pure public static extern inline function of<T>(x: T): Value<T> {
        return cast x;
    }

    @:to
    @:pure
    private extern inline function norm(): T {
        var tmp: Value<T> = this;
        return cast tmp;
    }

    public extern inline function ptr(): Pointer<T> {
        var tmp: T = norm();
        return Pointer.addressOf(tmp);
    }

}