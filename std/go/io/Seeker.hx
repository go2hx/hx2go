package go.io;

/**
    Seeker is the interface that wraps the basic Seek method.
    
    Seek sets the offset for the next Read or Write to offset,
    interpreted according to whence:
    [SeekStart] means relative to the start of the file,
    [SeekCurrent] means relative to the current offset, and
    [SeekEnd] means relative to the end
    (for example, offset = -2 specifies the penultimate byte of the file).
    Seek returns the new offset relative to the start of the
    file or an error, if any.
    
    Seeking to an offset before the start of the file is an error.
    Seeking to any positive offset may be allowed, but if the new offset exceeds
    the size of the underlying object the behavior of subsequent I/O operations
    is implementation-dependent.
**/
@:go.Type({ name: "Seeker", instanceName: "io.Seeker", imports: ["io"] })
extern typedef Seeker = {

    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);

}