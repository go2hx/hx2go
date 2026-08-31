package go.reflect;

/**
    A ValueError occurs when a Value method is invoked on
    a [Value] that does not support it. Such cases are documented
    in the description of each method.
**/
@:structInit
@:go.Type({ name: "ValueError", instanceName: "reflect.ValueError", imports: ["reflect"] })
extern class ValueError {

    @:native("Method") var method: std.String;
    @:native("Kind") var kind: go.reflect.Kind;

    function new(method: std.String="", kind: go.reflect.Kind=cast 0);

    @:native("Error") function error(): (std.String);

}