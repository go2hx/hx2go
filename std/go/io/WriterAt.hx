package go.io;

/**
    WriterAt is the interface that wraps the basic WriteAt method.
    
    WriteAt writes len(p) bytes from p to the underlying data stream
    at offset off. It returns the number of bytes written from p (0 <= n <= len(p))
    and any error encountered that caused the write to stop early.
    WriteAt must return a non-nil error if it returns n < len(p).
    
    If WriteAt is writing to a destination with a seek offset,
    WriteAt should not affect nor be affected by the underlying
    seek offset.
    
    Clients of WriteAt can execute parallel WriteAt calls on the same
    destination if the ranges do not overlap.
    
    Implementations must not retain p.
**/
@:go.Type({ name: "WriterAt", instanceName: "io.WriterAt", imports: ["io"] })
extern typedef WriterAt = {

    @:native("WriteAt") function writeAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}