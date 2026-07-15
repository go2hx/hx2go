package go.image;

@:go.Type({ name: "PalettedImage", instanceName: "image.PalettedImage", imports: ["image"] })
extern typedef PalettedImage = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorIndexAt") function colorIndexAt(x: go.GoInt, y: go.GoInt): go.UInt8;
    @:native("ColorModel") function colorModel(): go.image.color.Model;

}