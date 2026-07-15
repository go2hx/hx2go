package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Reloc32", instanceName: "xcoff.Reloc32", imports: ["internal/xcoff"] })
extern class Reloc32 {

    @:native("Rvaddr") var rvaddr: go.UInt32;
    @:native("Rsymndx") var rsymndx: go.UInt32;
    @:native("Rsize") var rsize: go.UInt8;
    @:native("Rtype") var rtype: go.UInt8;

function new(rvaddr: go.UInt32, rsymndx: go.UInt32, rsize: go.UInt8, rtype: go.UInt8);

}