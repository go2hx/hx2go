package go;

/**
    Package image implements a basic 2-D image library.
    
    The fundamental interface is called [Image]. An [Image] contains colors, which
    are described in the image/color package.
    
    Values of the [Image] interface are created either by calling functions such
    as [NewRGBA] and [NewPaletted], or by calling [Decode] on an [io.Reader] containing
    image data in a format such as GIF, JPEG or PNG. Decoding any particular
    image format requires the prior registration of a decoder function.
    Registration is typically automatic as a side effect of initializing that
    format's package so that, to decode a PNG image, it suffices to have
    
    	import _ "image/png"
    
    in a program's main package. The _ means to import a package purely for its
    initialization side effects.
    
    See "The Go image package" for more details:
    https://golang.org/doc/articles/image_package.html
    
    # Security Considerations
    
    The image package can be used to parse arbitrarily large images, which can
    cause resource exhaustion on machines which do not have enough memory to
    store them. When operating on arbitrary images, [DecodeConfig] should be called
    before [Decode], so that the program can decide whether the image, as defined
    in the returned header, can be safely decoded with the available resources. A
    call to [Decode] which produces an extremely large image, as defined in the
    header returned by [DecodeConfig], is not considered a security issue,
    regardless of whether the image is itself malformed or not. A call to
    [DecodeConfig] which returns a header which does not match the image returned
    by [Decode] may be considered a security issue, and should be reported per the
    [Go Security Policy].
    
    [Go Security Policy]: https://go.dev/security/policy
**/
@:go.Type({ name: "image", instanceName: "image.image", imports: ["image"] })
extern class Image {

    @:native("YCbCrSubsampleRatio410") static var yCbCrSubsampleRatio410: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio411") static var yCbCrSubsampleRatio411: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio420") static var yCbCrSubsampleRatio420: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio422") static var yCbCrSubsampleRatio422: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio440") static var yCbCrSubsampleRatio440: go.image.YCbCrSubsampleRatio;
    @:native("YCbCrSubsampleRatio444") static var yCbCrSubsampleRatio444: go.image.YCbCrSubsampleRatio;

    @:native("Black") static var black: go.Pointer<go.image.Uniform>;
    @:native("Opaque") static var opaque: go.Pointer<go.image.Uniform>;
    @:native("Transparent") static var transparent: go.Pointer<go.image.Uniform>;
    @:native("White") static var white: go.Pointer<go.image.Uniform>;
    /**
        ZP is the zero [Point].
        
        Deprecated: Use a literal [image.Point] instead.
    **/
    @:native("ZP") static var ZP: go.image.Point;
    /**
        ZR is the zero [Rectangle].
        
        Deprecated: Use a literal [image.Rectangle] instead.
    **/
    @:native("ZR") static var ZR: go.image.Rectangle;

    /**
        Decode decodes an image that has been encoded in a registered format.
        The string returned is the format name used during format registration.
        Format registration is typically done by an init function in the codec-
        specific package.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("Decode") static function decode(r: go.io.Reader): (go.Tuple<{ p0: go.image.Image, p1: String, p2: go.Error }>);
    /**
        DecodeConfig decodes the color model and dimensions of an image that has
        been encoded in a registered format. The string returned is the format name
        used during format registration. Format registration is typically done by
        an init function in the codec-specific package.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): (go.Tuple<{ p0: go.image.Config, p1: String, p2: go.Error }>);
    /**
        NewAlpha returns a new [Alpha] image with the given bounds.
    **/
    @:native("NewAlpha") static function newAlpha(r: go.image.Rectangle): (go.Pointer<go.image.Alpha>);
    /**
        NewAlpha16 returns a new [Alpha16] image with the given bounds.
    **/
    @:native("NewAlpha16") static function newAlpha16(r: go.image.Rectangle): (go.Pointer<go.image.Alpha16>);
    /**
        NewCMYK returns a new CMYK image with the given bounds.
    **/
    @:native("NewCMYK") static function newCMYK(r: go.image.Rectangle): (go.Pointer<go.image.CMYK>);
    /**
        NewGray returns a new [Gray] image with the given bounds.
    **/
    @:native("NewGray") static function newGray(r: go.image.Rectangle): (go.Pointer<go.image.Gray>);
    /**
        NewGray16 returns a new [Gray16] image with the given bounds.
    **/
    @:native("NewGray16") static function newGray16(r: go.image.Rectangle): (go.Pointer<go.image.Gray16>);
    /**
        NewNRGBA returns a new [NRGBA] image with the given bounds.
    **/
    @:native("NewNRGBA") static function newNRGBA(r: go.image.Rectangle): (go.Pointer<go.image.NRGBA>);
    /**
        NewNRGBA64 returns a new [NRGBA64] image with the given bounds.
    **/
    @:native("NewNRGBA64") static function newNRGBA64(r: go.image.Rectangle): (go.Pointer<go.image.NRGBA64>);
    /**
        NewNYCbCrA returns a new [NYCbCrA] image with the given bounds and subsample
        ratio.
    **/
    @:native("NewNYCbCrA") static function newNYCbCrA(r: go.image.Rectangle, subsampleRatio: go.image.YCbCrSubsampleRatio): (go.Pointer<go.image.NYCbCrA>);
    /**
        NewPaletted returns a new [Paletted] image with the given width, height and
        palette.
    **/
    @:native("NewPaletted") static function newPaletted(r: go.image.Rectangle, p: go.image.color.Palette): (go.Pointer<go.image.Paletted>);
    /**
        NewRGBA returns a new [RGBA] image with the given bounds.
    **/
    @:native("NewRGBA") static function newRGBA(r: go.image.Rectangle): (go.Pointer<go.image.RGBA>);
    /**
        NewRGBA64 returns a new [RGBA64] image with the given bounds.
    **/
    @:native("NewRGBA64") static function newRGBA64(r: go.image.Rectangle): (go.Pointer<go.image.RGBA64>);
    /**
        NewUniform returns a new [Uniform] image of the given color.
    **/
    @:native("NewUniform") static function newUniform(c: go.image.color.Color): (go.Pointer<go.image.Uniform>);
    /**
        NewYCbCr returns a new YCbCr image with the given bounds and subsample
        ratio.
    **/
    @:native("NewYCbCr") static function newYCbCr(r: go.image.Rectangle, subsampleRatio: go.image.YCbCrSubsampleRatio): (go.Pointer<go.image.YCbCr>);
    /**
        Pt is shorthand for [Point]{X, Y}.
    **/
    @:native("Pt") static function pt(X: go.GoInt, Y: go.GoInt): (go.image.Point);
    /**
        Rect is shorthand for [Rectangle]{Pt(x0, y0), [Pt](x1, y1)}. The returned
        rectangle has minimum and maximum coordinates swapped if necessary so that
        it is well-formed.
    **/
    @:native("Rect") static function rect(x0: go.GoInt, y0: go.GoInt, x1: go.GoInt, y1: go.GoInt): (go.image.Rectangle);
    /**
        RegisterFormat registers an image format for use by [Decode].
        Name is the name of the format, like "jpeg" or "png".
        Magic is the magic prefix that identifies the format's encoding. The magic
        string can contain "?" wildcards that each match any one byte.
        [Decode] is the function that decodes the encoded image.
        [DecodeConfig] is the function that decodes just its configuration.
    **/
    @:native("RegisterFormat") static function registerFormat(name: String, magic: String, decode: (p0: go.io.Reader) -> (go.Result<go.image.Image>), decodeConfig: (p0: go.io.Reader) -> (go.Result<go.image.Config>)): Void;

}