package go.net.http;

@:structInit
@:go.Type({ name: "http2serverConn", instanceName: "http.http2serverConn", imports: ["net/http"] })
extern class Http2serverConn {

    @:native("CloseConn") function closeConn(): (go.Error);
    @:native("Flush") function flush(): (go.Error);
    @:native("Framer") function framer(): (go.Pointer<go.net.http.Http2Framer>);
    @:go.Tuple("p0", "p1") @:native("HeaderEncoder") function headerEncoder(): (go.Tuple<{ p0: go.Pointer<Dynamic>, p1: go.Pointer<go.bytes.Buffer> }>);

}