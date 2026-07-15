package go.image.color;

@:structInit
@:go.Type({ name: "Gray", instanceName: "color.Gray", imports: ["image/color"] })
extern class Gray {

    @:native("Y") var Y: go.UInt8;

function new(Y: go.UInt8);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}