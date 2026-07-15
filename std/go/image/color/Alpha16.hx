package go.image.color;

@:structInit
@:go.Type({ name: "Alpha16", instanceName: "color.Alpha16", imports: ["image/color"] })
extern class Alpha16 {

    @:native("A") var A: go.UInt16;

function new(A: go.UInt16);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}