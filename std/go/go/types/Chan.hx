package go.go.types;

/**
    A Chan represents a channel type.
**/
@:structInit
@:go.Type({ name: "Chan", instanceName: "types.Chan", imports: ["go/types"] })
extern class Chan {

    /**
        Dir returns the direction of channel c.
    **/
    @:native("Dir") function dir(): (go.go.types.ChanDir);
    /**
        Elem returns the element type of channel c.
    **/
    @:native("Elem") function elem(): (go.go.types.Type);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}