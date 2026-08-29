package go.image.color;

@:structInit
@:go.Type({ name: "modelFunc", instanceName: "color.modelFunc", imports: ["image/color"] })
extern class ModelFunc_ {

    @:native("Convert") function convert(c: go.image.color.Color): (go.image.color.Color);

}