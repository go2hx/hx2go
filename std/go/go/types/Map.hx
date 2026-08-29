package go.go.types;

/**
    A Map represents a map type.
**/
@:structInit
@:go.Type({ name: "Map", instanceName: "types.Map", imports: ["go/types"] })
extern class Map {

    /**
        Elem returns the element type of map m.
    **/
    @:native("Elem") function elem(): (go.go.types.Type);
    /**
        Key returns the key type of map m.
    **/
    @:native("Key") function key(): (go.go.types.Type);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}