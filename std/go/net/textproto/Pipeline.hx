package go.net.textproto;

/**
    A Pipeline manages a pipelined in-order request/response sequence.
    
    To use a Pipeline p to manage multiple clients on a connection,
    each client should run:
    
    	id := p.Next()	// take a number
    
    	p.StartRequest(id)	// wait for turn to send request
    	«send request»
    	p.EndRequest(id)	// notify Pipeline that request is sent
    
    	p.StartResponse(id)	// wait for turn to read response
    	«read response»
    	p.EndResponse(id)	// notify Pipeline that response is read
    
    A pipelined server can use the same calls to ensure that
    responses computed in parallel are written in the correct order.
**/
@:structInit
@:go.Type({ name: "Pipeline", instanceName: "textproto.Pipeline", imports: ["net/textproto"] })
extern class Pipeline {

    /**
        EndRequest notifies p that the request with the given id has been sent
        (or, if this is a server, received).
    **/
    @:native("EndRequest") function endRequest(id: go.GoUInt): Void;
    /**
        EndResponse notifies p that the response with the given id has been received
        (or, if this is a server, sent).
    **/
    @:native("EndResponse") function endResponse(id: go.GoUInt): Void;
    /**
        Next returns the next id for a request/response pair.
    **/
    @:native("Next") function next(): (go.GoUInt);
    /**
        StartRequest blocks until it is time to send (or, if this is a server, receive)
        the request with the given id.
    **/
    @:native("StartRequest") function startRequest(id: go.GoUInt): Void;
    /**
        StartResponse blocks until it is time to receive (or, if this is a server, send)
        the request with the given id.
    **/
    @:native("StartResponse") function startResponse(id: go.GoUInt): Void;

}