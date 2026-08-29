package go.net.http;

/**
    Package cgi implements CGI (Common Gateway Interface) as specified
    in RFC 3875.
    
    Note that using CGI means starting a new process to handle each
    request, which is typically less efficient than using a
    long-running server. This package is intended primarily for
    compatibility with existing systems.
**/
@:go.Type({ name: "cgi", instanceName: "cgi.cgi", imports: ["net/http/cgi"] })
extern class Cgi {

    /**
        Request returns the HTTP request as represented in the current
        environment. This assumes the current program is being run
        by a web server in a CGI environment.
        The returned Request's Body is populated, if applicable.
    **/
    @:native("Request") static function request(): (go.Result<go.Pointer<go.net.http.Request>>);
    /**
        RequestFromMap creates an [http.Request] from CGI variables.
        The returned Request's Body field is not populated.
    **/
    @:native("RequestFromMap") static function requestFromMap(params: go.Map<String, String>): (go.Result<go.Pointer<go.net.http.Request>>);
    /**
        Serve executes the provided [Handler] on the currently active CGI
        request, if any. If there's no current CGI environment
        an error is returned. The provided handler may be nil to use
        [http.DefaultServeMux].
    **/
    @:native("Serve") static function serve(handler: go.net.http.Handler): (go.Error);

}