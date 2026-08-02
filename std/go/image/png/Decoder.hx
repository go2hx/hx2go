package go.image.png;

@:structInit
@:go.Type({ name: "decoder", instanceName: "png.decoder", imports: ["image/png"] })
extern class Decoder {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}