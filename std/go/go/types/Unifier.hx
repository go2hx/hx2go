package go.go.types;

@:structInit
@:go.Type({ name: "unifier", instanceName: "types.unifier", imports: ["go/types"] })
extern class Unifier {

    @:native("String") function string(): (String);

}