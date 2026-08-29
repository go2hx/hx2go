package go.go.types;

/**
    A Term represents a term in a [Union].
**/
@:structInit
@:go.Type({ name: "Term", instanceName: "types.Term", imports: ["go/types"] })
extern class Term {

    @:native("String") function string(): (std.String);
    @:native("Tilde") function tilde(): (Bool);
    @:native("Type") function type(): (go.go.types.Type);

}