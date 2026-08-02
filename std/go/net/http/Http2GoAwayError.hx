package go.net.http;

@:structInit
@:go.Type({ name: "http2GoAwayError", instanceName: "http.http2GoAwayError", imports: ["net/http"] })
extern class Http2GoAwayError {

    @:native("LastStreamID") var lastStreamID: go.UInt32;
    @:native("ErrCode") var errCode: go.net.http.Http2ErrCode;
    @:native("DebugData") var debugData: String;

    function new(lastStreamID: go.UInt32, errCode: go.net.http.Http2ErrCode, debugData: String);

    @:native("Error") function error(): (String);

}