package go.image.color;

/**
    YCbCr represents a fully opaque 24-bit Y'CbCr color, having 8 bits each for
    one luma and two chroma components.
    
    JPEG, VP8, the MPEG family and other codecs use this color model. Such
    codecs often use the terms YUV and Y'CbCr interchangeably, but strictly
    speaking, the term YUV applies only to analog video signals, and Y' (luma)
    is Y (luminance) after applying gamma correction.
    
    Conversion between RGB and Y'CbCr is lossy and there are multiple, slightly
    different formulae for converting between the two. This package follows
    the JFIF specification at https://www.w3.org/Graphics/JPEG/jfif3.pdf.
**/
@:structInit
@:go.Type({ name: "YCbCr", instanceName: "color.YCbCr", imports: ["image/color"] })
extern class YCbCr {

    @:native("Y") var Y: go.UInt8;
    @:native("Cb") var cb: go.UInt8;
    @:native("Cr") var cr: go.UInt8;

    function new(Y: go.UInt8=0, cb: go.UInt8=0, cr: go.UInt8=0);

    @:go.Tuple("p0", "p1", "p2", "p3") @:native("RGBA") function RGBA(): (go.Tuple<{ p0: go.UInt32, p1: go.UInt32, p2: go.UInt32, p3: go.UInt32 }>);

}