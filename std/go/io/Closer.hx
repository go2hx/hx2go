package go.io;

/**
    Closer is the interface that wraps the basic Close method.
    
    The behavior of Close after the first call is undefined.
    Specific implementations may document their own behavior.
**/
@:go.Type({ name: "Closer", instanceName: "io.Closer", imports: ["io"] })
extern typedef Closer = {

    @:native("Close") function close(): (go.Error);

}