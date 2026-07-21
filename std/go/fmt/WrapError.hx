package go.fmt;

@:structInit
@:go.Type({ name: "wrapError", instanceName: "fmt.wrapError", imports: ["fmt"] })
extern class WrapError {

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}