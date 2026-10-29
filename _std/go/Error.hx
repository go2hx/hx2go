package go;

@:go.Type({ name: "error" })
private extern class _Error {

    public function error(): String;

    public inline extern function sure(): Void {
        if (this != null) { // useful helper to throw if error is not null
            throw error();
        }
    }

}

@:forward
abstract Error(_Error) from _Error to _Error {

    @:op(a!)
    public inline extern function sure(): Void {
        if (this != null) {
            throw this.error();
        }
    }

}
