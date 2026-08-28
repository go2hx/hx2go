package go.debug.pe;

/**
    FormatError is unused.
    The type is retained for compatibility.
**/
@:structInit
@:go.Type({ name: "FormatError", instanceName: "pe.FormatError", imports: ["debug/pe"] })
extern class FormatError {

    @:native("Error") function error(): (String);

}