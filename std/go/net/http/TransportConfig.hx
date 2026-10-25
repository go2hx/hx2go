package go.net.http;

@:structInit
@:go.Type({ name: "transportConfig", instanceName: "http.transportConfig", imports: ["net/http"] })
extern class TransportConfig {

    @:native("DisableCompression") function disableCompression(): (Bool);
    @:native("DisableKeepAlives") function disableKeepAlives(): (Bool);
    @:native("ExpectContinueTimeout") function expectContinueTimeout(): (go.time.Duration);
    @:native("HTTP2Config") function hTTP2Config(): (Dynamic);
    @:native("IdleConnTimeout") function idleConnTimeout(): (go.time.Duration);
    @:native("MaxHeaderListSize") function maxHeaderListSize(): (go.Int64);
    @:native("MaxResponseHeaderBytes") function maxResponseHeaderBytes(): (go.Int64);
    @:native("ResponseHeaderTimeout") function responseHeaderTimeout(): (go.time.Duration);

}