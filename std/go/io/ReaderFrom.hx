package go.io;

/**
    ReaderFrom is the interface that wraps the ReadFrom method.
    
    ReadFrom reads data from r until EOF or error.
    The return value n is the number of bytes read.
    Any error except EOF encountered during the read is also returned.
    
    The [Copy] function uses [ReaderFrom] if available.
**/
@:go.Type({ name: "ReaderFrom", instanceName: "io.ReaderFrom", imports: ["io"] })
extern typedef ReaderFrom = {

    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);

}