package go.net;

/**
    Buffers contains zero or more runs of bytes to write.
    
    On certain machines, for certain types of connections, this is
    optimized into an OS-specific batch write operation (such as
    "writev").
**/
@:go.Type({ name: "Buffers", instanceName: "net.Buffers", imports: ["net"] })
extern class Buffers {

    /**
        Read from the buffers.
        
        Read implements [io.Reader] for [Buffers].
        
        Read modifies the slice v as well as v[i] for 0 <= i < len(v),
        but does not modify v[i][j] for any i, j.
    **/
    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteTo writes contents of the buffers to w.
        
        WriteTo implements [io.WriterTo] for [Buffers].
        
        WriteTo modifies the slice v as well as v[i] for 0 <= i < len(v),
        but does not modify v[i][j] for any i, j.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}