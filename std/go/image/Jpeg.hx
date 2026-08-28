package go.image;

/**
    Package jpeg implements a JPEG image decoder and encoder.
    
    JPEG is defined in ITU-T T.81: https://www.w3.org/Graphics/JPEG/itu-t81.pdf.
**/
@:go.Type({ name: "jpeg", instanceName: "jpeg.jpeg", imports: ["image/jpeg"] })
extern class Jpeg {

    /**
        DefaultQuality is the default quality encoding parameter.
    **/
    @:native("DefaultQuality") static var defaultQuality: go.GoInt;

    /**
        Decode reads a JPEG image from r and returns it as an [image.Image].
    **/
    @:native("Decode") static function decode(r: go.io.Reader): (go.Result<go.image.Image>);
    /**
        DecodeConfig returns the color model and dimensions of a JPEG image without
        decoding the entire image.
    **/
    @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): (go.Result<go.image.Config>);
    /**
        Encode writes the Image m to w in JPEG 4:2:0 baseline format with the given
        options. Default parameters are used if a nil *[Options] is passed.
    **/
    @:native("Encode") static function encode(w: go.io.Writer, m: go.image.Image, o: go.Pointer<go.image.jpeg.Options>): (go.Error);

}