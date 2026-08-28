package go.net;

/**
    Package rpc provides access to the exported methods of an object across a
    network or other I/O connection.
    
    The net/rpc package is frozen and is not accepting new features.
    
    A server registers an object, making it visible
    as a service with the name of the type of the object.  After registration, exported
    methods of the object will be accessible remotely.  A server may register multiple
    objects (services) of different types but it is an error to register multiple
    objects of the same type.
    
    Only methods that satisfy these criteria will be made available for remote access;
    other methods will be ignored:
    
      - the method's type is exported.
      - the method is exported.
      - the method has two arguments, both exported (or builtin) types.
      - the method's second argument is a pointer.
      - the method has return type error.
    
    In effect, the method must look schematically like
    
    	func (t *T) MethodName(argType T1, replyType *T2) error
    
    where T1 and T2 can be marshaled by encoding/gob.
    These requirements apply even if a different codec is used.
    (In the future, these requirements may soften for custom codecs.)
    
    The method's first argument represents the arguments provided by the caller; the
    second argument represents the result parameters to be returned to the caller.
    The method's return value, if non-nil, is passed back as a string that the client
    sees as if created by [errors.New].  If an error is returned, the reply parameter
    will not be sent back to the client.
    
    The server may handle requests on a single connection by calling [ServeConn].  More
    typically it will create a network listener and call [Accept] or, for an HTTP
    listener, [HandleHTTP] and [http.Serve].
    
    A client wishing to use the service establishes a connection and then invokes
    [NewClient] on the connection.  The convenience function [Dial] ([DialHTTP]) performs
    both steps for a raw network connection (an HTTP connection).  The resulting
    [Client] object has two methods, [Call] and Go, that specify the service and method to
    call, a pointer containing the arguments, and a pointer to receive the result
    parameters.
    
    The Call method waits for the remote call to complete while the Go method
    launches the call asynchronously and signals completion using the Call
    structure's Done channel.
    
    Unless an explicit codec is set up, package [encoding/gob] is used to
    transport the data.
    
    Here is a simple example.  A server wishes to export an object of type Arith:
    
    	package server
    
    	import "errors"
    
    	type Args struct {
    		A, B int
    	}
    
    	type Quotient struct {
    		Quo, Rem int
    	}
    
    	type Arith int
    
    	func (t *Arith) Multiply(args *Args, reply *int) error {
    		*reply = args.A * args.B
    		return nil
    	}
    
    	func (t *Arith) Divide(args *Args, quo *Quotient) error {
    		if args.B == 0 {
    			return errors.New("divide by zero")
    		}
    		quo.Quo = args.A / args.B
    		quo.Rem = args.A % args.B
    		return nil
    	}
    
    The server calls (for HTTP service):
    
    	arith := new(Arith)
    	rpc.Register(arith)
    	rpc.HandleHTTP()
    	l, err := net.Listen("tcp", ":1234")
    	if err != nil {
    		log.Fatal("listen error:", err)
    	}
    	go http.Serve(l, nil)
    
    At this point, clients can see a service "Arith" with methods "Arith.Multiply" and
    "Arith.Divide".  To invoke one, a client first dials the server:
    
    	client, err := rpc.DialHTTP("tcp", serverAddress + ":1234")
    	if err != nil {
    		log.Fatal("dialing:", err)
    	}
    
    Then it can make a remote call:
    
    	// Synchronous call
    	args := &server.Args{7,8}
    	var reply int
    	err = client.Call("Arith.Multiply", args, &reply)
    	if err != nil {
    		log.Fatal("arith error:", err)
    	}
    	fmt.Printf("Arith: %d*%d=%d", args.A, args.B, reply)
    
    or
    
    	// Asynchronous call
    	quotient := new(Quotient)
    	divCall := client.Go("Arith.Divide", args, quotient, nil)
    	replyCall := <-divCall.Done	// will be equal to divCall
    	// check errors, print, etc.
    
    A server implementation will often provide a simple, type-safe wrapper for the
    client.
**/
@:go.Type({ name: "rpc", instanceName: "rpc.rpc", imports: ["net/rpc"] })
extern class Rpc {

    @:native("DefaultDebugPath") static var defaultDebugPath: String;
    @:native("DefaultRPCPath") static var defaultRPCPath: String;

    /**
        DefaultServer is the default instance of [*Server].
    **/
    @:native("DefaultServer") static var defaultServer: go.Pointer<go.net.rpc.Server>;

    /**
        Accept accepts connections on the listener and serves requests
        to [DefaultServer] for each incoming connection.
        Accept blocks; the caller typically invokes it in a go statement.
    **/
    @:native("Accept") static function accept(lis: go.net.Listener): Void;
    /**
        Dial connects to an RPC server at the specified network address.
    **/
    @:native("Dial") static function dial(network: String, address: String): (go.Result<go.Pointer<go.net.rpc.Client>>);
    /**
        DialHTTP connects to an HTTP RPC server at the specified network address
        listening on the default HTTP RPC path.
    **/
    @:native("DialHTTP") static function dialHTTP(network: String, address: String): (go.Result<go.Pointer<go.net.rpc.Client>>);
    /**
        DialHTTPPath connects to an HTTP RPC server
        at the specified network address and path.
    **/
    @:native("DialHTTPPath") static function dialHTTPPath(network: String, address: String, path: String): (go.Result<go.Pointer<go.net.rpc.Client>>);
    /**
        HandleHTTP registers an HTTP handler for RPC messages to [DefaultServer]
        on [DefaultRPCPath] and a debugging handler on [DefaultDebugPath].
        It is still necessary to invoke [http.Serve](), typically in a go statement.
    **/
    @:native("HandleHTTP") static function handleHTTP(): Void;
    /**
        NewClient returns a new [Client] to handle requests to the
        set of services at the other end of the connection.
        It adds a buffer to the write side of the connection so
        the header and payload are sent as a unit.
        
        The read and write halves of the connection are serialized independently,
        so no interlocking is required. However each half may be accessed
        concurrently so the implementation of conn should protect against
        concurrent reads or concurrent writes.
    **/
    @:native("NewClient") static function newClient(conn: go.io.ReadWriteCloser): (go.Pointer<go.net.rpc.Client>);
    /**
        NewClientWithCodec is like [NewClient] but uses the specified
        codec to encode requests and decode responses.
    **/
    @:native("NewClientWithCodec") static function newClientWithCodec(codec: go.net.rpc.ClientCodec): (go.Pointer<go.net.rpc.Client>);
    /**
        NewServer returns a new [Server].
    **/
    @:native("NewServer") static function newServer(): (go.Pointer<go.net.rpc.Server>);
    /**
        Register publishes the receiver's methods in the [DefaultServer].
    **/
    @:native("Register") static function register(rcvr: Dynamic): (go.Error);
    /**
        RegisterName is like [Register] but uses the provided name for the type
        instead of the receiver's concrete type.
    **/
    @:native("RegisterName") static function registerName(name: String, rcvr: Dynamic): (go.Error);
    /**
        ServeCodec is like [ServeConn] but uses the specified codec to
        decode requests and encode responses.
    **/
    @:native("ServeCodec") static function serveCodec(codec: go.net.rpc.ServerCodec): Void;
    /**
        ServeConn runs the [DefaultServer] on a single connection.
        ServeConn blocks, serving the connection until the client hangs up.
        The caller typically invokes ServeConn in a go statement.
        ServeConn uses the gob wire format (see package gob) on the
        connection. To use an alternate codec, use [ServeCodec].
        See [NewClient]'s comment for information about concurrent access.
    **/
    @:native("ServeConn") static function serveConn(conn: go.io.ReadWriteCloser): Void;
    /**
        ServeRequest is like [ServeCodec] but synchronously serves a single request.
        It does not close the codec upon completion.
    **/
    @:native("ServeRequest") static function serveRequest(codec: go.net.rpc.ServerCodec): (go.Error);

}