package go.io;

/**
    A PipeWriter is the write half of a pipe.
**/
@:structInit
@:go.Type({ name: "PipeWriter", instanceName: "io.PipeWriter", imports: ["io"] })
extern class PipeWriter {

    /**
        Close closes the writer; subsequent reads from the
        read half of the pipe will return no bytes and EOF.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        CloseWithError closes the writer; subsequent reads from the
        read half of the pipe will return no bytes and the error err,
        or EOF if err is nil.
        
        CloseWithError never overwrites the previous error if it exists
        and always returns nil.
    **/
    @:native("CloseWithError") function closeWithError(err: go.Error): (go.Error);
    /**
        Write implements the standard Write interface:
        it writes data to the pipe, blocking until one or more readers
        have consumed all the data or the read end is closed.
        If the read end is closed with an error, that err is
        returned as err; otherwise err is [ErrClosedPipe].
    **/
    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}