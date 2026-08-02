package go.image.color;

@:go.Type({ name: "Palette", instanceName: "color.Palette", imports: ["image/color"] })
extern class Palette {

    @:native("Convert") function convert(c: go.image.color.Color): (go.image.color.Color);
    @:native("Index") function index(c: go.image.color.Color): (go.GoInt);

}