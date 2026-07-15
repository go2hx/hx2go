package go.reflect;

@:structInit
@:go.Type({ name: "ValueError", instanceName: "reflect.ValueError", imports: ["reflect"] })
extern class ValueError {

    @:native("Method") var method: String;
    @:native("Kind") var kind: go.reflect.Kind;

function new(method: String, kind: go.reflect.Kind);

    @:native("Error") function error(): String;

}