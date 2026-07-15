package go.internal.xcoff;

@:structInit
@:go.Type({ name: "AuxCSect64", instanceName: "xcoff.AuxCSect64", imports: ["internal/xcoff"] })
extern class AuxCSect64 {

    @:native("Xscnlenlo") var xscnlenlo: go.UInt32;
    @:native("Xparmhash") var xparmhash: go.UInt32;
    @:native("Xsnhash") var xsnhash: go.UInt16;
    @:native("Xsmtyp") var xsmtyp: go.UInt8;
    @:native("Xsmclas") var xsmclas: go.UInt8;
    @:native("Xscnlenhi") var xscnlenhi: go.UInt32;
    @:native("Xpad") var xpad: go.UInt8;
    @:native("Xauxtype") var xauxtype: go.UInt8;

function new(xscnlenlo: go.UInt32, xparmhash: go.UInt32, xsnhash: go.UInt16, xsmtyp: go.UInt8, xsmclas: go.UInt8, xscnlenhi: go.UInt32, xpad: go.UInt8, xauxtype: go.UInt8);

}