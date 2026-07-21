package go.errors;

@:structInit
@:go.Type({ name: "joinError", instanceName: "errors.joinError", imports: ["errors"] })
extern class JoinError {

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Slice<go.Error>);

}