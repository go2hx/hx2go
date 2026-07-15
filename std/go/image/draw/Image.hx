package go.image.draw;

@:go.Type({ name: "Image", instanceName: "draw.Image", imports: ["image/draw"] })
extern typedef Image = {

    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;

}