package go;

@:go.Type({ name: "image", instanceName: "image.image", imports: ["image"] })
extern class Image {

    @:native("YCbCrSubsampleRatio410") static var YCbCrSubsampleRatio410: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio411") static var YCbCrSubsampleRatio411: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio420") static var YCbCrSubsampleRatio420: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio422") static var YCbCrSubsampleRatio422: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio440") static var YCbCrSubsampleRatio440: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio444") static var YCbCrSubsampleRatio444: go.image.YCbCrSubsampleRatio;

    @:native("Black") static var Black: go.Pointer<go.image.Uniform>;
    @:native("Opaque") static var Opaque: go.Pointer<go.image.Uniform>;
    @:native("Transparent") static var Transparent: go.Pointer<go.image.Uniform>;
    @:native("White") static var White: go.Pointer<go.image.Uniform>;
    @:native("ZP") static var ZP: go.image.Point;
    @:native("ZR") static var ZR: go.image.Rectangle;

    @:go.Tuple("p0", "p1", "p2") @:native("Decode") static function decode(r: go.io.Reader): go.Tuple<{ p0: go.image.Image, p1: String, p2: go.Error }>;
    @:go.Tuple("p0", "p1", "p2") @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): go.Tuple<{ p0: go.image.Config, p1: String, p2: go.Error }>;
    @:native("NewAlpha") static function newAlpha(r: go.image.Rectangle): go.Pointer<go.image.Alpha>;
    @:native("NewAlpha16") static function newAlpha16(r: go.image.Rectangle): go.Pointer<go.image.Alpha16>;
    @:native("NewCMYK") static function newCMYK(r: go.image.Rectangle): go.Pointer<go.image.CMYK>;
    @:native("NewGray") static function newGray(r: go.image.Rectangle): go.Pointer<go.image.Gray>;
    @:native("NewGray16") static function newGray16(r: go.image.Rectangle): go.Pointer<go.image.Gray16>;
    @:native("NewNRGBA") static function newNRGBA(r: go.image.Rectangle): go.Pointer<go.image.NRGBA>;
    @:native("NewNRGBA64") static function newNRGBA64(r: go.image.Rectangle): go.Pointer<go.image.NRGBA64>;
    @:native("NewNYCbCrA") static function newNYCbCrA(r: go.image.Rectangle, subsampleRatio: go.image.YCbCrSubsampleRatio): go.Pointer<go.image.NYCbCrA>;
    @:native("NewPaletted") static function newPaletted(r: go.image.Rectangle, p: go.image.color.Palette): go.Pointer<go.image.Paletted>;
    @:native("NewRGBA") static function newRGBA(r: go.image.Rectangle): go.Pointer<go.image.RGBA>;
    @:native("NewRGBA64") static function newRGBA64(r: go.image.Rectangle): go.Pointer<go.image.RGBA64>;
    @:native("NewUniform") static function newUniform(c: go.image.color.Color): go.Pointer<go.image.Uniform>;
    @:native("NewYCbCr") static function newYCbCr(r: go.image.Rectangle, subsampleRatio: go.image.YCbCrSubsampleRatio): go.Pointer<go.image.YCbCr>;
    @:native("Pt") static function pt(X: go.GoInt, Y: go.GoInt): go.image.Point;
    @:native("Rect") static function rect(x0: go.GoInt, y0: go.GoInt, x1: go.GoInt, y1: go.GoInt): go.image.Rectangle;
    @:native("RegisterFormat") static function registerFormat(name: String, magic: String, decode: (p0: go.io.Reader) -> go.Result<go.image.Image>, decodeConfig: (p0: go.io.Reader) -> go.Result<go.image.Config>): Void;

}