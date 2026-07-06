package go;

@:go.Type({ name: "error" })
extern class Error {

    public function error(): String;

    public inline extern function sure(): Void {
        if (this != null) { // useful helper to throw if error is not null
            throw error();
        }
    }

}
