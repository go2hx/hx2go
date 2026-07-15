package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Reloc64", instanceName: "xcoff.Reloc64", imports: ["internal/xcoff"] })
extern class Reloc64 {

    @:native("Rvaddr") var rvaddr: go.UInt64;
    @:native("Rsymndx") var rsymndx: go.UInt32;
    @:native("Rsize") var rsize: go.UInt8;
    @:native("Rtype") var rtype: go.UInt8;

function new(rvaddr: go.UInt64, rsymndx: go.UInt32, rsize: go.UInt8, rtype: go.UInt8);

}