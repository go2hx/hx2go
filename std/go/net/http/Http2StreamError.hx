package go.net.http;

@:structInit
@:go.Type({ name: "http2StreamError", instanceName: "http.http2StreamError", imports: ["net/http"] })
extern class Http2StreamError {

    @:native("StreamID") var streamID: go.UInt32;
    @:native("Code") var code: go.net.http.Http2ErrCode;
    @:native("Cause") var cause: go.Error;

    function new(streamID: go.UInt32, code: go.net.http.Http2ErrCode, cause: go.Error);

    @:native("As") function as(target: Dynamic): (Bool);
    @:native("Error") function error(): (String);

}