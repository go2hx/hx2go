package go.net;

@:structInit
@:go.Type({ name: "timeoutError", instanceName: "net.timeoutError", imports: ["net"] })
extern class TimeoutError {

    @:native("Error") function error(): (String);
    @:native("Is") function _is(err: go.Error): (Bool);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}