package go.go.types;

/**
    A Pointer represents a pointer type.
**/
@:structInit
@:go.Type({ name: "Pointer", instanceName: "types.Pointer", imports: ["go/types"] })
extern class Pointer {

    /**
        Elem returns the element type for the given pointer p.
    **/
    @:native("Elem") function elem(): (go.go.types.Type);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}