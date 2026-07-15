package go.net.http;

@:structInit
@:go.Type({ name: "ProtocolError", instanceName: "http.ProtocolError", imports: ["net/http"] })
extern class ProtocolError {

    @:native("ErrorString") var errorString: String;

function new(errorString: String);

    @:native("Error") function error(): String;
    @:native("Is") function _is(err: go.Error): Bool;

}