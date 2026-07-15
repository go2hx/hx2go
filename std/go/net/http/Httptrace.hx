package go.net.http;

@:go.Type({ name: "httptrace", instanceName: "httptrace.httptrace", imports: ["net/http/httptrace"] })
extern class Httptrace {

    @:native("ContextClientTrace") static function contextClientTrace(ctx: go.context.Context): go.Pointer<go.net.http.httptrace.ClientTrace>;
    @:native("WithClientTrace") static function withClientTrace(ctx: go.context.Context, trace: go.Pointer<go.net.http.httptrace.ClientTrace>): go.context.Context;

}