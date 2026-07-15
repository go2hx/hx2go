package go.go.types;

@:structInit
@:go.Type({ name: "Slice", instanceName: "types.Slice", imports: ["go/types"] })
extern class Slice {

    @:native("Elem") function elem(): go.go.types.Type;
    @:native("String") function string(): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}