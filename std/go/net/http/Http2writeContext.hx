package go.net.http;

@:go.Type({ name: "http2writeContext", instanceName: "http.http2writeContext", imports: ["net/http"] })
extern typedef Http2writeContext = {

    @:native("CloseConn") function closeConn(): (go.Error);
    @:native("Flush") function flush(): (go.Error);
    @:native("Framer") function framer(): (go.Pointer<go.net.http.Http2Framer>);
    @:go.Tuple("p0", "p1") @:native("HeaderEncoder") function headerEncoder(): (go.Tuple<{ p0: go.Pointer<Dynamic>, p1: go.Pointer<go.bytes.Buffer> }>);

}