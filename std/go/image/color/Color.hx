package go.image.color;

@:go.Type({ name: "Color", instanceName: "color.Color", imports: ["image/color"] })
extern typedef Color = {

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}