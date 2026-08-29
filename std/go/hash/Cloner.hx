package go.hash;

/**
    A Cloner is a hash function whose state can be cloned, returning a value with
    equivalent and independent state.
    
    All [Hash] implementations in the standard library implement this interface,
    unless GOFIPS140=v1.0.0 is set.
    
    If a hash can only determine at runtime if it can be cloned (e.g. if it wraps
    another hash), Clone may return an error wrapping [errors.ErrUnsupported].
    Otherwise, Clone must always return a nil error.
**/
@:go.Type({ name: "Cloner", instanceName: "hash.Cloner", imports: ["hash"] })
extern typedef Cloner = {

    @:native("BlockSize") function blockSize(): (go.GoInt);
    @:native("Clone") function clone(): (go.Result<go.hash.Cloner>);
    @:native("Reset") function reset(): Void;
    @:native("Size") function size(): (go.GoInt);
    @:native("Sum") function sum(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}