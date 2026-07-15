package go.net.rpc;

@:go.Type({ name: "jsonrpc", instanceName: "jsonrpc.jsonrpc", imports: ["net/rpc/jsonrpc"] })
extern class Jsonrpc {

    @:native("Dial") static function dial(network: String, address: String): go.Result<go.Pointer<go.net.rpc.Client>>;
    @:native("NewClient") static function newClient(conn: go.io.ReadWriteCloser): go.Pointer<go.net.rpc.Client>;
    @:native("NewClientCodec") static function newClientCodec(conn: go.io.ReadWriteCloser): go.net.rpc.ClientCodec;
    @:native("NewServerCodec") static function newServerCodec(conn: go.io.ReadWriteCloser): go.net.rpc.ServerCodec;
    @:native("ServeConn") static function serveConn(conn: go.io.ReadWriteCloser): Void;

}