package go.debug.gosym;

/**
    DecodingError represents an error during the decoding of
    the symbol table.
**/
@:structInit
@:go.Type({ name: "DecodingError", instanceName: "gosym.DecodingError", imports: ["debug/gosym"] })
extern class DecodingError {

    @:native("Error") function error(): (String);

}