package go.net.http;

@:go.Type({ name: "httputil", instanceName: "httputil.httputil", imports: ["net/http/httputil"] })
extern class Httputil {

    @:native("ErrClosed") static var ErrClosed: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrPersistEOF") static var ErrPersistEOF: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrPipeline") static var ErrPipeline: go.Pointer<go.net.http.ProtocolError>;

    @:native("DumpRequest") static function dumpRequest(req: go.Pointer<go.net.http.Request>, body: Bool): go.Result<go.Slice<go.Byte>>;
    @:native("DumpRequestOut") static function dumpRequestOut(req: go.Pointer<go.net.http.Request>, body: Bool): go.Result<go.Slice<go.Byte>>;
    @:native("DumpResponse") static function dumpResponse(resp: go.Pointer<go.net.http.Response>, body: Bool): go.Result<go.Slice<go.Byte>>;
    @:native("NewChunkedReader") static function newChunkedReader(r: go.io.Reader): go.io.Reader;
    @:native("NewChunkedWriter") static function newChunkedWriter(w: go.io.Writer): go.io.WriteCloser;
    @:native("NewClientConn") static function newClientConn(c: go.net.Conn, r: go.Pointer<go.bufio.Reader>): go.Pointer<go.net.http.httputil.ClientConn>;
    @:native("NewProxyClientConn") static function newProxyClientConn(c: go.net.Conn, r: go.Pointer<go.bufio.Reader>): go.Pointer<go.net.http.httputil.ClientConn>;
    @:native("NewServerConn") static function newServerConn(c: go.net.Conn, r: go.Pointer<go.bufio.Reader>): go.Pointer<go.net.http.httputil.ServerConn>;
    @:native("NewSingleHostReverseProxy") static function newSingleHostReverseProxy(target: go.Pointer<go.net.url.URL>): go.Pointer<go.net.http.httputil.ReverseProxy>;

}