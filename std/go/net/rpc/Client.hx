package go.net.rpc;

/**
    Client represents an RPC Client.
    There may be multiple outstanding Calls associated
    with a single Client, and a Client may be used by
    multiple goroutines simultaneously.
**/
@:structInit
@:go.Type({ name: "Client", instanceName: "rpc.Client", imports: ["net/rpc"] })
extern class Client {

    /**
        Call invokes the named function, waits for it to complete, and returns its error status.
    **/
    @:native("Call") function call(serviceMethod: String, args: Dynamic, reply: Dynamic): (go.Error);
    /**
        Close calls the underlying codec's Close method. If the connection is already
        shutting down, [ErrShutdown] is returned.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Go invokes the function asynchronously. It returns the [Call] structure representing
        the invocation. The done channel will signal when the call is complete by returning
        the same Call object. If done is nil, Go will allocate a new channel.
        If non-nil, done must be buffered or Go will deliberately crash.
    **/
    @:native("Go") function go(serviceMethod: String, args: Dynamic, reply: Dynamic, done: go.Chan<go.Pointer<go.net.rpc.Call>>): (go.Pointer<go.net.rpc.Call>);

}