package go.net.http;

/**
    The Flusher interface is implemented by ResponseWriters that allow
    an HTTP handler to flush buffered data to the client.
    
    The default HTTP/1.x and HTTP/2 [ResponseWriter] implementations
    support [Flusher], but ResponseWriter wrappers may not. Handlers
    should always test for this ability at runtime.
    
    Note that even for ResponseWriters that support Flush,
    if the client is connected through an HTTP proxy,
    the buffered data may not reach the client until the response
    completes.
**/
@:go.Type({ name: "Flusher", instanceName: "http.Flusher", imports: ["net/http"] })
extern typedef Flusher = {

    @:native("Flush") function flush(): Void;

}