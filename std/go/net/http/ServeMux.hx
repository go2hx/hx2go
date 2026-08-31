package go.net.http;

/**
    ServeMux is an HTTP request multiplexer.
    It matches the URL of each incoming request against a list of registered
    patterns and calls the handler for the pattern that
    most closely matches the URL.
    
    # Patterns
    
    Patterns can match the method, host and path of a request.
    Some examples:
    
      - "/index.html" matches the path "/index.html" for any host and method.
      - "GET /static/" matches a GET request whose path begins with "/static/".
      - "example.com/" matches any request to the host "example.com".
      - "example.com/{$}" matches requests with host "example.com" and path "/".
      - "/b/{bucket}/o/{objectname...}" matches paths whose first segment is "b"
        and whose third segment is "o". The name "bucket" denotes the second
        segment and "objectname" denotes the remainder of the path.
    
    In general, a pattern looks like
    
    	[METHOD ][HOST]/[PATH]
    
    All three parts are optional; "/" is a valid pattern.
    If METHOD is present, it must be followed by at least one space or tab.
    
    Literal (that is, non-wildcard) parts of a pattern match
    the corresponding parts of a request case-sensitively.
    
    A pattern with no method matches every method. A pattern
    with the method GET matches both GET and HEAD requests.
    Otherwise, the method must match exactly.
    
    A pattern with no host matches every host.
    A pattern with a host matches URLs on that host only.
    
    A path can include wildcard segments of the form {NAME} or {NAME...}.
    For example, "/b/{bucket}/o/{objectname...}".
    The wildcard name must be a valid Go identifier.
    Wildcards must be full path segments: they must be preceded by a slash and followed by
    either a slash or the end of the string.
    For example, "/b_{bucket}" is not a valid pattern.
    
    Normally a wildcard matches only a single path segment,
    ending at the next literal slash (not %2F) in the request URL.
    But if the "..." is present, then the wildcard matches the remainder of the URL path, including slashes.
    (Therefore it is invalid for a "..." wildcard to appear anywhere but at the end of a pattern.)
    The match for a wildcard can be obtained by calling [Request.PathValue] with the wildcard's name.
    A trailing slash in a path acts as an anonymous "..." wildcard.
    
    The special wildcard {$} matches only the end of the URL.
    For example, the pattern "/{$}" matches only the path "/",
    whereas the pattern "/" matches every path.
    
    For matching, both pattern paths and incoming request paths are unescaped segment by segment.
    So, for example, the path "/a%2Fb/100%25" is treated as having two segments, "a/b" and "100%".
    The pattern "/a%2fb/" matches it, but the pattern "/a/b/" does not.
    
    # Precedence
    
    If two or more patterns match a request, then the most specific pattern takes precedence.
    A pattern P1 is more specific than P2 if P1 matches a strict subset of P2’s requests;
    that is, if P2 matches all the requests of P1 and more.
    If neither is more specific, then the patterns conflict.
    There is one exception to this rule, for backwards compatibility:
    if two patterns would otherwise conflict and one has a host while the other does not,
    then the pattern with the host takes precedence.
    If a pattern passed to [ServeMux.Handle] or [ServeMux.HandleFunc] conflicts with
    another pattern that is already registered, those functions panic.
    
    As an example of the general rule, "/images/thumbnails/" is more specific than "/images/",
    so both can be registered.
    The former matches paths beginning with "/images/thumbnails/"
    and the latter will match any other path in the "/images/" subtree.
    
    As another example, consider the patterns "GET /" and "/index.html":
    both match a GET request for "/index.html", but the former pattern
    matches all other GET and HEAD requests, while the latter matches any
    request for "/index.html" that uses a different method.
    The patterns conflict.
    
    # Trailing-slash redirection
    
    Consider a [ServeMux] with a handler for a subtree, registered using a trailing slash or "..." wildcard.
    If the ServeMux receives a request for the subtree root without a trailing slash,
    it redirects the request by adding the trailing slash.
    This behavior can be overridden with a separate registration for the path without
    the trailing slash or "..." wildcard. For example, registering "/images/" causes ServeMux
    to redirect a request for "/images" to "/images/", unless "/images" has
    been registered separately.
    
    # Request sanitizing
    
    ServeMux also takes care of sanitizing the URL request path and the Host
    header, stripping the port number and redirecting any request containing . or
    .. segments or repeated slashes to an equivalent, cleaner URL.
    Escaped path elements such as "%2e" for "." and "%2f" for "/" are preserved
    and aren't considered separators for request routing.
    
    # Compatibility
    
    The pattern syntax and matching behavior of ServeMux changed significantly
    in Go 1.22. To restore the old behavior, set the GODEBUG environment variable
    to "httpmuxgo121=1". This setting is read once, at program startup; changes
    during execution will be ignored.
    
    The backwards-incompatible changes include:
      - Wildcards are just ordinary literal path segments in 1.21.
        For example, the pattern "/{x}" will match only that path in 1.21,
        but will match any one-segment path in 1.22.
      - In 1.21, no pattern was rejected, unless it was empty or conflicted with an existing pattern.
        In 1.22, syntactically invalid patterns will cause [ServeMux.Handle] and [ServeMux.HandleFunc] to panic.
        For example, in 1.21, the patterns "/{"  and "/a{x}" match themselves,
        but in 1.22 they are invalid and will cause a panic when registered.
      - In 1.22, each segment of a pattern is unescaped; this was not done in 1.21.
        For example, in 1.22 the pattern "/%61" matches the path "/a" ("%61" being the URL escape sequence for "a"),
        but in 1.21 it would match only the path "/%2561" (where "%25" is the escape for the percent sign).
      - When matching patterns to paths, in 1.22 each segment of the path is unescaped; in 1.21, the entire path is unescaped.
        This change mostly affects how paths with %2F escapes adjacent to slashes are treated.
        See https://go.dev/issue/21955 for details.
**/
@:structInit
@:go.Type({ name: "ServeMux", instanceName: "http.ServeMux", imports: ["net/http"] })
extern class ServeMux {

    /**
        Handle registers the handler for the given pattern.
        If the given pattern conflicts with one that is already registered
        or if the pattern is invalid, Handle panics.
        
        See [ServeMux] for details on valid patterns and conflict rules.
    **/
    @:native("Handle") function handle(pattern: String, handler: go.net.http.Handler): Void;
    /**
        HandleFunc registers the handler function for the given pattern.
        If the given pattern conflicts with one that is already registered
        or if the pattern is invalid, HandleFunc panics.
        
        See [ServeMux] for details on valid patterns and conflict rules.
    **/
    @:native("HandleFunc") function handleFunc(pattern: String, handler: (p0: go.net.http.ResponseWriter, p1: go.Pointer<go.net.http.Request>) -> Void): Void;
    /**
        Handler returns the handler to use for the given request,
        consulting r.Method, r.Host, and r.URL.Path. It always returns
        a non-nil handler. If the path is not in its canonical form, the
        handler will be an internally-generated handler that redirects
        to the canonical path. If the host contains a port, it is ignored
        when matching handlers.
        
        The path and host are used unchanged for CONNECT requests.
        
        Handler also returns the registered pattern that matches the
        request or, in the case of internally-generated redirects,
        the path that will match after following the redirect.
        
        If there is no registered handler that applies to the request,
        Handler returns a “page not found” or “method not supported”
        handler and an empty pattern.
        
        Handler does not modify its argument. In particular, it does not
        populate named path wildcards, so r.PathValue will always return
        the empty string.
    **/
    @:go.Tuple("h", "pattern") @:native("Handler") function handler(r: go.Pointer<go.net.http.Request>): (go.Tuple<{ h: go.net.http.Handler, pattern: String }>);
    /**
        ServeHTTP dispatches the request to the handler whose
        pattern most closely matches the request URL.
    **/
    @:native("ServeHTTP") function serveHTTP(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}