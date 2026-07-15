package go.image.color;

@:structInit
@:go.Type({ name: "Alpha", instanceName: "color.Alpha", imports: ["image/color"] })
extern class Alpha {

    @:native("A") var A: go.UInt8;

function new(A: go.UInt8);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}