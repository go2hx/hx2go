package go.net.url;

@:structInit
@:go.Type({ name: "URL", instanceName: "url.URL", imports: ["net/url"] })
extern class URL {

    @:native("Scheme") var scheme: String;
    @:native("Opaque") var opaque: String;
    @:native("User") var user: go.Pointer<go.net.url.Userinfo>;
    @:native("Host") var host: String;
    @:native("Path") var path: String;
    @:native("Fragment") var fragment: String;
    @:native("RawQuery") var rawQuery: String;
    @:native("RawPath") var rawPath: String;
    @:native("RawFragment") var rawFragment: String;
    @:native("ForceQuery") var forceQuery: Bool;
    @:native("OmitHost") var omitHost: Bool;

function new(scheme: String, opaque: String, user: go.Pointer<go.net.url.Userinfo>, host: String, path: String, fragment: String, rawQuery: String, rawPath: String, rawFragment: String, forceQuery: Bool, omitHost: Bool);

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("EscapedFragment") function escapedFragment(): String;
    @:native("EscapedPath") function escapedPath(): String;
    @:native("Hostname") function hostname(): String;
    @:native("IsAbs") function isAbs(): Bool;
    @:native("JoinPath") function joinPath(elem: haxe.Rest<String>): go.Pointer<go.net.url.URL>;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("Parse") function parse(ref: String): go.Result<go.Pointer<go.net.url.URL>>;
    @:native("Port") function port(): String;
    @:native("Query") function query(): go.net.url.Values;
    @:native("Redacted") function redacted(): String;
    @:native("RequestURI") function requestURI(): String;
    @:native("ResolveReference") function resolveReference(ref: go.Pointer<go.net.url.URL>): go.Pointer<go.net.url.URL>;
    @:native("String") function string(): String;
    @:native("UnmarshalBinary") function unmarshalBinary(text: go.Slice<go.Byte>): go.Error;

}