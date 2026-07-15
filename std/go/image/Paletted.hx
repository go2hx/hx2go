package go.image;

@:structInit
@:go.Type({ name: "Paletted", instanceName: "image.Paletted", imports: ["image"] })
extern class Paletted {

    @:native("Pix") var pix: go.Slice<go.UInt8>;
    @:native("Stride") var stride: go.GoInt;
    @:native("Rect") var rect: go.image.Rectangle;
    @:native("Palette") var palette: go.image.color.Palette;

function new(pix: go.Slice<go.UInt8>, stride: go.GoInt, rect: go.image.Rectangle, palette: go.image.color.Palette);

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorIndexAt") function colorIndexAt(x: go.GoInt, y: go.GoInt): go.UInt8;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Opaque") function opaque(): Bool;
    @:native("PixOffset") function pixOffset(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetColorIndex") function setColorIndex(x: go.GoInt, y: go.GoInt, index: go.UInt8): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;
    @:native("SubImage") function subImage(r: go.image.Rectangle): go.image.Image;

}