package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxFcn32", instanceName: "xcoff.AuxFcn32", imports: ["internal/xcoff"] })
extern class AuxFcn32 {

    @:native("Xexptr") var xexptr: go.UInt32;
    @:native("Xfsize") var xfsize: go.UInt32;
    @:native("Xlnnoptr") var xlnnoptr: go.UInt32;
    @:native("Xendndx") var xendndx: go.UInt32;
    @:native("Xpad") var xpad: go.UInt16;

function new(xexptr: go.UInt32, xfsize: go.UInt32, xlnnoptr: go.UInt32, xendndx: go.UInt32, xpad: go.UInt16);

}