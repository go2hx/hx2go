package go.image.color;

/**
    NRGBA represents a non-alpha-premultiplied 32-bit color.
**/
@:structInit
@:go.Type({ name: "NRGBA", instanceName: "color.NRGBA", imports: ["image/color"] })
extern class NRGBA {

    @:native("R") var R: go.UInt8;
    @:native("G") var G: go.UInt8;
    @:native("B") var B: go.UInt8;
    @:native("A") var A: go.UInt8;

    function new(R: go.UInt8=0, G: go.UInt8=0, B: go.UInt8=0, A: go.UInt8=0);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): (go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>);

}