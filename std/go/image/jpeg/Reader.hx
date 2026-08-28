package go.image.jpeg;

/**
    Deprecated: Reader is not used by the [image/jpeg] package and should
    not be used by others. It is kept for compatibility.
**/
@:go.Type({ name: "Reader", instanceName: "jpeg.Reader", imports: ["image/jpeg"] })
extern typedef Reader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}