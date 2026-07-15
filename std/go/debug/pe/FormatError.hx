package go.debug.pe;

@:structInit
@:go.Type({ name: "FormatError", instanceName: "pe.FormatError", imports: ["debug/pe"] })
extern class FormatError {

    @:native("Error") function error(): String;

}