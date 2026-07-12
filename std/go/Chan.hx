package go;

@:coreType
@:runtimeValue
extern abstract Chan<T> {
    @:pure private extern static function _create<T>(length:Int): T;

    public inline function new(?length:Int) {
        this = _create(length ?? 0);
    }

    @:pure public extern inline function send(v:T) {
       Syntax.code("{0} <- {1}", (this : Chan<T>), (v : T));
    }

    @:pure public extern inline function receive():T {
        return Syntax.code("<-{0}", (this : Chan<T>));
    }
}