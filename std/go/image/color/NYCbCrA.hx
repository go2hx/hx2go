package go.image.color;

@:structInit
@:go.Type({ name: "NYCbCrA", instanceName: "color.NYCbCrA", imports: ["image/color"] })
extern class NYCbCrA {

    @:native("YCbCr") var yCbCr: go.image.color.YCbCr;
    @:native("A") var A: go.UInt8;

function new(yCbCr: go.image.color.YCbCr, A: go.UInt8);

    @:go.Tuple("p0", "p1", "p2", "p3") @:native("RGBA") function RGBA(): go.Tuple<{ p0: go.UInt32, p1: go.UInt32, p2: go.UInt32, p3: go.UInt32 }>;

}