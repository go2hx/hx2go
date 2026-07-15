package go.image;

@:structInit
@:go.Type({ name: "CMYK", instanceName: "image.CMYK", imports: ["image"] })
extern class CMYK {

    @:native("Pix") var pix: go.Slice<go.UInt8>;
    @:native("Stride") var stride: go.GoInt;
    @:native("Rect") var rect: go.image.Rectangle;

function new(pix: go.Slice<go.UInt8>, stride: go.GoInt, rect: go.image.Rectangle);

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("CMYKAt") function cMYKAt(x: go.GoInt, y: go.GoInt): go.image.color.CMYK;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Opaque") function opaque(): Bool;
    @:native("PixOffset") function pixOffset(x: go.GoInt, y: go.GoInt): go.GoInt;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetCMYK") function setCMYK(x: go.GoInt, y: go.GoInt, c: go.image.color.CMYK): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;
    @:native("SubImage") function subImage(r: go.image.Rectangle): go.image.Image;

}