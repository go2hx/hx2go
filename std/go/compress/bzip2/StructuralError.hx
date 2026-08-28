package go.compress.bzip2;

/**
    A StructuralError is returned when the bzip2 data is found to be
    syntactically invalid.
**/
@:go.Type({ name: "StructuralError", instanceName: "bzip2.StructuralError", imports: ["compress/bzip2"] })
extern typedef StructuralError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>