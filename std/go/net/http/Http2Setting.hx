package go.net.http;

@:structInit
@:go.Type({ name: "http2Setting", instanceName: "http.http2Setting", imports: ["net/http"] })
extern class Http2Setting {

    @:native("ID") var ID: go.net.http.Http2SettingID;
    @:native("Val") var val: go.UInt32;

    function new(ID: go.net.http.Http2SettingID=cast 0, val: go.UInt32=0);

    @:native("String") function string(): (String);
    @:native("Valid") function valid(): (go.Error);

}