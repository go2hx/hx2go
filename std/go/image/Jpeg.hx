package go.image;

@:go.Type({ name: "jpeg", instanceName: "jpeg.jpeg", imports: ["image/jpeg"] })
extern class Jpeg {

    @:native("DefaultQuality") static var DefaultQuality: go.GoInt;

    @:native("Decode") static function decode(r: go.io.Reader): go.Result<go.image.Image>;
    @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): go.Result<go.image.Config>;
    @:native("Encode") static function encode(w: go.io.Writer, m: go.image.Image, o: go.Pointer<go.image.jpeg.Options>): go.Error;

}