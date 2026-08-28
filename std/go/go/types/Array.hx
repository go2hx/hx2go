package go.go.types;

/**
    An Array represents an array type.
**/
@:structInit
@:go.Type({ name: "Array", instanceName: "types.Array", imports: ["go/types"] })
extern class Array {

    /**
        Elem returns element type of array a.
    **/
    @:native("Elem") function elem(): (go.go.types.Type);
    /**
        Len returns the length of array a.
        A negative result indicates an unknown length.
    **/
    @:native("Len") function len(): (go.Int64);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}