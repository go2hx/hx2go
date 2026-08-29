package go.net.rpc;

/**
    Package jsonrpc implements a JSON-RPC 1.0 ClientCodec and ServerCodec
    for the rpc package.
    For JSON-RPC 2.0 support, see https://godoc.org/?q=json-rpc+2.0
**/
@:go.Type({ name: "jsonrpc", instanceName: "jsonrpc.jsonrpc", imports: ["net/rpc/jsonrpc"] })
extern class Jsonrpc {

    /**
        Dial connects to a JSON-RPC server at the specified network address.
    **/
    @:native("Dial") static function dial(network: String, address: String): (go.Result<go.Pointer<go.net.rpc.Client>>);
    /**
        NewClient returns a new [rpc.Client] to handle requests to the
        set of services at the other end of the connection.
    **/
    @:native("NewClient") static function newClient(conn: go.io.ReadWriteCloser): (go.Pointer<go.net.rpc.Client>);
    /**
        NewClientCodec returns a new [rpc.ClientCodec] using JSON-RPC on conn.
    **/
    @:native("NewClientCodec") static function newClientCodec(conn: go.io.ReadWriteCloser): (go.net.rpc.ClientCodec);
    /**
        NewServerCodec returns a new [rpc.ServerCodec] using JSON-RPC on conn.
    **/
    @:native("NewServerCodec") static function newServerCodec(conn: go.io.ReadWriteCloser): (go.net.rpc.ServerCodec);
    /**
        ServeConn runs the JSON-RPC server on a single connection.
        ServeConn blocks, serving the connection until the client hangs up.
        The caller typically invokes ServeConn in a go statement.
    **/
    @:native("ServeConn") static function serveConn(conn: go.io.ReadWriteCloser): Void;

}