package go.net;

@:structInit
@:go.Type({ name: "notFoundError", instanceName: "net.notFoundError", imports: ["net"] })
extern class NotFoundError {

    @:native("Error") function error(): (String);

}