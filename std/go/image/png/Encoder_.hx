package go.image.png;

@:structInit
@:go.Type({ name: "encoder", instanceName: "png.encoder", imports: ["image/png"] })
extern class Encoder_ {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}