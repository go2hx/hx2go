package go.go.types;

@:structInit
@:go.Type({ name: "Pointer", instanceName: "types.Pointer", imports: ["go/types"] })
extern class Pointer {

    @:native("Elem") function elem(): (go.go.types.Type);
    @:native("String") function string(): (String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}