package go.image;

@:structInit
@:go.Type({ name: "Alpha16", instanceName: "image.Alpha16", imports: ["image"] })
extern class Alpha16 {

    @:native("Pix") var pix: go.Slice<go.UInt8>;
    @:native("Stride") var stride: go.GoInt;
    @:native("Rect") var rect: go.image.Rectangle;

function new(pix: go.Slice<go.UInt8>, stride: go.GoInt, rect: go.image.Rectangle);

    @:native("Alpha16At") function alpha16At(x: go.GoInt, y: go.GoInt): go.image.color.Alpha16;
    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Opaque") function opaque(): Bool;
    @:native("PixOffset") function pixOffset(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetAlpha16") function setAlpha16(x: go.GoInt, y: go.GoInt, c: go.image.color.Alpha16): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;
    @:native("SubImage") function subImage(r: go.image.Rectangle): go.image.Image;

}