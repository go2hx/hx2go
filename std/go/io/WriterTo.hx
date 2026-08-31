package go.io;

/**
    WriterTo is the interface that wraps the WriteTo method.
    
    WriteTo writes data to w until there's no more data to write or
    when an error occurs. The return value n is the number of bytes
    written. Any error encountered during the write is also returned.
    
    The Copy function uses WriterTo if available.
**/
@:go.Type({ name: "WriterTo", instanceName: "io.WriterTo", imports: ["io"] })
extern typedef WriterTo = {

    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}