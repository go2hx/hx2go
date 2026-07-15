package go.compress.flate;

@:go.Type({ name: "Reader", instanceName: "flate.Reader", imports: ["compress/flate"] })
extern typedef Reader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadByte") function readByte(): go.Result<go.Byte>;

}