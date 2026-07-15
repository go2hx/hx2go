package go.image.jpeg;

@:go.Type({ name: "Reader", instanceName: "jpeg.Reader", imports: ["image/jpeg"] })
extern typedef Reader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("ReadByte") function readByte(): go.Result<go.Byte>;

}