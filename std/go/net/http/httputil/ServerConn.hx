package go.net.http.httputil;

@:structInit
@:go.Type({ name: "ServerConn", instanceName: "httputil.ServerConn", imports: ["net/http/httputil"] })
extern class ServerConn {

    @:native("Close") function close(): go.Error;
    @:go.Tuple("p0", "p1") @:native("Hijack") function hijack(): go.Tuple<{ p0: go.net.Conn, p1: go.Pointer<go.bufio.Reader> }>;
    @:native("Pending") function pending(): go.GoInt;
    @:native("Read") function read(): go.Result<go.Pointer<go.net.http.Request>>;
    @:native("Write") function write(req: go.Pointer<go.net.http.Request>, resp: go.Pointer<go.net.http.Response>): go.Error;

}