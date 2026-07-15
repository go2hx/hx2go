package go.image;

@:go.Type({ name: "gif", instanceName: "gif.gif", imports: ["image/gif"] })
extern class Gif {

    @:native("DisposalBackground") static var DisposalBackground: go.GoInt;
    @:native("DisposalNone") static var DisposalNone: go.GoInt;
    @:native("DisposalPrevious") static var DisposalPrevious: go.GoInt;

    @:native("Decode") static function decode(r: go.io.Reader): go.Result<go.image.Image>;
    @:native("DecodeAll") static function decodeAll(r: go.io.Reader): go.Result<go.Pointer<go.image.gif.GIF>>;
    @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): go.Result<go.image.Config>;
    @:native("Encode") static function encode(w: go.io.Writer, m: go.image.Image, o: go.Pointer<go.image.gif.Options>): go.Error;
    @:native("EncodeAll") static function encodeAll(w: go.io.Writer, g: go.Pointer<go.image.gif.GIF>): go.Error;

}