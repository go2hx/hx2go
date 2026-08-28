package go.image;

/**
    Package gif implements a GIF image decoder and encoder.
    
    The GIF specification is at https://www.w3.org/Graphics/GIF/spec-gif89a.txt.
**/
@:go.Type({ name: "gif", instanceName: "gif.gif", imports: ["image/gif"] })
extern class Gif {

    /**
        Disposal Methods.
    **/
    @:native("DisposalBackground") static var disposalBackground: go.GoInt;
    /**
        Disposal Methods.
    **/
    @:native("DisposalNone") static var disposalNone: go.GoInt;
    /**
        Disposal Methods.
    **/
    @:native("DisposalPrevious") static var disposalPrevious: go.GoInt;

    /**
        Decode reads a GIF image from r and returns the first embedded
        image as an [image.Image].
    **/
    @:native("Decode") static function decode(r: go.io.Reader): (go.Result<go.image.Image>);
    /**
        DecodeAll reads a GIF image from r and returns the sequential frames
        and timing information.
    **/
    @:native("DecodeAll") static function decodeAll(r: go.io.Reader): (go.Result<go.Pointer<go.image.gif.GIF>>);
    /**
        DecodeConfig returns the global color model and dimensions of a GIF image
        without decoding the entire image.
    **/
    @:native("DecodeConfig") static function decodeConfig(r: go.io.Reader): (go.Result<go.image.Config>);
    /**
        Encode writes the Image m to w in GIF format.
    **/
    @:native("Encode") static function encode(w: go.io.Writer, m: go.image.Image, o: go.Pointer<go.image.gif.Options>): (go.Error);
    /**
        EncodeAll writes the images in g to w in GIF format with the
        given loop count and delay between frames.
    **/
    @:native("EncodeAll") static function encodeAll(w: go.io.Writer, g: go.Pointer<go.image.gif.GIF>): (go.Error);

}