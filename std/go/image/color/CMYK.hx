package go.image.color;

@:structInit
@:go.Type({ name: "CMYK", instanceName: "color.CMYK", imports: ["image/color"] })
extern class CMYK {

    @:native("C") var C: go.UInt8;
    @:native("M") var M: go.UInt8;
    @:native("Y") var Y: go.UInt8;
    @:native("K") var K: go.UInt8;

function new(C: go.UInt8, M: go.UInt8, Y: go.UInt8, K: go.UInt8);

    @:go.Tuple("p0", "p1", "p2", "p3") @:native("RGBA") function RGBA(): go.Tuple<{ p0: go.UInt32, p1: go.UInt32, p2: go.UInt32, p3: go.UInt32 }>;

}