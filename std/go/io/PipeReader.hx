package go.io;

/**
    A PipeReader is the read half of a pipe.
**/
@:structInit
@:go.Type({ name: "PipeReader", instanceName: "io.PipeReader", imports: ["io"] })
extern class PipeReader {

    /**
        Close closes the reader; subsequent writes to the
        write half of the pipe will return the error [ErrClosedPipe].
    **/
    @:native("Close") function close(): (go.Error);
    /**
        CloseWithError closes the reader; subsequent writes
        to the write half of the pipe will return the error err.
        
        CloseWithError never overwrites the previous error if it exists
        and always returns nil.
    **/
    @:native("CloseWithError") function closeWithError(err: go.Error): (go.Error);
    /**
        Read implements the standard Read interface:
        it reads data from the pipe, blocking until a writer
        arrives or the write end is closed.
        If the write end is closed with an error, that error is
        returned as err; otherwise err is EOF.
    **/
    @:native("Read") function read(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}