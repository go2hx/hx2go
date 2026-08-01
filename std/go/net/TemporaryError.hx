package go.net;

@:structInit
@:go.Type({ name: "temporaryError", instanceName: "net.temporaryError", imports: ["net"] })
extern class TemporaryError {

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}