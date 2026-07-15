package go.internal.reflectlite;

@:structInit
@:go.Type({ name: "ValueError", instanceName: "reflectlite.ValueError", imports: ["internal/reflectlite"] })
extern class ValueError {

    @:native("Method") var method: String;
    @:native("Kind") var kind: go.internal.reflectlite.Kind;

function new(method: String, kind: go.internal.reflectlite.Kind);

    @:native("Error") function error(): String;

}