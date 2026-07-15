package go.image.draw;

@:go.Type({ name: "RGBA64Image", instanceName: "draw.RGBA64Image", imports: ["image/draw"] })
extern typedef RGBA64Image = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;

}