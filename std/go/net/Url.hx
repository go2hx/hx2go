package go.net;

@:go.Type({ name: "url", instanceName: "url.url", imports: ["net/url"] })
extern class Url {

    /**
        JoinPath returns a [URL] string with the provided path elements joined to
        the existing path of base and the resulting path cleaned of any ./ or ../ elements.
        Path elements must already be in escaped form, as produced by [PathEscape].
    **/
    @:native("JoinPath") static function joinPath(base: String, elem: haxe.Rest<String>): (go.Result<String>);
    /**
        Parse parses a raw url into a [URL] structure.
        
        The url may be relative (a path, without a host) or absolute
        (starting with a scheme). Trying to parse a hostname and path
        without a scheme is invalid but may not necessarily return an
        error, due to parsing ambiguities.
    **/
    @:native("Parse") static function parse(rawURL: String): (go.Result<go.Pointer<go.net.url.URL>>);
    /**
        ParseQuery parses the URL-encoded query string and returns
        a map listing the values specified for each key.
        ParseQuery always returns a non-nil map containing all the
        valid query parameters found; err describes the first decoding error
        encountered, if any.
        
        Query is expected to be a list of key=value settings separated by ampersands.
        A setting without an equals sign is interpreted as a key set to an empty
        value.
        Settings containing a non-URL-encoded semicolon are considered invalid.
    **/
    @:native("ParseQuery") static function parseQuery(query: String): (go.Result<go.net.url.Values>);
    /**
        ParseRequestURI parses a raw url into a [URL] structure. It assumes that
        url was received in an HTTP request, so the url is interpreted
        only as an absolute URI or an absolute path.
        The string url is assumed not to have a #fragment suffix.
        (Web browsers strip #fragment before sending the URL to a web server.)
    **/
    @:native("ParseRequestURI") static function parseRequestURI(rawURL: String): (go.Result<go.Pointer<go.net.url.URL>>);
    /**
        PathEscape escapes the string so it can be safely placed inside a [URL] path segment,
        replacing special characters (including /) with %XX sequences as needed.
    **/
    @:native("PathEscape") static function pathEscape(s: String): (String);
    /**
        PathUnescape does the inverse transformation of [PathEscape],
        converting each 3-byte encoded substring of the form "%AB" into the
        hex-decoded byte 0xAB. It returns an error if any % is not followed
        by two hexadecimal digits.
        
        PathUnescape is identical to [QueryUnescape] except that it does not
        unescape '+' to ' ' (space).
    **/
    @:native("PathUnescape") static function pathUnescape(s: String): (go.Result<String>);
    /**
        QueryEscape escapes the string so it can be safely placed
        inside a [URL] query.
    **/
    @:native("QueryEscape") static function queryEscape(s: String): (String);
    /**
        QueryUnescape does the inverse transformation of [QueryEscape],
        converting each 3-byte encoded substring of the form "%AB" into the
        hex-decoded byte 0xAB.
        It returns an error if any % is not followed by two hexadecimal
        digits.
    **/
    @:native("QueryUnescape") static function queryUnescape(s: String): (go.Result<String>);
    /**
        User returns a [Userinfo] containing the provided username
        and no password set.
    **/
    @:native("User") static function user(username: String): (go.Pointer<go.net.url.Userinfo>);
    /**
        UserPassword returns a [Userinfo] containing the provided username
        and password.
        
        This functionality should only be used with legacy web sites.
        RFC 2396 warns that interpreting Userinfo this way
        “is NOT RECOMMENDED, because the passing of authentication
        information in clear text (such as URI) has proven to be a
        security risk in almost every case where it has been used.”
    **/
    @:native("UserPassword") static function userPassword(username: String, password: String): (go.Pointer<go.net.url.Userinfo>);

}