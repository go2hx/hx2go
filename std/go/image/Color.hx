package go.image;

/**
    Package color implements a basic color library.
**/
@:go.Type({ name: "color", instanceName: "color.color", imports: ["image/color"] })
extern class Color {

    /**
        Models for the standard color types.
    **/
    @:native("Alpha16Model") static var alpha16Model: go.image.color.Model;
    /**
        Models for the standard color types.
    **/
    @:native("AlphaModel") static var alphaModel: go.image.color.Model;
    /**
        Standard colors.
    **/
    @:native("Black") static var black: go.image.color.Gray16;
    /**
        CMYKModel is the [Model] for CMYK colors.
    **/
    @:native("CMYKModel") static var cMYKModel: go.image.color.Model;
    /**
        Models for the standard color types.
    **/
    @:native("Gray16Model") static var gray16Model: go.image.color.Model;
    /**
        Models for the standard color types.
    **/
    @:native("GrayModel") static var grayModel: go.image.color.Model;
    /**
        Models for the standard color types.
    **/
    @:native("NRGBA64Model") static var nRGBA64Model: go.image.color.Model;
    /**
        Models for the standard color types.
    **/
    @:native("NRGBAModel") static var nRGBAModel: go.image.color.Model;
    /**
        NYCbCrAModel is the [Model] for non-alpha-premultiplied Y'CbCr-with-alpha
        colors.
    **/
    @:native("NYCbCrAModel") static var nYCbCrAModel: go.image.color.Model;
    /**
        Standard colors.
    **/
    @:native("Opaque") static var opaque: go.image.color.Alpha16;
    /**
        Models for the standard color types.
    **/
    @:native("RGBA64Model") static var rGBA64Model: go.image.color.Model;
    /**
        Models for the standard color types.
    **/
    @:native("RGBAModel") static var rGBAModel: go.image.color.Model;
    /**
        Standard colors.
    **/
    @:native("Transparent") static var transparent: go.image.color.Alpha16;
    /**
        Standard colors.
    **/
    @:native("White") static var white: go.image.color.Gray16;
    /**
        YCbCrModel is the [Model] for Y'CbCr colors.
    **/
    @:native("YCbCrModel") static var yCbCrModel: go.image.color.Model;

    /**
        CMYKToRGB converts a [CMYK] quadruple to an RGB triple.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("CMYKToRGB") static function cMYKToRGB(c: go.UInt8, m: go.UInt8, y: go.UInt8, k: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8 }>);
    /**
        ModelFunc returns a [Model] that invokes f to implement the conversion.
    **/
    @:native("ModelFunc") static function modelFunc(f: (p0: go.image.color.Color) -> (go.image.color.Color)): (go.image.color.Model);
    /**
        RGBToCMYK converts an RGB triple to a CMYK quadruple.
    **/
    @:go.Tuple("p0", "p1", "p2", "p3") @:native("RGBToCMYK") static function rGBToCMYK(r: go.UInt8, g: go.UInt8, b: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8, p3: go.UInt8 }>);
    /**
        RGBToYCbCr converts an RGB triple to a Y'CbCr triple.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("RGBToYCbCr") static function rGBToYCbCr(r: go.UInt8, g: go.UInt8, b: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8 }>);
    /**
        YCbCrToRGB converts a Y'CbCr triple to an RGB triple.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("YCbCrToRGB") static function yCbCrToRGB(y: go.UInt8, cb: go.UInt8, cr: go.UInt8): (go.Tuple<{ p0: go.UInt8, p1: go.UInt8, p2: go.UInt8 }>);

}