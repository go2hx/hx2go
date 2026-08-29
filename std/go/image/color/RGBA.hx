package go.image.color;

/**
    RGBA represents a traditional 32-bit alpha-premultiplied color, having 8
    bits for each of red, green, blue and alpha.
    
    An alpha-premultiplied color component C has been scaled by alpha (A), so
    has valid values 0 <= C <= A.
**/
@:structInit
@:go.Type({ name: "RGBA", instanceName: "color.RGBA", imports: ["image/color"] })
extern class RGBA {

    @:native("R") var R: go.UInt8;
    @:native("G") var G: go.UInt8;
    @:native("B") var B: go.UInt8;
    @:native("A") var A: go.UInt8;

    function new(R: go.UInt8=0, G: go.UInt8=0, B: go.UInt8=0, A: go.UInt8=0);

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): (go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>);

}