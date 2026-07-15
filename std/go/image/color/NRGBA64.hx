package go.image.color;

@:structInit
@:go.Type({ name: "NRGBA64", instanceName: "color.NRGBA64", imports: ["image/color"] })
extern class NRGBA64 {

    @:native("R") var R: go.UInt16;
    @:native("G") var G: go.UInt16;
    @:native("B") var B: go.UInt16;
    @:native("A") var A: go.UInt16;

function new(R: go.UInt16, G: go.UInt16, B: go.UInt16, A: go.UInt16);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}