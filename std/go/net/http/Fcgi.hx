package go.net.http;

/**
    Package fcgi implements the FastCGI protocol.
    
    See https://fast-cgi.github.io/ for an unofficial mirror of the
    original documentation.
    
    Currently only the responder role is supported.
**/
@:go.Type({ name: "fcgi", instanceName: "fcgi.fcgi", imports: ["net/http/fcgi"] })
extern class Fcgi {

    /**
        ProcessEnv returns FastCGI environment variables associated with the request r
        for which no effort was made to be included in the request itself - the data
        is hidden in the request's context. As an example, if REMOTE_USER is set for a
        request, it will not be found anywhere in r, but it will be included in
        ProcessEnv's response (via r's context).
    **/
    @:native("ProcessEnv") static function processEnv(r: go.Pointer<go.net.http.Request>): (go.Map<String, String>);
    /**
        Serve accepts incoming FastCGI connections on the listener l, creating a new
        goroutine for each. The goroutine reads requests and then calls handler
        to reply to them.
        If l is nil, Serve accepts connections from os.Stdin.
        If handler is nil, [http.DefaultServeMux] is used.
    **/
    @:native("Serve") static function serve(l: go.net.Listener, handler: go.net.http.Handler): (go.Error);

}