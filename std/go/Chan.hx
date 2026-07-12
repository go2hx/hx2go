package go;

@:coreType
@:runtimeValue
abstract Chan<T> {
    @:pure private extern static function _create<T>(): T;

    public inline function new() {
        this = _create();
    }

    public inline extern function send(value: T): Void {
        Syntax.code("{0} <- {1}", this, value);
    }

    public inline extern function receive(): T {
        return Syntax.code("<- {0}", this);
    }

}