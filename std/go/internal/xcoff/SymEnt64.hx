package go.internal.xcoff;

@:structInit
@:go.Type({ name: "SymEnt64", instanceName: "xcoff.SymEnt64", imports: ["internal/xcoff"] })
extern class SymEnt64 {

    @:native("Nvalue") var nvalue: go.UInt64;
    @:native("Noffset") var noffset: go.UInt32;
    @:native("Nscnum") var nscnum: go.UInt16;
    @:native("Ntype") var ntype: go.UInt16;
    @:native("Nsclass") var nsclass: go.UInt8;
    @:native("Nnumaux") var nnumaux: go.UInt8;

function new(nvalue: go.UInt64, noffset: go.UInt32, nscnum: go.UInt16, ntype: go.UInt16, nsclass: go.UInt8, nnumaux: go.UInt8);

}