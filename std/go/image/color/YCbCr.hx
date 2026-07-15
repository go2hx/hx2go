package go.image.color;

@:structInit
@:go.Type({ name: "YCbCr", instanceName: "color.YCbCr", imports: ["image/color"] })
extern class YCbCr {

    @:native("Y") var Y: go.UInt8;
    @:native("Cb") var cb: go.UInt8;
    @:native("Cr") var cr: go.UInt8;

function new(Y: go.UInt8, cb: go.UInt8, cr: go.UInt8);

    @:go.Tuple("p0", "p1", "p2", "p3") @:native("RGBA") function RGBA(): go.Tuple<{ p0: go.UInt32, p1: go.UInt32, p2: go.UInt32, p3: go.UInt32 }>;

}