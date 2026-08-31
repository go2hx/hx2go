package go.image;

/**
    Config holds an image's color model and dimensions.
**/
@:structInit
@:go.Type({ name: "Config", instanceName: "image.Config", imports: ["image"] })
extern class Config {

    @:native("ColorModel") var colorModel: go.image.color.Model;
    @:native("Width") var width: go.GoInt;
    @:native("Height") var height: go.GoInt;

    function new(colorModel: go.image.color.Model=null, width: go.GoInt=0, height: go.GoInt=0);

}