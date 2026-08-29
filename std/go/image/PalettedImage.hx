package go.image;

/**
    PalettedImage is an image whose colors may come from a limited palette.
    If m is a PalettedImage and m.ColorModel() returns a [color.Palette] p,
    then m.At(x, y) should be equivalent to p[m.ColorIndexAt(x, y)]. If m's
    color model is not a color.Palette, then ColorIndexAt's behavior is
    undefined.
**/
@:go.Type({ name: "PalettedImage", instanceName: "image.PalettedImage", imports: ["image"] })
extern typedef PalettedImage = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    @:native("ColorIndexAt") function colorIndexAt(x: go.GoInt, y: go.GoInt): (go.UInt8);
    @:native("ColorModel") function colorModel(): (go.image.color.Model);

}