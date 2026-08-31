package go.net.rpc;

/**
    Server represents an RPC Server.
**/
@:structInit
@:go.Type({ name: "Server", instanceName: "rpc.Server", imports: ["net/rpc"] })
extern class Server {

    /**
        Accept accepts connections on the listener and serves requests
        for each incoming connection. Accept blocks until the listener
        returns a non-nil error. The caller typically invokes Accept in a
        go statement.
    **/
    @:native("Accept") function accept(lis: go.net.Listener): Void;
    /**
        HandleHTTP registers an HTTP handler for RPC messages on rpcPath,
        and a debugging handler on debugPath.
        It is still necessary to invoke [http.Serve](), typically in a go statement.
    **/
    @:native("HandleHTTP") function handleHTTP(rpcPath: String, debugPath: String): Void;
    /**
        Register publishes in the server the set of methods of the
        receiver value that satisfy the following conditions:
          - exported method of exported type
          - two arguments, both of exported type
          - the second argument is a pointer
          - one return value, of type error
        
        It returns an error if the receiver is not an exported type or has
        no suitable methods. It also logs the error using package log.
        The client accesses each method using a string of the form "Type.Method",
        where Type is the receiver's concrete type.
    **/
    @:native("Register") function register(rcvr: Dynamic): (go.Error);
    /**
        RegisterName is like [Register] but uses the provided name for the type
        instead of the receiver's concrete type.
    **/
    @:native("RegisterName") function registerName(name: String, rcvr: Dynamic): (go.Error);
    /**
        ServeCodec is like [ServeConn] but uses the specified codec to
        decode requests and encode responses.
    **/
    @:native("ServeCodec") function serveCodec(codec: go.net.rpc.ServerCodec): Void;
    /**
        ServeConn runs the server on a single connection.
        ServeConn blocks, serving the connection until the client hangs up.
        The caller typically invokes ServeConn in a go statement.
        ServeConn uses the gob wire format (see package gob) on the
        connection. To use an alternate codec, use [ServeCodec].
        See [NewClient]'s comment for information about concurrent access.
    **/
    @:native("ServeConn") function serveConn(conn: go.io.ReadWriteCloser): Void;
    /**
        ServeHTTP implements an [http.Handler] that answers RPC requests.
    **/
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;
    /**
        ServeRequest is like [ServeCodec] but synchronously serves a single request.
        It does not close the codec upon completion.
    **/
    @:native("ServeRequest") function serveRequest(codec: go.net.rpc.ServerCodec): (go.Error);

}