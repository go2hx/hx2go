package go.debug.macho;

/**
    An Nlist32 is a Mach-O 32-bit symbol table entry.
**/
@:structInit
@:go.Type({ name: "Nlist32", instanceName: "macho.Nlist32", imports: ["debug/macho"] })
extern class Nlist32 {

    @:native("Name") var name: go.UInt32;
    @:native("Type") var type: go.UInt8;
    @:native("Sect") var sect: go.UInt8;
    @:native("Desc") var desc: go.UInt16;
    @:native("Value") var value: go.UInt32;

    function new(name: go.UInt32=0, type: go.UInt8=0, sect: go.UInt8=0, desc: go.UInt16=0, value: go.UInt32=0);

}