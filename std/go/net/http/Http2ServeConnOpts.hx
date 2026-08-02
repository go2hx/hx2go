package go.net.http;

@:structInit
@:go.Type({ name: "http2ServeConnOpts", instanceName: "http.http2ServeConnOpts", imports: ["net/http"] })
extern class Http2ServeConnOpts {

    @:native("Context") var context: go.context.Context;
    @:native("BaseConfig") var baseConfig: go.Pointer<go.net.http.Server>;
    @:native("Handler") var handler: go.net.http.Handler;
    @:native("UpgradeRequest") var upgradeRequest: go.Pointer<go.net.http.Request>;
    @:native("Settings") var settings: go.Slice<go.Byte>;
    @:native("SawClientPreface") var sawClientPreface: Bool;

    function new(context: go.context.Context, baseConfig: go.Pointer<go.net.http.Server>, handler: go.net.http.Handler, upgradeRequest: go.Pointer<go.net.http.Request>, settings: go.Slice<go.Byte>, sawClientPreface: Bool);

}