package go.go.types;

/**
    A Basic represents a basic type.
**/
@:structInit
@:go.Type({ name: "Basic", instanceName: "types.Basic", imports: ["go/types"] })
extern class Basic {

    /**
        Info returns information about properties of basic type b.
    **/
    @:native("Info") function info(): (go.go.types.BasicInfo);
    /**
        Kind returns the kind of basic type b.
    **/
    @:native("Kind") function kind(): (go.go.types.BasicKind);
    /**
        Name returns the name of basic type b.
    **/
    @:native("Name") function name(): (std.String);
    @:native("String") function string(): (std.String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}