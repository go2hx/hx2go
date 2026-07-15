package go.debug.dwarf;

@:structInit
@:go.Type({ name: "DecodeError", instanceName: "dwarf.DecodeError", imports: ["debug/dwarf"] })
extern class DecodeError {

    @:native("Name") var name: String;
    @:native("Offset") var offset: go.debug.dwarf.Offset;
    @:native("Err") var err: String;

function new(name: String, offset: go.debug.dwarf.Offset, err: String);

    @:native("Error") function error(): String;

}