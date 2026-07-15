package go.net.http.httputil;

@:structInit
@:go.Type({ name: "ClientConn", instanceName: "httputil.ClientConn", imports: ["net/http/httputil"] })
extern class ClientConn {

    @:native("Close") function close(): go.Error;
    @:native("Do") function _do(req: go.Pointer<go.net.http.Request>): go.Result<go.Pointer<go.net.http.Response>>;
    @:go.Tuple("c", "r") @:native("Hijack") function hijack(): go.Tuple<{ c: go.net.Conn, r: go.Pointer<go.bufio.Reader> }>;
    @:native("Pending") function pending(): go.GoInt;
    @:native("Read") function read(req: go.Pointer<go.net.http.Request>): go.Result<go.Pointer<go.net.http.Response>>;
    @:native("Write") function write(req: go.Pointer<go.net.http.Request>): go.Error;

}