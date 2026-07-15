package go.image;

@:go.Type({ name: "png", instanceName: "png.png", imports: ["image/png"] })
extern class Png {

    @:native("BestCompression") static var BestCompression: go.image.png.CompressionLevel;
    @:native("BestSpeed") static var BestSpeed: go.image.png.CompressionLevel;
    @:native("DefaultCompression") static var DefaultCompression: go.image.png.CompressionLevel;
    @:native("NoCompression") static var NoCompression: go.image.png.CompressionLevel;

    @:native("Decode") static function decode(r: go.io.Reader): go.Result<go.image.Image>;
    @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): go.Result<go.image.Config>;
    @:native("Encode") static function encode(w: go.io.Writer, m: go.image.Image): go.Error;

}