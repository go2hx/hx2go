package go.net.url;

/**
    A URL represents a parsed URL (technically, a URI reference).
    
    The general form represented is:
    
    	[scheme:][//[userinfo@]host][/]path[?query][#fragment]
    
    URLs that do not start with a slash after the scheme are interpreted as:
    
    	scheme:opaque[?query][#fragment]
    
    The Host field contains the host and port subcomponents of the URL.
    When the port is present, it is separated from the host with a colon.
    When the host is an IPv6 address, it must be enclosed in square brackets:
    "[fe80::1]:80". The [net.JoinHostPort] function combines a host and port
    into a string suitable for the Host field, adding square brackets to
    the host when necessary.
    
    Note that the Path field is stored in decoded form: /%47%6f%2f becomes /Go/.
    A consequence is that it is impossible to tell which slashes in the Path were
    slashes in the raw URL and which were %2f. This distinction is rarely important,
    but when it is, the code should use the [URL.EscapedPath] method, which preserves
    the original encoding of Path. The Fragment field is also stored in decoded form,
    use [URL.EscapedFragment] to retrieve the original encoding.
    
    The [URL.String] method uses the [URL.EscapedPath] method to obtain the path.
**/
@:structInit
@:go.Type({ name: "URL", instanceName: "url.URL", imports: ["net/url"] })
extern class URL {

    @:native("Scheme") var scheme: String;
    @:native("Opaque") var opaque: String;
    @:native("User") var user: go.Pointer<go.net.url.Userinfo>;
    @:native("Host") var host: String;
    @:native("Path") var path: String;
    @:native("Fragment") var fragment: String;
    @:native("RawQuery") var rawQuery: String;
    @:native("RawPath") var rawPath: String;
    @:native("RawFragment") var rawFragment: String;
    @:native("ForceQuery") var forceQuery: Bool;
    @:native("OmitHost") var omitHost: Bool;

    function new(scheme: String="", opaque: String="", user: go.Pointer<go.net.url.Userinfo>=null, host: String="", path: String="", fragment: String="", rawQuery: String="", rawPath: String="", rawFragment: String="", forceQuery: Bool=false, omitHost: Bool=false);

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    /**
        EscapedFragment returns the escaped form of u.Fragment.
        In general there are multiple possible escaped forms of any fragment.
        EscapedFragment returns u.RawFragment when it is a valid escaping of u.Fragment.
        Otherwise EscapedFragment ignores u.RawFragment and computes an escaped
        form on its own.
        The [URL.String] method uses EscapedFragment to construct its result.
        In general, code should call EscapedFragment instead of
        reading u.RawFragment directly.
    **/
    @:native("EscapedFragment") function escapedFragment(): (String);
    /**
        EscapedPath returns the escaped form of u.Path.
        In general there are multiple possible escaped forms of any path.
        EscapedPath returns u.RawPath when it is a valid escaping of u.Path.
        Otherwise EscapedPath ignores u.RawPath and computes an escaped
        form on its own.
        The [URL.String] and [URL.RequestURI] methods use EscapedPath to construct
        their results.
        In general, code should call EscapedPath instead of
        reading u.RawPath directly.
    **/
    @:native("EscapedPath") function escapedPath(): (String);
    /**
        Hostname returns u.Host, stripping any valid port number if present.
        
        If the result is enclosed in square brackets, as literal IPv6 addresses are,
        the square brackets are removed from the result.
    **/
    @:native("Hostname") function hostname(): (String);
    /**
        IsAbs reports whether the [URL] is absolute.
        Absolute means that it has a non-empty scheme.
    **/
    @:native("IsAbs") function isAbs(): (Bool);
    /**
        JoinPath returns a new [URL] with the provided path elements joined to
        any existing path and the resulting path cleaned of any ./ or ../ elements.
        Any sequences of multiple / characters will be reduced to a single /.
        Path elements must already be in escaped form, as produced by [PathEscape].
    **/
    @:native("JoinPath") function joinPath(elem: haxe.Rest<String>): (go.Pointer<go.net.url.URL>);
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    /**
        Parse parses a [URL] in the context of the receiver. The provided URL
        may be relative or absolute. Parse returns nil, err on parse
        failure, otherwise its return value is the same as [URL.ResolveReference].
    **/
    @:native("Parse") function parse(ref: String): (go.Result<go.Pointer<go.net.url.URL>>);
    /**
        Port returns the port part of u.Host, without the leading colon.
        
        If u.Host doesn't contain a valid numeric port, Port returns an empty string.
    **/
    @:native("Port") function port(): (String);
    /**
        Query parses RawQuery and returns the corresponding values.
        It silently discards malformed value pairs.
        To check errors use [ParseQuery].
    **/
    @:native("Query") function query(): (go.net.url.Values);
    /**
        Redacted is like [URL.String] but replaces any password with "xxxxx".
        Only the password in u.User is redacted.
    **/
    @:native("Redacted") function redacted(): (String);
    /**
        RequestURI returns the encoded path?query or opaque?query
        string that would be used in an HTTP request for u.
    **/
    @:native("RequestURI") function requestURI(): (String);
    /**
        ResolveReference resolves a URI reference to an absolute URI from
        an absolute base URI u, per RFC 3986 Section 5.2. The URI reference
        may be relative or absolute. ResolveReference always returns a new
        [URL] instance, even if the returned URL is identical to either the
        base or reference. If ref is an absolute URL, then ResolveReference
        ignores base and returns a copy of ref.
    **/
    @:native("ResolveReference") function resolveReference(ref: go.Pointer<go.net.url.URL>): (go.Pointer<go.net.url.URL>);
    /**
        String reassembles the [URL] into a valid URL string.
        The general form of the result is one of:
        
        	scheme:opaque?query#fragment
        	scheme://userinfo@host/path?query#fragment
        
        If u.Opaque is non-empty, String uses the first form;
        otherwise it uses the second form.
        Any non-ASCII characters in host are escaped.
        To obtain the path, String uses u.EscapedPath().
        
        In the second form, the following rules apply:
          - if u.Scheme is empty, scheme: is omitted.
          - if u.User is nil, userinfo@ is omitted.
          - if u.Host is empty, host/ is omitted.
          - if u.Scheme and u.Host are empty and u.User is nil,
            the entire scheme://userinfo@host/ is omitted.
          - if u.Host is non-empty and u.Path begins with a /,
            the form host/path does not add its own /.
          - if u.RawQuery is empty, ?query is omitted.
          - if u.Fragment is empty, #fragment is omitted.
    **/
    @:native("String") function string(): (String);
    @:native("UnmarshalBinary") function unmarshalBinary(text: go.Slice<go.Byte>): (go.Error);

}