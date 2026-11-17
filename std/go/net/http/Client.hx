package go.net.http;

/**
    A Client is an HTTP client. Its zero value ([DefaultClient]) is a
    usable client that uses [DefaultTransport].
    
    The [Client.Transport] typically has internal state (cached TCP
    connections), so Clients should be reused instead of created as
    needed. Clients are safe for concurrent use by multiple goroutines.
    
    A Client is higher-level than a [RoundTripper] (such as [Transport])
    and additionally handles HTTP details such as cookies and
    redirects.
    
    When following redirects, the Client will forward all headers set on the
    initial [Request] except:
    
      - when forwarding sensitive headers like "Authorization",
        "WWW-Authenticate", and "Cookie" to untrusted targets.
        These headers will be ignored when following a redirect to a domain
        that is not a subdomain match or exact match of the initial domain.
        For example, a redirect from "foo.com" to either "foo.com" or "sub.foo.com"
        will forward the sensitive headers, but a redirect to "bar.com" will not.
      - when forwarding the "Cookie" header with a non-nil cookie Jar.
        Since each redirect may mutate the state of the cookie jar,
        a redirect may possibly alter a cookie set in the initial request.
        When forwarding the "Cookie" header, any mutated cookies will be omitted,
        with the expectation that the Jar will insert those mutated cookies
        with the updated values (assuming the origin matches).
        If Jar is nil, the initial cookies are forwarded without change.
**/
@:structInit
@:go.Type({ name: "Client", instanceName: "http.Client", imports: ["net/http"] })
extern class Client {

    @:native("Transport") var transport: go.net.http.RoundTripper;
    @:native("CheckRedirect") var checkRedirect: (req: go.Pointer<go.net.http.Request>, via: go.Slice<go.Pointer<go.net.http.Request>>) -> (go.Error);
    @:native("Jar") var jar: go.net.http.CookieJar;
    @:native("Timeout") var timeout: go.time.Duration;

    function new(transport: go.net.http.RoundTripper=null, checkRedirect: (req: go.Pointer<go.net.http.Request>, via: go.Slice<go.Pointer<go.net.http.Request>>) -> (go.Error)=null, jar: go.net.http.CookieJar=null, timeout: go.time.Duration=cast 0);

    /**
        CloseIdleConnections closes any connections on its [Transport] which
        were previously connected from previous requests but are now
        sitting idle in a "keep-alive" state. It does not interrupt any
        connections currently in use.
        
        If [Client.Transport] does not have a [Client.CloseIdleConnections] method
        then this method does nothing.
    **/
    @:native("CloseIdleConnections") function closeIdleConnections(): Void;
    /**
        Do sends an HTTP request and returns an HTTP response, following
        policy (such as redirects, cookies, auth) as configured on the
        client.
        
        An error is returned if caused by client policy (such as
        CheckRedirect), or failure to speak HTTP (such as a network
        connectivity problem). A non-2xx status code doesn't cause an
        error.
        
        If the returned error is nil, the [Response] will contain a non-nil
        Body which the user is expected to close. If the Body is not both
        read to EOF and closed, the [Client]'s underlying [RoundTripper]
        (typically [Transport]) may not be able to re-use a persistent TCP
        connection to the server for a subsequent "keep-alive" request.
        
        The request Body, if non-nil, will be closed by the underlying
        Transport, even on errors. The Body may be closed asynchronously after
        Do returns.
        
        On error, any Response can be ignored. A non-nil Response with a
        non-nil error only occurs when CheckRedirect fails, and even then
        the returned [Response.Body] is already closed.
        
        Generally [Get], [Post], or [PostForm] will be used instead of Do.
        
        If the server replies with a redirect, the Client first uses the
        CheckRedirect function to determine whether the redirect should be
        followed. If permitted, a 301, 302, or 303 redirect causes
        subsequent requests to use HTTP method GET
        (or HEAD if the original request was HEAD), with no body.
        A 307 or 308 redirect preserves the original HTTP method and body,
        provided that the [Request.GetBody] function is defined.
        The [NewRequest] function automatically sets GetBody for common
        standard library body types.
        
        Any returned error will be of type [*url.Error]. The url.Error
        value's Timeout method will report true if the request timed out.
    **/
    @:native("Do") function _do(req: go.Pointer<go.net.http.Request>): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Get issues a GET to the specified URL. If the response is one of the
        following redirect codes, Get follows the redirect after calling the
        [Client.CheckRedirect] function:
        
        	301 (Moved Permanently)
        	302 (Found)
        	303 (See Other)
        	307 (Temporary Redirect)
        	308 (Permanent Redirect)
        
        An error is returned if the [Client.CheckRedirect] function fails
        or if there was an HTTP protocol error. A non-2xx response doesn't
        cause an error. Any returned error will be of type [*url.Error]. The
        url.Error value's Timeout method will report true if the request
        timed out.
        
        When err is nil, resp always contains a non-nil resp.Body.
        Caller should close resp.Body when done reading from it.
        
        To make a request with custom headers, use [NewRequest] and [Client.Do].
        
        To make a request with a specified context.Context, use [NewRequestWithContext]
        and Client.Do.
    **/
    @:native("Get") function get(url: String): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Head issues a HEAD to the specified URL. If the response is one of the
        following redirect codes, Head follows the redirect after calling the
        [Client.CheckRedirect] function:
        
        	301 (Moved Permanently)
        	302 (Found)
        	303 (See Other)
        	307 (Temporary Redirect)
        	308 (Permanent Redirect)
        
        To make a request with a specified [context.Context], use [NewRequestWithContext]
        and [Client.Do].
    **/
    @:native("Head") function head(url: String): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        Post issues a POST to the specified URL.
        
        Caller should close resp.Body when done reading from it.
        
        If the provided body is an [io.Closer], it is closed after the
        request.
        
        To set custom headers, use [NewRequest] and [Client.Do].
        
        To make a request with a specified context.Context, use [NewRequestWithContext]
        and [Client.Do].
        
        See the [Client.Do] method documentation for details on how redirects
        are handled.
    **/
    @:native("Post") function post(url: String, contentType: String, body: go.io.Reader): (go.Result<go.Pointer<go.net.http.Response>>);
    /**
        PostForm issues a POST to the specified URL,
        with data's keys and values URL-encoded as the request body.
        
        The Content-Type header is set to application/x-www-form-urlencoded.
        To set other headers, use [NewRequest] and [Client.Do].
        
        When err is nil, resp always contains a non-nil resp.Body.
        Caller should close resp.Body when done reading from it.
        
        See the [Client.Do] method documentation for details on how redirects
        are handled.
        
        To make a request with a specified context.Context, use [NewRequestWithContext]
        and Client.Do.
    **/
    @:native("PostForm") function postForm(url: String, data: go.net.url.Values): (go.Result<go.Pointer<go.net.http.Response>>);

}