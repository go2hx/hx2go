package go.go.types;

/**
    A Slice represents a slice type.
**/
@:structInit
@:go.Type({ name: "Slice", instanceName: "types.Slice", imports: ["go/types"] })
extern class Slice {

    /**
        Elem returns the element type of slice s.
    **/
    @:native("Elem") function elem(): (go.go.types.Type);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}