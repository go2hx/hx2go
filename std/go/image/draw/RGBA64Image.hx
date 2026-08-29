package go.image.draw;

/**
    RGBA64Image extends both the [Image] and [image.RGBA64Image] interfaces with a
    SetRGBA64 method to change a single pixel. SetRGBA64 is equivalent to
    calling Set, but it can avoid allocations from converting concrete color
    types to the [color.Color] interface type.
**/
@:go.Type({ name: "RGBA64Image", instanceName: "draw.RGBA64Image", imports: ["image/draw"] })
extern typedef RGBA64Image = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    @:native("ColorModel") function colorModel(): (go.image.color.Model);
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): (go.image.color.RGBA64);
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;

}