package go.net.http;

@:structInit
@:go.Type({ name: "nothingWrittenError", instanceName: "http.nothingWrittenError", imports: ["net/http"] })
extern class NothingWrittenError {

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}