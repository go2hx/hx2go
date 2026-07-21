package go.go.types;

@:structInit
@:go.Type({ name: "term", instanceName: "types.term", imports: ["go/types"] })
extern class Term_ {

    @:native("String") function string(): (String);

}