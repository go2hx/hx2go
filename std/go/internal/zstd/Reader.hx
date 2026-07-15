package go.internal.zstd;

@:structInit
@:go.Type({ name: "Reader", instanceName: "zstd.Reader", imports: ["internal/zstd"] })
extern class Reader {

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadByte") function readByte(): go.Result<go.Byte>;
    @:native("Reset") function reset(input: go.io.Reader): Void;

}