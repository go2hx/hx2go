package go.image;

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

function new(Y: go.Slice<go.UInt8>, cb: go.Slice<go.UInt8>, cr: go.Slice<go.UInt8>, yStride: go.GoInt, cStride: go.GoInt, subsampleRatio: go.image.YCbCrSubsampleRatio, rect: go.image.Rectangle);

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("COffset") function cOffset(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Opaque") function opaque(): Bool;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("SubImage") function subImage(r: go.image.Rectangle): go.image.Image;
    @:native("YCbCrAt") function yCbCrAt(x: go.GoInt, y: go.GoInt): go.image.color.YCbCr;
    @:native("YOffset") function yOffset(x: go.GoInt, y: go.GoInt): go.GoInt;

}