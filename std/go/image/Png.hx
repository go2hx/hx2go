package go.image;

/**
    Package png implements a PNG image decoder and encoder.
    
    The PNG specification is at https://www.w3.org/TR/PNG/.
**/
@:go.Type({ name: "png", instanceName: "png.png", imports: ["image/png"] })
extern class Png {

    @:native("BestCompression") static var bestCompression: go.image.png.CompressionLevel;
    @:native("BestSpeed") static var bestSpeed: go.image.png.CompressionLevel;
    @:native("DefaultCompression") static var defaultCompression: go.image.png.CompressionLevel;
    @:native("NoCompression") static var noCompression: go.image.png.CompressionLevel;

    /**
        Decode reads a PNG image from r and returns it as an [image.Image].
        The type of Image returned depends on the PNG contents.
    **/
    @:native("Decode") static function decode(r: go.io.Reader): (go.Result<go.image.Image>);
    /**
        DecodeConfig returns the color model and dimensions of a PNG image without
        decoding the entire image.
    **/
    @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): (go.Result<go.image.Config>);
    /**
        Encode writes the Image m to w in PNG format. Any Image may be
        encoded, but images that are not [image.NRGBA] might be encoded lossily.
    **/
    @:native("Encode") static function encode(w: go.io.Writer, m: go.image.Image): (go.Error);

}