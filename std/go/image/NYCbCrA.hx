package go.image;

@:structInit
@:go.Type({ name: "NYCbCrA", instanceName: "image.NYCbCrA", imports: ["image"] })
extern class NYCbCrA {

    @:native("YCbCr") var yCbCr: go.image.YCbCr;
    @:native("A") var A: go.Slice<go.UInt8>;
    @:native("AStride") var aStride: go.GoInt;
    @:native("Y") var Y: go.Slice<go.UInt8>;
    @:native("Cb") var cb: go.Slice<go.UInt8>;
    @:native("Cr") var cr: go.Slice<go.UInt8>;
    @:native("YStride") var yStride: go.GoInt;
    @:native("CStride") var cStride: go.GoInt;
    @:native("SubsampleRatio") var subsampleRatio: go.image.YCbCrSubsampleRatio;
    @:native("Rect") var rect: go.image.Rectangle;

    function new(yCbCr: go.image.YCbCr, A: go.Slice<go.UInt8>, aStride: go.GoInt);

    @:native("AOffset") function aOffset(x: go.GoInt, y: go.GoInt): (go.GoInt);
    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    @:native("COffset") function cOffset(x: go.GoInt, y: go.GoInt): (go.GoInt);
    @:native("ColorModel") function colorModel(): (go.image.color.Model);
    @:native("NYCbCrAAt") function nYCbCrAAt(x: go.GoInt, y: go.GoInt): (go.image.color.NYCbCrA);
    @:native("Opaque") function opaque(): (Bool);
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): (go.image.color.RGBA64);
    @:native("SubImage") function subImage(r: go.image.Rectangle): (go.image.Image);
    @:native("YCbCrAt") function yCbCrAt(x: go.GoInt, y: go.GoInt): (go.image.color.YCbCr);
    @:native("YOffset") function yOffset(x: go.GoInt, y: go.GoInt): (go.GoInt);

}