package go.net;

@:go.Type({ name: "http", instanceName: "http.http", imports: ["net/http"] })
extern class Http {

    /**
        DefaultMaxHeaderBytes is the maximum permitted size of the headers
        in an HTTP request.
        This can be overridden by setting [Server.MaxHeaderBytes].
    **/
    @:native("DefaultMaxHeaderBytes") static var defaultMaxHeaderBytes: go.GoInt;
    /**
        DefaultMaxIdleConnsPerHost is the default value of [Transport]'s
        MaxIdleConnsPerHost.
    **/
    @:native("DefaultMaxIdleConnsPerHost") static var defaultMaxIdleConnsPerHost: go.GoInt;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodConnect") static var methodConnect: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodDelete") static var methodDelete: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodGet") static var methodGet: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodHead") static var methodHead: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodOptions") static var methodOptions: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodPatch") static var methodPatch: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodPost") static var methodPost: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodPut") static var methodPut: String;
    /**
        Common HTTP methods.
        
        Unless otherwise noted, these are defined in RFC 7231 section 4.3.
    **/
    @:native("MethodTrace") static var methodTrace: String;
    @:native("SameSiteDefaultMode") static var sameSiteDefaultMode: go.net.http.SameSite;
    @:native("SameSiteLaxMode") static var sameSiteLaxMode: go.net.http.SameSite;
    @:native("SameSiteNoneMode") static var sameSiteNoneMode: go.net.http.SameSite;
    @:native("SameSiteStrictMode") static var sameSiteStrictMode: go.net.http.SameSite;
    @:native("StateActive") static var stateActive: go.net.http.ConnState;
    @:native("StateClosed") static var stateClosed: go.net.http.ConnState;
    @:native("StateHijacked") static var stateHijacked: go.net.http.ConnState;
    @:native("StateIdle") static var stateIdle: go.net.http.ConnState;
    @:native("StateNew") static var stateNew: go.net.http.ConnState;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusAccepted") static var statusAccepted: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusAlreadyReported") static var statusAlreadyReported: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusBadGateway") static var statusBadGateway: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusBadRequest") static var statusBadRequest: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusConflict") static var statusConflict: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusContinue") static var statusContinue: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusCreated") static var statusCreated: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusEarlyHints") static var statusEarlyHints: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusExpectationFailed") static var statusExpectationFailed: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusFailedDependency") static var statusFailedDependency: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusForbidden") static var statusForbidden: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusFound") static var statusFound: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusGatewayTimeout") static var statusGatewayTimeout: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusGone") static var statusGone: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusHTTPVersionNotSupported") static var statusHTTPVersionNotSupported: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusIMUsed") static var statusIMUsed: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusInsufficientStorage") static var statusInsufficientStorage: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusInternalServerError") static var statusInternalServerError: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusLengthRequired") static var statusLengthRequired: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusLocked") static var statusLocked: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusLoopDetected") static var statusLoopDetected: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusMethodNotAllowed") static var statusMethodNotAllowed: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusMisdirectedRequest") static var statusMisdirectedRequest: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusMovedPermanently") static var statusMovedPermanently: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusMultiStatus") static var statusMultiStatus: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusMultipleChoices") static var statusMultipleChoices: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNetworkAuthenticationRequired") static var statusNetworkAuthenticationRequired: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNoContent") static var statusNoContent: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNonAuthoritativeInfo") static var statusNonAuthoritativeInfo: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNotAcceptable") static var statusNotAcceptable: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNotExtended") static var statusNotExtended: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNotFound") static var statusNotFound: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNotImplemented") static var statusNotImplemented: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusNotModified") static var statusNotModified: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusOK") static var statusOK: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusPartialContent") static var statusPartialContent: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusPaymentRequired") static var statusPaymentRequired: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusPermanentRedirect") static var statusPermanentRedirect: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusPreconditionFailed") static var statusPreconditionFailed: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusPreconditionRequired") static var statusPreconditionRequired: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusProcessing") static var statusProcessing: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusProxyAuthRequired") static var statusProxyAuthRequired: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusRequestEntityTooLarge") static var statusRequestEntityTooLarge: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusRequestHeaderFieldsTooLarge") static var statusRequestHeaderFieldsTooLarge: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusRequestTimeout") static var statusRequestTimeout: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusRequestURITooLong") static var statusRequestURITooLong: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusRequestedRangeNotSatisfiable") static var statusRequestedRangeNotSatisfiable: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusResetContent") static var statusResetContent: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusSeeOther") static var statusSeeOther: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusServiceUnavailable") static var statusServiceUnavailable: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusSwitchingProtocols") static var statusSwitchingProtocols: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusTeapot") static var statusTeapot: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusTemporaryRedirect") static var statusTemporaryRedirect: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusTooEarly") static var statusTooEarly: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusTooManyRequests") static var statusTooManyRequests: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusUnauthorized") static var statusUnauthorized: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusUnavailableForLegalReasons") static var statusUnavailableForLegalReasons: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusUnprocessableEntity") static var statusUnprocessableEntity: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusUnsupportedMediaType") static var statusUnsupportedMediaType: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusUpgradeRequired") static var statusUpgradeRequired: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusUseProxy") static var statusUseProxy: go.GoInt;
    /**
        HTTP status codes as registered with IANA.
        See: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
    **/
    @:native("StatusVariantAlsoNegotiates") static var statusVariantAlsoNegotiates: go.GoInt;
    /**
        TimeFormat is the time format to use when generating times in HTTP
        headers. It is like [time.RFC1123] but hard-codes GMT as the time
        zone. The time being formatted must be in UTC for Format to
        generate the correct format.
        
        For parsing this time format, see [ParseTime].
    **/
    @:native("TimeFormat") static var timeFormat: String;
    /**
        TrailerPrefix is a magic prefix for [ResponseWriter.Header] map keys
        that, if present, signals that the map entry is actually for
        the response trailers, and not the response headers. The prefix
        is stripped after the ServeHTTP call finishes and the values are
        sent in the trailers.
        
        This mechanism is intended only for trailers that are not known
        prior to the headers being written. If the set of trailers is fixed
        or known before the header is written, the normal Go trailers mechanism
        is preferred:
        
        	https://pkg.go.dev/net/http#ResponseWriter
        	https://pkg.go.dev/net/http#example-ResponseWriter-Trailers
    **/
    @:native("TrailerPrefix") static var trailerPrefix: String;

    /**
        DefaultClient is the default [Client] and is used by [Get], [Head], and [Post].
    **/
    @:native("DefaultClient") static var defaultClient: go.Pointer<go.net.http.Client>;
    /**
        DefaultServeMux is the default [ServeMux] used by [Serve].
    **/
    @:native("DefaultServeMux") static var defaultServeMux: go.Pointer<go.net.http.ServeMux>;
    /**
        DefaultTransport is the default implementation of [Transport] and is
        used by [DefaultClient]. It establishes network connections as needed
        and caches them for reuse by subsequent calls. It uses HTTP proxies
        as directed by the environment variables HTTP_PROXY, HTTPS_PROXY
        and NO_PROXY (or the lowercase versions thereof).
    **/
    @:native("DefaultTransport") static var defaultTransport: go.net.http.RoundTripper;
    @:native("ErrHeaderTooLong") static var errHeaderTooLong: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrMissingBoundary") static var errMissingBoundary: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrMissingContentLength") static var errMissingContentLength: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrNotMultipart") static var errNotMultipart: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrNotSupported") static var errNotSupported: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrShortBody") static var errShortBody: go.Pointer<go.net.http.ProtocolError>;
    @:native("ErrUnexpectedTrailer") static var errUnexpectedTrailer: go.Pointer<go.net.http.ProtocolError>;
    @:native("LocalAddrContextKey") static var localAddrContextKey: go.Pointer<go.net.http.ContextKey>;
    /**
        NoBody is an [io.ReadCloser] with no bytes. Read always returns EOF
        and Close always returns nil. It can be used in an outgoing client
        request to explicitly signal that a request has zero bytes.
        An alternative, however, is to simply set [Request.Body] to nil.
    **/
    @:native("NoBody") static var noBody: go.net.http.NoBody_;
    @:native("ServerContextKey") static var serverContextKey: go.Pointer<go.net.http.ContextKey>;

    /**
        AllowQuerySemicolons returns a handler that serves requests by converting any
        unescaped semicolons in the URL query to ampersands, and invoking the handler h.
        
        This restores the pre-Go 1.17 behavior of splitting query parameters on both
        semicolons and ampersands. (See golang.org/issue/25192). Note that this
        behavior doesn't match that of many proxies, and the mismatch can lead to
        security issues.
        
        AllowQuerySemicolons should be invoked before [Request.ParseForm] is called.
    **/
    @:native("AllowQuerySemicolons") static function allowQuerySemicolons(h: go.net.http.Handler): (go.net.http.Handler);
    /**
        CanonicalHeaderKey returns the canonical format of the
        header key s. The canonicalization converts the first
        letter and any letter following a hyphen to upper case;
        the rest are converted to lowercase. For example, the
        canonical key for "accept-encoding" is "Accept-Encoding".
        If s contains a space or invalid header field bytes, it is
        returned without modifications.
    **/
    @:native("CanonicalHeaderKey") static function canonicalHeaderKey(s: String): (String);
    /**
        DetectContentType implements the algorithm described
        at https://mimesniff.spec.whatwg.org/ to determine the
        Content-Type of the given data. It considers at most the
        first 512 bytes of data. DetectContentType always returns
        a valid MIME type: if it cannot determine a more specific one, it
        returns "application/octet-stream".
    **/
    @:native("DetectContentType") static function detectContentType(data: go.Slice<go.Byte>): (String);
    /**
        Error replies to the request with the specified error message and HTTP code.
        It does not otherwise end the request; the caller should ensure no further
        writes are done to w.
        The error message should be plain text.
        
        Error deletes the Content-Length header,
        sets Content-Type to “text/plain; charset=utf-8”,
        and sets X-Content-Type-Options to “nosniff”.
        This configures the header properly for the error message,
        in case the caller had set it up expecting a successful output.
    **/
    @:native("Error") static function error(w: go.net.http.ResponseWriter, error: String, code: go.GoInt): Void;
    /**
        FS converts fsys to a [FileSystem] implementation,
        for use with [FileServer] and [NewFileTransport].
        The files provided by fsys must implement [io.Seeker].
    **/
    @:native("FS") static function FS(fsys: go.io.fs.FS): (go.net.http.FileSystem);
    /**
        FileServer returns a handler that serves HTTP requests
        with the contents of the file system rooted at root.
        
        As a special case, the returned file server redirects any request
        ending in "/index.html" to the same path, without the final
        "index.html".
        
        To use the operating system's file system implementation,
        use [http.Dir]:
        
        	http.Handle("/", http.FileServer(http.Dir("/tmp")))
        
        To use an [fs.FS] implementation, use [http.FileServerFS] instead.
    **/
    @:native("FileServer") static function fileServer(root: go.net.http.FileSystem): (go.net.http.Handler);
    /**
        FileServerFS returns a handler that serves HTTP requests
        with the contents of the file system fsys.
        The files provided by fsys must implement [io.Seeker].
        
        As a special case, the returned file server redirects any request
        ending in "/index.html" to the same path, without the final
        "index.html".
        
        	http.Handle("/", http.FileServerFS(fsys))
    **/
    @:native("FileServerFS") static function fileServerFS(root: go.io.fs.FS): (go.net.http.Handler);
    /**
        Get issues a GET to the specified URL. If the response is one of
        the following redirect codes, Get follows the redirect, up to a
        maximum of 10 redirects:
        
        	301 (Moved Permanently)
        	302 (Found)
        	303 (See Other)
        	307 (Temporary Redirect)
        	308 (Permanent Redirect)
        
        An error is returned if there were too many redirects or if there
        was an HTTP protocol error. A non-2xx response doesn't cause an
        error. Any returned error will be of type [*url.Error]. The url.Error
        value's Timeout method will report true if the request timed out.
        
        When err is nil, resp always contains a non-nil resp.Body.
        Caller should close resp.Body when done reading from it.
        
        Get is a wrapper around DefaultClient.Get.
        
        To make a request with custom headers, use [NewRequest] and
        DefaultClient.Do.
        
        To make a request with a specified context.Context, use [NewRequestWithContext]
        and DefaultClient.Do.
    **/
    @:native("Get") static function get(url: String): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Handle registers the handler for the given pattern in [DefaultServeMux].
        The documentation for [ServeMux] explains how patterns are matched.
    **/
    @:native("Handle") static function handle(pattern: String, handler: go.net.http.Handler): Void;
    /**
        HandleFunc registers the handler function for the given pattern in [DefaultServeMux].
        The documentation for [ServeMux] explains how patterns are matched.
    **/
    @:native("HandleFunc") static function handleFunc(pattern: String, handler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>) -> Void): Void;
    /**
        Head issues a HEAD to the specified URL. If the response is one of
        the following redirect codes, Head follows the redirect, up to a
        maximum of 10 redirects:
        
        	301 (Moved Permanently)
        	302 (Found)
        	303 (See Other)
        	307 (Temporary Redirect)
        	308 (Permanent Redirect)
        
        Head is a wrapper around DefaultClient.Head.
        
        To make a request with a specified [context.Context], use [NewRequestWithContext]
        and DefaultClient.Do.
    **/
    @:native("Head") static function head(url: String): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        ListenAndServe listens on the TCP network address addr and then calls
        [Serve] with handler to handle requests on incoming connections.
        Accepted connections are configured to enable TCP keep-alives.
        
        The handler is typically nil, in which case [DefaultServeMux] is used.
        
        ListenAndServe always returns a non-nil error.
    **/
    @:native("ListenAndServe") static function listenAndServe(addr: String, handler: go.net.http.Handler): (go.Error);
    /**
        ListenAndServeTLS acts identically to [ListenAndServe], except that it
        expects HTTPS connections. Additionally, files containing a certificate and
        matching private key for the server must be provided. If the certificate
        is signed by a certificate authority, the certFile should be the concatenation
        of the server's certificate, any intermediates, and the CA's certificate.
    **/
    @:native("ListenAndServeTLS") static function listenAndServeTLS(addr: String, certFile: String, keyFile: String, handler: go.net.http.Handler): (go.Error);
    /**
        MaxBytesHandler returns a [Handler] that runs h with its [ResponseWriter] and [Request.Body] wrapped by a MaxBytesReader.
    **/
    @:native("MaxBytesHandler") static function maxBytesHandler(h: go.net.http.Handler, n: go.Int64): (go.net.http.Handler);
    /**
        MaxBytesReader is similar to [io.LimitReader] but is intended for
        limiting the size of incoming request bodies. In contrast to
        io.LimitReader, MaxBytesReader's result is a ReadCloser, returns a
        non-nil error of type [*MaxBytesError] for a Read beyond the limit,
        and closes the underlying reader when its Close method is called.
        
        MaxBytesReader prevents clients from accidentally or maliciously
        sending a large request and wasting server resources. If possible,
        it tells the [ResponseWriter] to close the connection after the limit
        has been reached.
    **/
    @:native("MaxBytesReader") static function maxBytesReader(w: go.net.http.ResponseWriter, r: go.io.ReadCloser, n: go.Int64): (go.io.ReadCloser);
    /**
        NewCrossOriginProtection returns a new [CrossOriginProtection] value.
    **/
    @:native("NewCrossOriginProtection") static function newCrossOriginProtection(): (go.Pointer<go.net.http.CrossOriginProtection>);
    /**
        NewFileTransport returns a new [RoundTripper], serving the provided
        [FileSystem]. The returned RoundTripper ignores the URL host in its
        incoming requests, as well as most other properties of the
        request.
        
        The typical use case for NewFileTransport is to register the "file"
        protocol with a [Transport], as in:
        
        	t := &http.Transport{}
        	t.RegisterProtocol("file", http.NewFileTransport(http.Dir("/")))
        	c := &http.Client{Transport: t}
        	res, err := c.Get("file:///etc/passwd")
        	...
    **/
    @:native("NewFileTransport") static function newFileTransport(fs: go.net.http.FileSystem): (go.net.http.RoundTripper);
    /**
        NewFileTransportFS returns a new [RoundTripper], serving the provided
        file system fsys. The returned RoundTripper ignores the URL host in its
        incoming requests, as well as most other properties of the
        request. The files provided by fsys must implement [io.Seeker].
        
        The typical use case for NewFileTransportFS is to register the "file"
        protocol with a [Transport], as in:
        
        	fsys := os.DirFS("/")
        	t := &http.Transport{}
        	t.RegisterProtocol("file", http.NewFileTransportFS(fsys))
        	c := &http.Client{Transport: t}
        	res, err := c.Get("file:///etc/passwd")
        	...
    **/
    @:native("NewFileTransportFS") static function newFileTransportFS(fsys: go.io.fs.FS): (go.net.http.RoundTripper);
    /**
        NewRequest wraps [NewRequestWithContext] using [context.Background].
    **/
    @:native("NewRequest") static function newRequest(method: String, url: String, body: go.io.Reader): (go.Result<go.Pointer<go.net.http.Request>>);
    /**
        NewRequestWithContext returns a new [Request] given a method, URL, and
        optional body.
        
        If the provided body is also an [io.Closer], the returned
        [Request.Body] is set to body and will be closed (possibly
        asynchronously) by the Client methods Do, Post, and PostForm,
        and [Transport.RoundTrip].
        
        NewRequestWithContext returns a Request suitable for use with
        [Client.Do] or [Transport.RoundTrip]. To create a request for use with
        testing a Server Handler, either use the [net/http/httptest.NewRequest] function,
        use [ReadRequest], or manually update the Request fields.
        For an outgoing client request, the context
        controls the entire lifetime of a request and its response:
        obtaining a connection, sending the request, and reading the
        response headers and body. See the [Request] type's documentation for
        the difference between inbound and outbound request fields.
        
        If body is of type [*bytes.Buffer], [*bytes.Reader], or
        [*strings.Reader], the returned request's ContentLength is set to its
        exact value (instead of -1), GetBody is populated (so 307 and 308
        redirects can replay the body), and Body is set to [NoBody] if the
        ContentLength is 0.
    **/
    @:native("NewRequestWithContext") static function newRequestWithContext(ctx: go.context.Context, method: String, url: String, body: go.io.Reader): (go.Result<go.Pointer<go.net.http.Request>>);
    /**
        NewResponseController creates a [ResponseController] for a request.
        
        The ResponseWriter should be the original value passed to the [Handler.ServeHTTP] method,
        or have an Unwrap method returning the original ResponseWriter.
        
        If the ResponseWriter implements any of the following methods, the ResponseController
        will call them as appropriate:
        
        	Flush()
        	FlushError() error // alternative Flush returning an error
        	Hijack() (net.Conn, *bufio.ReadWriter, error)
        	SetReadDeadline(deadline time.Time) error
        	SetWriteDeadline(deadline time.Time) error
        	EnableFullDuplex() error
        
        If the ResponseWriter does not support a method, ResponseController returns
        an error matching [ErrNotSupported].
    **/
    @:native("NewResponseController") static function newResponseController(rw: go.net.http.ResponseWriter): (go.Pointer<go.net.http.ResponseController>);
    /**
        NewServeMux allocates and returns a new [ServeMux].
    **/
    @:native("NewServeMux") static function newServeMux(): (go.Pointer<go.net.http.ServeMux>);
    /**
        NotFound replies to the request with an HTTP 404 not found error.
    **/
    @:native("NotFound") static function notFound(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;
    /**
        NotFoundHandler returns a simple request handler
        that replies to each request with a “404 page not found” reply.
    **/
    @:native("NotFoundHandler") static function notFoundHandler(): (go.net.http.Handler);
    /**
        ParseCookie parses a Cookie header value and returns all the cookies
        which were set in it. Since the same cookie name can appear multiple times
        the returned Values can contain more than one value for a given key.
    **/
    @:native("ParseCookie") static function parseCookie(line: String): (go.Result<go.Slice<go.Pointer<go.net.http.Cookie>>>);
    /**
        ParseHTTPVersion parses an HTTP version string according to RFC 7230, section 2.6.
        "HTTP/1.0" returns (1, 0, true). Note that strings without
        a minor version, such as "HTTP/2", are not valid.
    **/
    @:go.Tuple("major", "minor", "ok") @:native("ParseHTTPVersion") static function parseHTTPVersion(vers: String): (go.Tuple<{ major: go.GoInt, minor: go.GoInt, ok: Bool }>);
    /**
        ParseSetCookie parses a Set-Cookie header value and returns a cookie.
        It returns an error on syntax error.
    **/
    @:native("ParseSetCookie") static function parseSetCookie(line: String): (go.Result<go.Pointer<go.net.http.Cookie>>);
    /**
        ParseTime parses a time header (such as the Date: header),
        trying each of the three formats allowed by HTTP/1.1:
        [TimeFormat], [time.RFC850], and [time.ANSIC].
    **/
    @:native("ParseTime") static function parseTime(text: String): (go.Result<go.time.Time>);
    /**
        Post issues a POST to the specified URL.
        
        Caller should close resp.Body when done reading from it.
        
        If the provided body is an [io.Closer], it is closed after the
        request.
        
        Post is a wrapper around DefaultClient.Post.
        
        To set custom headers, use [NewRequest] and DefaultClient.Do.
        
        See the [Client.Do] method documentation for details on how redirects
        are handled.
        
        To make a request with a specified context.Context, use [NewRequestWithContext]
        and DefaultClient.Do.
    **/
    @:native("Post") static function post(url: String, contentType: String, body: go.io.Reader): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        PostForm issues a POST to the specified URL, with data's keys and
        values URL-encoded as the request body.
        
        The Content-Type header is set to application/x-www-form-urlencoded.
        To set other headers, use [NewRequest] and DefaultClient.Do.
        
        When err is nil, resp always contains a non-nil resp.Body.
        Caller should close resp.Body when done reading from it.
        
        PostForm is a wrapper around DefaultClient.PostForm.
        
        See the [Client.Do] method documentation for details on how redirects
        are handled.
        
        To make a request with a specified [context.Context], use [NewRequestWithContext]
        and DefaultClient.Do.
    **/
    @:native("PostForm") static function postForm(url: String, data: go.net.url.Values): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        ProxyFromEnvironment returns the URL of the proxy to use for a
        given request, as indicated by the environment variables
        HTTP_PROXY, HTTPS_PROXY and NO_PROXY (or the lowercase versions
        thereof). Requests use the proxy from the environment variable
        matching their scheme, unless excluded by NO_PROXY.
        
        The environment values may be either a complete URL or a
        "host[:port]", in which case the "http" scheme is assumed.
        An error is returned if the value is a different form.
        
        A nil URL and nil error are returned if no proxy is defined in the
        environment, or a proxy should not be used for the given request,
        as defined by NO_PROXY.
        
        As a special case, if req.URL.Host is "localhost" (with or without
        a port number), then a nil URL and nil error will be returned.
    **/
    @:native("ProxyFromEnvironment") static function proxyFromEnvironment(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.url.URL>>);
    /**
        ProxyURL returns a proxy function (for use in a [Transport])
        that always returns the same URL.
    **/
    @:native("ProxyURL") static function proxyURL(fixedURL: go.Pointer<go.net.url.URL>): ((p0: go.Pointer<go.net.http.Request>) -> (go.Result<go.Pointer<go.net.url.URL>>));
    /**
        ReadRequest reads and parses an incoming request from b.
        
        ReadRequest is a low-level function and should only be used for
        specialized applications; most code should use the [Server] to read
        requests and handle them via the [Handler] interface. ReadRequest
        only supports HTTP/1.x requests. For HTTP/2, use golang.org/x/net/http2.
    **/
    @:native("ReadRequest") static function readRequest(b: go.Pointer<go.bufio.Reader>): (go.Result<go.Pointer<go.net.http.Request>>);
    /**
        ReadResponse reads and returns an HTTP response from r.
        The req parameter optionally specifies the [Request] that corresponds
        to this [Response]. If nil, a GET request is assumed.
        Clients must call resp.Body.Close when finished reading resp.Body.
        After that call, clients can inspect resp.Trailer to find key/value
        pairs included in the response trailer.
    **/
    @:native("ReadResponse") static function readResponse(r: go.Pointer<go.bufio.Reader>, req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Redirect replies to the request with a redirect to url,
        which may be a path relative to the request path.
        Any non-ASCII characters in url will be percent-encoded,
        but existing percent encodings will not be changed.
        
        The provided code should be in the 3xx range and is usually
        [StatusMovedPermanently], [StatusFound] or [StatusSeeOther].
        
        If the Content-Type header has not been set, [Redirect] sets it
        to "text/html; charset=utf-8" and writes a small HTML body.
        Setting the Content-Type header to any value, including nil,
        disables that behavior.
    **/
    @:native("Redirect") static function redirect(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>, url: String, code: go.GoInt): Void;
    /**
        RedirectHandler returns a request handler that redirects
        each request it receives to the given url using the given
        status code.
        
        The provided code should be in the 3xx range and is usually
        [StatusMovedPermanently], [StatusFound] or [StatusSeeOther].
    **/
    @:native("RedirectHandler") static function redirectHandler(url: String, code: go.GoInt): (go.net.http.Handler);
    /**
        Serve accepts incoming HTTP connections on the listener l,
        creating a new service goroutine for each. The service goroutines
        read requests and then call handler to reply to them.
        
        The handler is typically nil, in which case [DefaultServeMux] is used.
        
        HTTP/2 support is only enabled if the Listener returns [*tls.Conn]
        connections and they were configured with "h2" in the TLS
        Config.NextProtos.
        
        Serve always returns a non-nil error.
    **/
    @:native("Serve") static function serve(l: go.net.Listener, handler: go.net.http.Handler): (go.Error);
    /**
        ServeContent replies to the request using the content in the
        provided ReadSeeker. The main benefit of ServeContent over [io.Copy]
        is that it handles Range requests properly, sets the MIME type, and
        handles If-Match, If-Unmodified-Since, If-None-Match, If-Modified-Since,
        and If-Range requests.
        
        If the response's Content-Type header is not set, ServeContent
        first tries to deduce the type from name's file extension and,
        if that fails, falls back to reading the first block of the content
        and passing it to [DetectContentType].
        The name is otherwise unused; in particular it can be empty and is
        never sent in the response.
        
        If modtime is not the zero time or Unix epoch, ServeContent
        includes it in a Last-Modified header in the response. If the
        request includes an If-Modified-Since header, ServeContent uses
        modtime to decide whether the content needs to be sent at all.
        
        The content's Seek method must work: ServeContent uses
        a seek to the end of the content to determine its size.
        Note that [*os.File] implements the [io.ReadSeeker] interface.
        
        If the caller has set w's ETag header formatted per RFC 7232, section 2.3,
        ServeContent uses it to handle requests using If-Match, If-None-Match, or If-Range.
        
        If an error occurs when serving the request (for example, when
        handling an invalid range request), ServeContent responds with an
        error message. By default, ServeContent strips the Cache-Control,
        Content-Encoding, ETag, and Last-Modified headers from error responses.
        The GODEBUG setting httpservecontentkeepheaders=1 causes ServeContent
        to preserve these headers.
    **/
    @:native("ServeContent") static function serveContent(w: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>, name: String, modtime: go.time.Time, content: go.io.ReadSeeker): Void;
    /**
        ServeFile replies to the request with the contents of the named
        file or directory.
        
        If the provided file or directory name is a relative path, it is
        interpreted relative to the current directory and may ascend to
        parent directories. If the provided name is constructed from user
        input, it should be sanitized before calling [ServeFile].
        
        As a precaution, ServeFile will reject requests where r.URL.Path
        contains a ".." path element; this protects against callers who
        might unsafely use [filepath.Join] on r.URL.Path without sanitizing
        it and then use that filepath.Join result as the name argument.
        
        As another special case, ServeFile redirects any request where r.URL.Path
        ends in "/index.html" to the same path, without the final
        "index.html". To avoid such redirects either modify the path or
        use [ServeContent].
        
        Outside of those two special cases, ServeFile does not use
        r.URL.Path for selecting the file or directory to serve; only the
        file or directory provided in the name argument is used.
    **/
    @:native("ServeFile") static function serveFile(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>, name: String): Void;
    /**
        ServeFileFS replies to the request with the contents
        of the named file or directory from the file system fsys.
        The files provided by fsys must implement [io.Seeker].
        
        If the provided name is constructed from user input, it should be
        sanitized before calling [ServeFileFS].
        
        As a precaution, ServeFileFS will reject requests where r.URL.Path
        contains a ".." path element; this protects against callers who
        might unsafely use [filepath.Join] on r.URL.Path without sanitizing
        it and then use that filepath.Join result as the name argument.
        
        As another special case, ServeFileFS redirects any request where r.URL.Path
        ends in "/index.html" to the same path, without the final
        "index.html". To avoid such redirects either modify the path or
        use [ServeContent].
        
        Outside of those two special cases, ServeFileFS does not use
        r.URL.Path for selecting the file or directory to serve; only the
        file or directory provided in the name argument is used.
    **/
    @:native("ServeFileFS") static function serveFileFS(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>, fsys: go.io.fs.FS, name: String): Void;
    /**
        ServeTLS accepts incoming HTTPS connections on the listener l,
        creating a new service goroutine for each. The service goroutines
        read requests and then call handler to reply to them.
        
        The handler is typically nil, in which case [DefaultServeMux] is used.
        
        Additionally, files containing a certificate and matching private key
        for the server must be provided. If the certificate is signed by a
        certificate authority, the certFile should be the concatenation
        of the server's certificate, any intermediates, and the CA's certificate.
        
        ServeTLS always returns a non-nil error.
    **/
    @:native("ServeTLS") static function serveTLS(l: go.net.Listener, handler: go.net.http.Handler, certFile: String, keyFile: String): (go.Error);
    /**
        SetCookie adds a Set-Cookie header to the provided [ResponseWriter]'s headers.
        The provided cookie must have a valid Name. Invalid cookies may be
        silently dropped.
    **/
    @:native("SetCookie") static function setCookie(w: go.net.http.ResponseWriter, cookie: go.Pointer<go.net.http.Cookie>): Void;
    /**
        StatusText returns a text for the HTTP status code. It returns the empty
        string if the code is unknown.
    **/
    @:native("StatusText") static function statusText(code: go.GoInt): (String);
    /**
        StripPrefix returns a handler that serves HTTP requests by removing the
        given prefix from the request URL's Path (and RawPath if set) and invoking
        the handler h. StripPrefix handles a request for a path that doesn't begin
        with prefix by replying with an HTTP 404 not found error. The prefix must
        match exactly: if the prefix in the request contains escaped characters
        the reply is also an HTTP 404 not found error.
    **/
    @:native("StripPrefix") static function stripPrefix(prefix: String, h: go.net.http.Handler): (go.net.http.Handler);
    /**
        TimeoutHandler returns a [Handler] that runs h with the given time limit.
        
        The new Handler calls h.ServeHTTP to handle each request, but if a
        call runs for longer than its time limit, the handler responds with
        a 503 Service Unavailable error and the given message in its body.
        (If msg is empty, a suitable default message will be sent.)
        After such a timeout, writes by h to its [ResponseWriter] will return
        [ErrHandlerTimeout].
        
        TimeoutHandler supports the [Pusher] interface but does not support
        the [Hijacker] or [Flusher] interfaces.
    **/
    @:native("TimeoutHandler") static function timeoutHandler(h: go.net.http.Handler, dt: go.time.Duration, msg: String): (go.net.http.Handler);

}