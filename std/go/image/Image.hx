package go.image;

/**
    Image is a finite rectangular grid of [color.Color] values taken from a color
    model.
**/
@:go.Type({ name: "Image", instanceName: "image.Image", imports: ["image"] })
extern typedef Image = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    @:native("ColorModel") function colorModel(): (go.image.color.Model);

}