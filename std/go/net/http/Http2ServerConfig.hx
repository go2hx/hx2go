package go.net.http;

@:structInit
@:go.Type({ name: "http2ServerConfig", instanceName: "http.http2ServerConfig", imports: ["net/http"] })
extern class Http2ServerConfig {

    @:native("ConnState") function connState(c: go.net.Conn, st: Dynamic): Void;
    @:native("DisableClientPriority") function disableClientPriority(): (Bool);
    @:native("DoKeepAlives") function doKeepAlives(): (Bool);
    @:native("ErrorLog") function errorLog(): (go.Pointer<go.log.Logger>);
    @:native("HTTP2Config") function hTTP2Config(): (Dynamic);
    @:native("IdleTimeout") function idleTimeout(): (go.time.Duration);
    @:native("MaxHeaderBytes") function maxHeaderBytes(): (go.GoInt);
    @:native("MaxHeaderValueCount") function maxHeaderValueCount(): (go.GoInt);
    @:native("ReadTimeout") function readTimeout(): (go.time.Duration);
    @:native("SendPingTimeout") function sendPingTimeout(): (go.time.Duration);
    @:native("WriteTimeout") function writeTimeout(): (go.time.Duration);

}