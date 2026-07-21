package go.go.types;

@:structInit
@:go.Type({ name: "Term", instanceName: "types.Term", imports: ["go/types"] })
extern class Term {

    @:native("String") function string(): (String);
    @:native("Tilde") function tilde(): (Bool);
    @:native("Type") function type(): (go.go.types.Type);

}