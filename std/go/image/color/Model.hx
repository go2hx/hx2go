package go.image.color;

@:go.Type({ name: "Model", instanceName: "color.Model", imports: ["image/color"] })
extern typedef Model = {

    @:native("Convert") function convert(c: go.image.color.Color): go.image.color.Color;

}