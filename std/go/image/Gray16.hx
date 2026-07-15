package go.image;

@:structInit
@:go.Type({ name: "Gray16", instanceName: "image.Gray16", imports: ["image"] })
extern class Gray16 {

    @:native("Pix") var pix: go.Slice<go.UInt8>;
    @:native("Stride") var stride: go.GoInt;
    @:native("Rect") var rect: go.image.Rectangle;

function new(pix: go.Slice<go.UInt8>, stride: go.GoInt, rect: go.image.Rectangle);

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Gray16At") function gray16At(x: go.GoInt, y: go.GoInt): go.image.color.Gray16;
    @:native("Opaque") function opaque(): Bool;
    @:native("PixOffset") function pixOffset(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetGray16") function setGray16(x: go.GoInt, y: go.GoInt, c: go.image.color.Gray16): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;
    @:native("SubImage") function subImage(r: go.image.Rectangle): go.image.Image;

}