package go.image.color;

@:structInit
@:go.Type({ name: "Gray16", instanceName: "color.Gray16", imports: ["image/color"] })
extern class Gray16 {

    @:native("Y") var Y: go.UInt16;

function new(Y: go.UInt16);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}