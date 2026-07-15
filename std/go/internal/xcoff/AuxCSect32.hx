package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxCSect32", instanceName: "xcoff.AuxCSect32", imports: ["internal/xcoff"] })
extern class AuxCSect32 {

    @:native("Xscnlen") var xscnlen: go.UInt32;
    @:native("Xparmhash") var xparmhash: go.UInt32;
    @:native("Xsnhash") var xsnhash: go.UInt16;
    @:native("Xsmtyp") var xsmtyp: go.UInt8;
    @:native("Xsmclas") var xsmclas: go.UInt8;
    @:native("Xstab") var xstab: go.UInt32;
    @:native("Xsnstab") var xsnstab: go.UInt16;

function new(xscnlen: go.UInt32, xparmhash: go.UInt32, xsnhash: go.UInt16, xsmtyp: go.UInt8, xsmclas: go.UInt8, xstab: go.UInt32, xsnstab: go.UInt16);

}