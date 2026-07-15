package go.debug.macho;

@:structInit
@:go.Type({ name: "Symbol", instanceName: "macho.Symbol", imports: ["debug/macho"] })
extern class Symbol {

    @:native("Name") var name: String;
    @:native("Type") var type: go.UInt8;
    @:native("Sect") var sect: go.UInt8;
    @:native("Desc") var desc: go.UInt16;
    @:native("Value") var value: go.UInt64;

function new(name: String, type: go.UInt8, sect: go.UInt8, desc: go.UInt16, value: go.UInt64);

}