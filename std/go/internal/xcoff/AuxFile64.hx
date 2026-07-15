package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxFile64", instanceName: "xcoff.AuxFile64", imports: ["internal/xcoff"] })
extern class AuxFile64 {

    @:native("Xfname") var xfname: go.GoArray<go.Byte, 8>;
    @:native("Xftype") var xftype: go.UInt8;
    @:native("Xauxtype") var xauxtype: go.UInt8;

function new(xfname: go.GoArray<go.Byte, 8>, xftype: go.UInt8, xauxtype: go.UInt8);

}