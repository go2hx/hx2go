package go.image;

@:go.Type({ name: "RGBA64Image", instanceName: "image.RGBA64Image", imports: ["image"] })
extern typedef RGBA64Image = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;

}