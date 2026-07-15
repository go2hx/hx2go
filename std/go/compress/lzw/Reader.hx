package go.compress.lzw;

@:structInit
@:go.Type({ name: "Reader", instanceName: "lzw.Reader", imports: ["compress/lzw"] })
extern class Reader {

    @:native("Close") function close(): go.Error;
    @:native("Read") function read(b: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("Reset") function reset(src: go.io.Reader, order: go.compress.lzw.Order, litWidth: go.GoInt): Void;

}