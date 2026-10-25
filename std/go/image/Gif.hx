package go.image;

/**
    Package gif implements a GIF image decoder and encoder.
    
    The GIF specification is at https://www.w3.org/Graphics/GIF/spec-gif89a.txt.
    
    When decoding untrusted input, read dimensions with [DecodeConfig] before
    calling [Decode] or [DecodeAll]; see those functions and the "Security
    Considerations" section in the [image] package documentation.
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
        
        When decoding images from untrusted sources, it is safest to
        first call DecodeConfig and check the image size so
        that unexpectedly large memory allocations may be safely
        avoided.
    **/
    @:native("Decode") static function decode(r: go.io.Reader): (go.Result<go.image.Image>);
    /**
        DecodeAll reads a GIF image from r and returns the sequential frames
        and timing information.
        
        Like [Decode], this allocates a paletted buffer per frame from width and
        height in the image descriptors. [DecodeAll] retains every decoded frame in
        memory. For untrusted input, call [DecodeConfig] first to verify the
        logical screen size and reject inputs that would require excessive memory.
    **/
    @:native("DecodeAll") static function decodeAll(r: go.io.Reader): (go.Result<go.Pointer<go.image.gif.GIF>>);
    /**
        DecodeConfig returns the global color model and dimensions of a GIF image
        without decoding the entire image.
        
        It reads the logical screen descriptor and global color table only; it does
        not allocate pixel buffers for frames. Use it to check width and height
        before calling [Decode] or [DecodeAll].
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