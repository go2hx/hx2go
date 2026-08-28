package go.io;

/**
    Writer is the interface that wraps the basic Write method.
    
    Write writes len(p) bytes from p to the underlying data stream.
    It returns the number of bytes written from p (0 <= n <= len(p))
    and any error encountered that caused the write to stop early.
    Write must return a non-nil error if it returns n < len(p).
    Write must not modify the slice data, even temporarily.
    
    Implementations must not retain p.
**/
@:go.Type({ name: "Writer", instanceName: "io.Writer", imports: ["io"] })
extern typedef Writer = {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}