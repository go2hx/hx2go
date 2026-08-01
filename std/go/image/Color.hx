package go.image;

@:go.Type({ name: "color", instanceName: "color.color", imports: ["image/color"] })
extern class Color {

    @:native("Alpha16Model") static var alpha16Model: go.image.color.Model;
    @:native("AlphaModel") static var alphaModel: go.image.color.Model;
    @:native("Black") static var black: go.image.color.Gray16;
    @:native("CMYKModel") static var cMYKModel: go.image.color.Model;
    @:native("Gray16Model") static var gray16Model: go.image.color.Model;
    @:native("GrayModel") static var grayModel: go.image.color.Model;
    @:native("NRGBA64Model") static var nRGBA64Model: go.image.color.Model;
    @:native("NRGBAModel") static var nRGBAModel: go.image.color.Model;
    @:native("NYCbCrAModel") static var nYCbCrAModel: go.image.color.Model;
    @:native("Opaque") static var opaque: go.image.color.Alpha16;
    @:native("RGBA64Model") static var rGBA64Model: go.image.color.Model;
    @:native("RGBAModel") static var rGBAModel: go.image.color.Model;
    @:native("Transparent") static var transparent: go.image.color.Alpha16;
    @:native("White") static var white: go.image.color.Gray16;
    @:native("YCbCrModel") static var yCbCrModel: go.image.color.Model;

    @:go.Tuple("p0", "p1", "p2") @:native("CMYKToRGB") static function cMYKToRGB(c: go.UInt8, m: go.UInt8, y: go.UInt8, k: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8 }>);
    @:native("ModelFunc") static function modelFunc(f: (p0: go.image.color.Color) -> (go.image.color.Color)): (go.image.color.Model);
    @:go.Tuple("p0", "p1", "p2", "p3") @:native("RGBToCMYK") static function rGBToCMYK(r: go.UInt8, g: go.UInt8, b: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8, p3: go.UInt8 }>);
    @:go.Tuple("p0", "p1", "p2") @:native("RGBToYCbCr") static function rGBToYCbCr(r: go.UInt8, g: go.UInt8, b: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8 }>);
    @:go.Tuple("p0", "p1", "p2") @:native("YCbCrToRGB") static function yCbCrToRGB(y: go.UInt8, cb: go.UInt8, cr: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8 }>);

}