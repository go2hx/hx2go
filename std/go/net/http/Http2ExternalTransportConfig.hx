package go.net.http;

@:go.Type({ name: "http2ExternalTransportConfig", instanceName: "http.http2ExternalTransportConfig", imports: ["net/http"] })
extern typedef Http2ExternalTransportConfig = {

    @:native("ConnFromContext") function connFromContext(p0: go.context.Context): (go.net.Conn);
    @:native("DialFromContext") function dialFromContext(ctx: go.context.Context, network: String, addr: String): (go.Result<go.net.Conn>);
    @:native("DisableCompression") function disableCompression(): (Bool);
    @:native("ExternalRoundTrip") function externalRoundTrip(): (Bool);
    @:native("HTTP2Config") function hTTP2Config(): (go.net.http.HTTP2Config);
    @:native("IdleConnTimeout") function idleConnTimeout(): (go.time.Duration);
    @:native("MaxHeaderListSize") function maxHeaderListSize(): (go.Int64);
    @:native("Registered") function registered(p0: go.Pointer<go.net.http.Transport>): Void;
    @:native("RoundTrip") function roundTrip(p0: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);

}