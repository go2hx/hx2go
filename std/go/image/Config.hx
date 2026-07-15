package go.image;

@:structInit
@:go.Type({ name: "Config", instanceName: "image.Config", imports: ["image"] })
extern class Config {

    @:native("ColorModel") var colorModel: go.image.color.Model;
    @:native("Width") var width: go.GoInt;
    @:native("Height") var height: go.GoInt;

function new(colorModel: go.image.color.Model, width: go.GoInt, height: go.GoInt);

}