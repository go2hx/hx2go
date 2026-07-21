package go;

@:coreType
@:runtimeValue
abstract Chan<T> {
    @:pure private extern static function _create<T>(length: Int): T;

    public inline function new(?length: Int) {
        this = _create(length ?? 0);
    }

    public extern inline function send(value: T) {
       Syntax.code("{0} <- {1}", (this : Chan<T>), (value : T));
    }

    public extern inline function receive(): T {
        return Syntax.code("<- {0}", (this : Chan<T>));
    }

    @:go.Tuple("value", "ok") public extern inline function tryReceive(): Tuple<{value:T, ok:Bool}> {
        Syntax.code("return <- {0}", (this : Chan<T>));
        throw "unreachable";
    }
}