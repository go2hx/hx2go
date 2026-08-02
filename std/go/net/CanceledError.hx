package go.net;

@:structInit
@:go.Type({ name: "canceledError", instanceName: "net.canceledError", imports: ["net"] })
extern class CanceledError {

    @:native("Error") function error(): (String);
    @:native("Is") function _is(err: go.Error): (Bool);

}