package go.image;

@:structInit
@:go.Type({ name: "Uniform", instanceName: "image.Uniform", imports: ["image"] })
extern class Uniform {

    @:native("C") var C: go.image.color.Color;

function new(C: go.image.color.Color);

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Convert") function convert(p0: go.image.color.Color): go.image.color.Color;
    @:native("Opaque") function opaque(): Bool;
    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;

}