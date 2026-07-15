package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxFcn64", instanceName: "xcoff.AuxFcn64", imports: ["internal/xcoff"] })
extern class AuxFcn64 {

    @:native("Xlnnoptr") var xlnnoptr: go.UInt64;
    @:native("Xfsize") var xfsize: go.UInt32;
    @:native("Xendndx") var xendndx: go.UInt32;
    @:native("Xpad") var xpad: go.UInt8;
    @:native("Xauxtype") var xauxtype: go.UInt8;

function new(xlnnoptr: go.UInt64, xfsize: go.UInt32, xendndx: go.UInt32, xpad: go.UInt8, xauxtype: go.UInt8);

}