package go.net.http;

/**
    A ResponseController is used by an HTTP handler to control the response.
    
    A ResponseController may not be used after the [Handler.ServeHTTP] method has returned.
**/
@:structInit
@:go.Type({ name: "ResponseController", instanceName: "http.ResponseController", imports: ["net/http"] })
extern class ResponseController {

    /**
        EnableFullDuplex indicates that the request handler will interleave reads from [Request.Body]
        with writes to the [ResponseWriter].
        
        For HTTP/1 requests, the Go HTTP server by default consumes any unread portion of
        the request body before beginning to write the response, preventing handlers from
        concurrently reading from the request and writing the response.
        Calling EnableFullDuplex disables this behavior and permits handlers to continue to read
        from the request while concurrently writing the response.
        
        For HTTP/2 requests, the Go HTTP server always permits concurrent reads and responses.
    **/
    @:native("EnableFullDuplex") function enableFullDuplex(): (go.Error);
    /**
        Flush flushes buffered data to the client.
    **/
    @:native("Flush") function flush(): (go.Error);
    /**
        Hijack lets the caller take over the connection.
        See the [Hijacker] interface for details.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("Hijack") function hijack(): (go.Tuple<{ p0: go.net.Conn, p1: go.Pointer<go.bufio.ReadWriter>, p2: go.Error }>);
    /**
        SetReadDeadline sets the deadline for reading the entire request, including the body.
        Reads from the request body after the deadline has been exceeded will return an error.
        A zero value means no deadline.
        
        Setting the read deadline after it has been exceeded will not extend it.
    **/
    @:native("SetReadDeadline") function setReadDeadline(deadline: go.time.Time): (go.Error);
    /**
        SetWriteDeadline sets the deadline for writing the response.
        Writes to the response body after the deadline has been exceeded will not block,
        but may succeed if the data has been buffered.
        A zero value means no deadline.
        
        Setting the write deadline after it has been exceeded will not extend it.
    **/
    @:native("SetWriteDeadline") function setWriteDeadline(deadline: go.time.Time): (go.Error);

}