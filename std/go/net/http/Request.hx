package go.net.http;

/**
    A Request represents an HTTP request received by a server
    or to be sent by a client.
    
    The field semantics differ slightly between client and server
    usage. In addition to the notes on the fields below, see the
    documentation for [Request.Write] and [RoundTripper].
**/
@:structInit
@:go.Type({ name: "Request", instanceName: "http.Request", imports: ["net/http"] })
extern class Request {

    @:native("Method") var method: String;
    @:native("URL") var URL: go.Pointer<go.net.url.URL>;
    @:native("Proto") var proto: String;
    @:native("ProtoMajor") var protoMajor: go.GoInt;
    @:native("ProtoMinor") var protoMinor: go.GoInt;
    @:native("Header") var header: go.net.http.Header;
    @:native("Body") var body: go.io.ReadCloser;
    @:native("GetBody") var getBody: () -> (go.Result<go.io.ReadCloser>);
    @:native("ContentLength") var contentLength: go.Int64;
    @:native("TransferEncoding") var transferEncoding: go.Slice<String>;
    @:native("Close") var close: Bool;
    @:native("Host") var host: String;
    @:native("Form") var form: go.net.url.Values;
    @:native("PostForm") var postForm: go.net.url.Values;
    @:native("MultipartForm") var multipartForm: go.Pointer<go.mime.multipart.Form>;
    @:native("Trailer") var trailer: go.net.http.Header;
    @:native("RemoteAddr") var remoteAddr: String;
    @:native("RequestURI") var requestURI: String;
    @:native("TLS") var TLS: go.Pointer<go.crypto.tls.ConnectionState>;
    @:native("Cancel") var cancel: go.Chan<Dynamic>;
    @:native("Response") var response: go.Pointer<go.net.http.Response>;
    @:native("Pattern") var pattern: String;

    function new(method: String="", URL: go.Pointer<go.net.url.URL>=null, proto: String="", protoMajor: go.GoInt=0, protoMinor: go.GoInt=0, header: go.net.http.Header=null, body: go.io.ReadCloser=null, getBody: () -> (go.Result<go.io.ReadCloser>)=null, contentLength: go.Int64=0, transferEncoding: go.Slice<String>=null, close: Bool=false, host: String="", form: go.net.url.Values=null, postForm: go.net.url.Values=null, multipartForm: go.Pointer<go.mime.multipart.Form>=null, trailer: go.net.http.Header=null, remoteAddr: String="", requestURI: String="", TLS: go.Pointer<go.crypto.tls.ConnectionState>=null, cancel: go.Chan<Dynamic>=null, response: go.Pointer<go.net.http.Response>=null, pattern: String="");

    /**
        AddCookie adds a cookie to the request. Per RFC 6265 section 5.4,
        AddCookie does not attach more than one [Cookie] header field. That
        means all cookies, if any, are written into the same line,
        separated by semicolon.
        AddCookie only sanitizes c's name and value, and does not sanitize
        a Cookie header already present in the request.
    **/
    @:native("AddCookie") function addCookie(c: go.Pointer<go.net.http.Cookie>): Void;
    /**
        BasicAuth returns the username and password provided in the request's
        Authorization header, if the request uses HTTP Basic Authentication.
        See RFC 2617, Section 2.
    **/
    @:go.Tuple("username", "password", "ok") @:native("BasicAuth") function basicAuth(): (go.Tuple<{ username: String, password: String, ok: Bool }>);
    /**
        Clone returns a deep copy of r with its context changed to ctx.
        The provided ctx must be non-nil.
        
        Clone only makes a shallow copy of the Body field.
        
        For an outgoing client request, the context controls the entire
        lifetime of a request and its response: obtaining a connection,
        sending the request, and reading the response headers and body.
    **/
    @:native("Clone") function clone(ctx: go.context.Context): (go.Pointer<go.net.http.Request>);
    /**
        Context returns the request's context. To change the context, use
        [Request.Clone] or [Request.WithContext].
        
        The returned context is always non-nil; it defaults to the
        background context.
        
        For outgoing client requests, the context controls cancellation.
        
        For incoming server requests, the context is canceled when the
        client's connection closes, the request is canceled (with HTTP/2),
        or when the ServeHTTP method returns.
    **/
    @:native("Context") function context(): (go.context.Context);
    /**
        Cookie returns the named cookie provided in the request or
        [ErrNoCookie] if not found.
        If multiple cookies match the given name, only one cookie will
        be returned.
    **/
    @:native("Cookie") function cookie(name: String): (go.Result<go.Pointer<go.net.http.Cookie>>);
    /**
        Cookies parses and returns the HTTP cookies sent with the request.
    **/
    @:native("Cookies") function cookies(): (go.Slice<go.Pointer<go.net.http.Cookie>>);
    /**
        CookiesNamed parses and returns the named HTTP cookies sent with the request
        or an empty slice if none matched.
    **/
    @:native("CookiesNamed") function cookiesNamed(name: String): (go.Slice<go.Pointer<go.net.http.Cookie>>);
    /**
        FormFile returns the first file for the provided form key.
        FormFile calls [Request.ParseMultipartForm] and [Request.ParseForm] if necessary.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("FormFile") function formFile(key: String): (go.Tuple<{ p0: go.mime.multipart.File, p1: go.Pointer<go.mime.multipart.FileHeader>, p2: go.Error }>);
    /**
        FormValue returns the first value for the named component of the query.
        The precedence order:
         1. application/x-www-form-urlencoded form body (POST, PUT, PATCH only)
         2. query parameters (always)
         3. multipart/form-data form body (always)
        
        FormValue calls [Request.ParseMultipartForm] and [Request.ParseForm]
        if necessary and ignores any errors returned by these functions.
        If key is not present, FormValue returns the empty string.
        To access multiple values of the same key, call ParseForm and
        then inspect [Request.Form] directly.
    **/
    @:native("FormValue") function formValue(key: String): (String);
    /**
        MultipartReader returns a MIME multipart reader if this is a
        multipart/form-data or a multipart/mixed POST request, else returns nil and an error.
        Use this function instead of [Request.ParseMultipartForm] to
        process the request body as a stream.
    **/
    @:native("MultipartReader") function multipartReader(): (go.Result<go.Pointer<go.mime.multipart.Reader>>);
    /**
        ParseForm populates r.Form and r.PostForm.
        
        For all requests, ParseForm parses the raw query from the URL and updates
        r.Form.
        
        For POST, PUT, and PATCH requests, it also reads the request body, parses it
        as a form and puts the results into both r.PostForm and r.Form. Request body
        parameters take precedence over URL query string values in r.Form.
        
        If the request Body's size has not already been limited by [MaxBytesReader],
        the size is capped at 10MB.
        
        For other HTTP methods, or when the Content-Type is not
        application/x-www-form-urlencoded, the request Body is not read, and
        r.PostForm is initialized to a non-nil, empty value.
        
        [Request.ParseMultipartForm] calls ParseForm automatically.
        ParseForm is idempotent.
    **/
    @:native("ParseForm") function parseForm(): (go.Error);
    /**
        ParseMultipartForm parses a request body as multipart/form-data.
        The whole request body is parsed and up to a total of maxMemory bytes of
        its file parts are stored in memory, with the remainder stored on
        disk in temporary files.
        ParseMultipartForm calls [Request.ParseForm] if necessary.
        If ParseForm returns an error, ParseMultipartForm returns it but also
        continues parsing the request body.
        After one call to ParseMultipartForm, subsequent calls have no effect.
    **/
    @:native("ParseMultipartForm") function parseMultipartForm(maxMemory: go.Int64): (go.Error);
    /**
        PathValue returns the value for the named path wildcard in the [ServeMux] pattern
        that matched the request.
        It returns the empty string if the request was not matched against a pattern
        or there is no such wildcard in the pattern.
    **/
    @:native("PathValue") function pathValue(name: String): (String);
    /**
        PostFormValue returns the first value for the named component of the POST,
        PUT, or PATCH request body. URL query parameters are ignored.
        PostFormValue calls [Request.ParseMultipartForm] and [Request.ParseForm] if necessary and ignores
        any errors returned by these functions.
        If key is not present, PostFormValue returns the empty string.
    **/
    @:native("PostFormValue") function postFormValue(key: String): (String);
    /**
        ProtoAtLeast reports whether the HTTP protocol used
        in the request is at least major.minor.
    **/
    @:native("ProtoAtLeast") function protoAtLeast(major: go.GoInt, minor: go.GoInt): (Bool);
    /**
        Referer returns the referring URL, if sent in the request.
        
        Referer is misspelled as in the request itself, a mistake from the
        earliest days of HTTP.  This value can also be fetched from the
        [Header] map as Header["Referer"]; the benefit of making it available
        as a method is that the compiler can diagnose programs that use the
        alternate (correct English) spelling req.Referrer() but cannot
        diagnose programs that use Header["Referrer"].
    **/
    @:native("Referer") function referer(): (String);
    /**
        SetBasicAuth sets the request's Authorization header to use HTTP
        Basic Authentication with the provided username and password.
        
        With HTTP Basic Authentication the provided username and password
        are not encrypted. It should generally only be used in an HTTPS
        request.
        
        The username may not contain a colon. Some protocols may impose
        additional requirements on pre-escaping the username and
        password. For instance, when used with OAuth2, both arguments must
        be URL encoded first with [url.QueryEscape].
    **/
    @:native("SetBasicAuth") function setBasicAuth(username: String, password: String): Void;
    /**
        SetPathValue sets name to value, so that subsequent calls to r.PathValue(name)
        return value.
    **/
    @:native("SetPathValue") function setPathValue(name: String, value: String): Void;
    /**
        UserAgent returns the client's User-Agent, if sent in the request.
    **/
    @:native("UserAgent") function userAgent(): (String);
    /**
        WithContext returns a shallow copy of r with its context changed
        to ctx. The provided ctx must be non-nil.
        
        For outgoing client request, the context controls the entire
        lifetime of a request and its response: obtaining a connection,
        sending the request, and reading the response headers and body.
        
        To create a new request with a context, use [NewRequestWithContext].
        To make a deep copy of a request with a new context, use [Request.Clone].
    **/
    @:native("WithContext") function withContext(ctx: go.context.Context): (go.Pointer<go.net.http.Request>);
    /**
        Write writes an HTTP/1.1 request, which is the header and body, in wire format.
        This method consults the following fields of the request:
        
        	Host
        	URL
        	Method (defaults to "GET")
        	Header
        	ContentLength
        	TransferEncoding
        	Body
        
        If Body is present, Content-Length is <= 0 and [Request.TransferEncoding]
        hasn't been set to "identity", Write adds "Transfer-Encoding:
        chunked" to the header. Body is closed after it is sent.
    **/
    @:native("Write") function write(w: go.io.Writer): (go.Error);
    /**
        WriteProxy is like [Request.Write] but writes the request in the form
        expected by an HTTP proxy. In particular, [Request.WriteProxy] writes the
        initial Request-URI line of the request with an absolute URI, per
        section 5.3 of RFC 7230, including the scheme and host.
        In either case, WriteProxy also writes a Host header, using
        either r.Host or r.URL.Host.
    **/
    @:native("WriteProxy") function writeProxy(w: go.io.Writer): (go.Error);

}