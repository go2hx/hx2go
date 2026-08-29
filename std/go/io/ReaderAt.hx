package go.io;

/**
    ReaderAt is the interface that wraps the basic ReadAt method.
    
    ReadAt reads len(p) bytes into p starting at offset off in the
    underlying input source. It returns the number of bytes
    read (0 <= n <= len(p)) and any error encountered.
    
    When ReadAt returns n < len(p), it returns a non-nil error
    explaining why more bytes were not returned. In this respect,
    ReadAt is stricter than Read.
    
    Even if ReadAt returns n < len(p), it may use all of p as scratch
    space during the call. If some data is available but not len(p) bytes,
    ReadAt blocks until either all the data is available or an error occurs.
    In this respect ReadAt is different from Read.
    
    If the n = len(p) bytes returned by ReadAt are at the end of the
    input source, ReadAt may return either err == EOF or err == nil.
    
    If ReadAt is reading from an input source with a seek offset,
    ReadAt should not affect nor be affected by the underlying
    seek offset.
    
    Clients of ReadAt can execute parallel ReadAt calls on the
    same input source.
    
    Implementations must not retain p.
**/
@:go.Type({ name: "ReaderAt", instanceName: "io.ReaderAt", imports: ["io"] })
extern typedef ReaderAt = {

    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}