package go.debug.macho;

@:structInit
@:go.Type({ name: "Nlist64", instanceName: "macho.Nlist64", imports: ["debug/macho"] })
extern class Nlist64 {

    @:native("Name") var name: go.UInt32;
    @:native("Type") var type: go.UInt8;
    @:native("Sect") var sect: go.UInt8;
    @:native("Desc") var desc: go.UInt16;
    @:native("Value") var value: go.UInt64;

function new(name: go.UInt32, type: go.UInt8, sect: go.UInt8, desc: go.UInt16, value: go.UInt64);

}