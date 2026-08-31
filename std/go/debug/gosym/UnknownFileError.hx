package go.debug.gosym;

/**
    UnknownFileError represents a failure to find the specific file in
    the symbol table.
**/
@:go.Type({ name: "UnknownFileError", instanceName: "gosym.UnknownFileError", imports: ["debug/gosym"] })
extern typedef UnknownFileError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>