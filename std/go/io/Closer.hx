package go.io;

@:go.Type({ name: "Closer", instanceName: "io.Closer", imports: ["io"] })
extern typedef Closer = {

    @:native("Close") function close(): go.Error;

}