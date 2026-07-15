package go.internal.xcoff;

@:structInit
@:go.Type({ name: "SymEnt32", instanceName: "xcoff.SymEnt32", imports: ["internal/xcoff"] })
extern class SymEnt32 {

    @:native("Nname") var nname: go.GoArray<go.Byte, 8>;
    @:native("Nvalue") var nvalue: go.UInt32;
    @:native("Nscnum") var nscnum: go.UInt16;
    @:native("Ntype") var ntype: go.UInt16;
    @:native("Nsclass") var nsclass: go.UInt8;
    @:native("Nnumaux") var nnumaux: go.UInt8;

function new(nname: go.GoArray<go.Byte, 8>, nvalue: go.UInt32, nscnum: go.UInt16, ntype: go.UInt16, nsclass: go.UInt8, nnumaux: go.UInt8);

}