package go.vendor.golang.org.x.net.http2.hpack;

@:structInit
@:go.Type({ name: "DecodingError", instanceName: "hpack.DecodingError", imports: ["vendor/golang.org/x/net/http2/hpack"] })
extern class DecodingError {

    @:native("Err") var err: go.Error;

function new(err: go.Error);

    @:native("Error") function error(): String;

}