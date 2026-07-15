package go.go.types;

@:structInit
@:go.Type({ name: "Map", instanceName: "types.Map", imports: ["go/types"] })
extern class Map {

    @:native("Elem") function elem(): go.go.types.Type;
    @:native("Key") function key(): go.go.types.Type;
    @:native("String") function string(): String;
    @:native("Underlying") function underlying(): go.go.types.Type;

}