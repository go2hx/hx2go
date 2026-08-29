package go.go.types;

/**
    A Type represents a type of Go.
    All types implement the Type interface.
**/
@:go.Type({ name: "Type", instanceName: "types.Type", imports: ["go/types"] })
extern typedef Type = {

    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}