package go;

@:go.Type({ name: "error" })
extern class Error {

    public function error(): String;

    public inline extern function sure(): Void {
        if (this != null) { // useful helper to throw if error is not null
            throw error();
        }
    }

    public inline extern function as<T : Error>(v: T): T {
        return Syntax.code('{0}, {1} = {2}.(*exec.ExitError)');
    }

}
