package go.image;

/**
    YCbCr is an in-memory image of Y'CbCr colors. There is one Y sample per
    pixel, but each Cb and Cr sample can span one or more pixels.
    YStride is the Y slice index delta between vertically adjacent pixels.
    CStride is the Cb and Cr slice index delta between vertically adjacent pixels
    that map to separate chroma samples.
    It is not an absolute requirement, but YStride and len(Y) are typically
    multiples of 8, and:
    
    	For 4:4:4, CStride == YStride/1 && len(Cb) == len(Cr) == len(Y)/1.
    	For 4:2:2, CStride == YStride/2 && len(Cb) == len(Cr) == len(Y)/2.
    	For 4:2:0, CStride == YStride/2 && len(Cb) == len(Cr) == len(Y)/4.
    	For 4:4:0, CStride == YStride/1 && len(Cb) == len(Cr) == len(Y)/2.
    	For 4:1:1, CStride == YStride/4 && len(Cb) == len(Cr) == len(Y)/4.
    	For 4:1:0, CStride == YStride/4 && len(Cb) == len(Cr) == len(Y)/8.
**/
@:structInit
@:go.Type({ name: "YCbCr", instanceName: "image.YCbCr", imports: ["image"] })
extern class YCbCr {

    @:native("Y") var Y: go.Slice<go.UInt8>;
    @:native("Cb") var cb: go.Slice<go.UInt8>;
    @:native("Cr") var cr: go.Slice<go.UInt8>;
    @:native("YStride") var yStride: go.GoInt;
    @:native("CStride") var cStride: go.GoInt;
    @:native("SubsampleRatio") var subsampleRatio: go.image.YCbCrSubsampleRatio;
    @:native("Rect") var rect: go.image.Rectangle;

    function new(Y: go.Slice<go.UInt8>=null, cb: go.Slice<go.UInt8>=null, cr: go.Slice<go.UInt8>=null, yStride: go.GoInt=0, cStride: go.GoInt=0, subsampleRatio: go.image.YCbCrSubsampleRatio=cast 0, rect: go.image.Rectangle);

    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    /**
        COffset returns the index of the first element of Cb or Cr that corresponds
        to the pixel at (x, y).
    **/
    @:native("COffset") function cOffset(x: go.GoInt, y: go.GoInt): (go.GoInt);
    @:native("ColorModel") function colorModel(): (go.image.color.Model);
    @:native("Opaque") function opaque(): (Bool);
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): (go.image.color.RGBA64);
    /**
        SubImage returns an image representing the portion of the image p visible
        through r. The returned value shares pixels with the original image.
    **/
    @:native("SubImage") function subImage(r: go.image.Rectangle): (go.image.Image);
    @:native("YCbCrAt") function yCbCrAt(x: go.GoInt, y: go.GoInt): (go.image.color.YCbCr);
    /**
        YOffset returns the index of the first element of Y that corresponds to
        the pixel at (x, y).
    **/
    @:native("YOffset") function yOffset(x: go.GoInt, y: go.GoInt): (go.GoInt);

}