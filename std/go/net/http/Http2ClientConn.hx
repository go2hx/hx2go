package go.net.http;

@:structInit
@:go.Type({ name: "http2ClientConn", instanceName: "http.http2ClientConn", imports: ["net/http"] })
extern class Http2ClientConn {

    @:native("CanTakeNewRequest") function canTakeNewRequest(): (Bool);
    @:native("Close") function close(): (go.Error);
    @:native("Ping") function ping(ctx: go.context.Context): (go.Error);
    @:native("ReserveNewRequest") function reserveNewRequest(): (Bool);
    @:native("RoundTrip") function roundTrip(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    @:native("SetDoNotReuse") function setDoNotReuse(): Void;
    @:native("Shutdown") function shutdown(ctx: go.context.Context): (go.Error);
    @:native("State") function state(): (go.net.http.Http2ClientConnState);

}