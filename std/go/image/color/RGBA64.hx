package go.image.color;

/**
    RGBA64 represents a 64-bit alpha-premultiplied color, having 16 bits for
    each of red, green, blue and alpha.
    
    An alpha-premultiplied color component C has been scaled by alpha (A), so
    has valid values 0 <= C <= A.
**/
@:structInit
@:go.Type({ name: "RGBA64", instanceName: "color.RGBA64", imports: ["image/color"] })
extern class RGBA64 {

    @:native("R") var R: go.UInt16;
    @:native("G") var G: go.UInt16;
    @:native("B") var B: go.UInt16;
    @:native("A") var A: go.UInt16;

    function new(R: go.UInt16=0, G: go.UInt16=0, B: go.UInt16=0, A: go.UInt16=0);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): (go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>);

}