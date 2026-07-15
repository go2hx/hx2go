package go.image.color;

@:structInit
@:go.Type({ name: "RGBA", instanceName: "color.RGBA", imports: ["image/color"] })
extern class RGBA {

    @:native("R") var R: go.UInt8;
    @:native("G") var G: go.UInt8;
    @:native("B") var B: go.UInt8;
    @:native("A") var A: go.UInt8;

function new(R: go.UInt8, G: go.UInt8, B: go.UInt8, A: go.UInt8);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>;

}