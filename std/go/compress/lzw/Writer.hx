package go.compress.lzw;

@:structInit
@:go.Type({ name: "Writer", instanceName: "lzw.Writer", imports: ["compress/lzw"] })
extern class Writer {

    @:native("Close") function close(): go.Error;
    @:native("Reset") function reset(dst: go.io.Writer, order: go.compress.lzw.Order, litWidth: go.GoInt): Void;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}