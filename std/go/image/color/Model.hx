package go.image.color;

/**
    Model can convert any [Color] to one from its own color model. The conversion
    may be lossy.
**/
@:go.Type({ name: "Model", instanceName: "color.Model", imports: ["image/color"] })
extern typedef Model = {

    @:native("Convert") function convert(c: go.image.color.Color): (go.image.color.Color);

}