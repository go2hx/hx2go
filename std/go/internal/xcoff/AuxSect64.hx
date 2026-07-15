package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxSect64", instanceName: "xcoff.AuxSect64", imports: ["internal/xcoff"] })
extern class AuxSect64 {

    @:native("Xscnlen") var xscnlen: go.UInt64;
    @:native("Xnreloc") var xnreloc: go.UInt64;
    @:native("Xauxtype") var xauxtype: go.UInt8;

function new(xscnlen: go.UInt64, xnreloc: go.UInt64, xauxtype: go.UInt8);

}