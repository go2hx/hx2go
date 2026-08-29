package go.net.http;

/**
    A Cookie represents an HTTP cookie as sent in the Set-Cookie header of an
    HTTP response or the Cookie header of an HTTP request.
    
    See https://tools.ietf.org/html/rfc6265 for details.
**/
@:structInit
@:go.Type({ name: "Cookie", instanceName: "http.Cookie", imports: ["net/http"] })
extern class Cookie {

    @:native("Name") var name: String;
    @:native("Value") var value: String;
    @:native("Quoted") var quoted: Bool;
    @:native("Path") var path: String;
    @:native("Domain") var domain: String;
    @:native("Expires") var expires: go.time.Time;
    @:native("RawExpires") var rawExpires: String;
    @:native("MaxAge") var maxAge: go.GoInt;
    @:native("Secure") var secure: Bool;
    @:native("HttpOnly") var httpOnly: Bool;
    @:native("SameSite") var sameSite: go.net.http.SameSite;
    @:native("Partitioned") var partitioned: Bool;
    @:native("Raw") var raw: String;
    @:native("Unparsed") var unparsed: go.Slice<String>;

    function new(name: String="", value: String="", quoted: Bool=false, path: String="", domain: String="", expires: go.time.Time, rawExpires: String="", maxAge: go.GoInt=0, secure: Bool=false, httpOnly: Bool=false, sameSite: go.net.http.SameSite=cast 0, partitioned: Bool=false, raw: String="", unparsed: go.Slice<String>=null);

    /**
        String returns the serialization of the cookie for use in a [Cookie]
        header (if only Name and Value are set) or a Set-Cookie response
        header (if other fields are set).
        If c is nil or c.Name is invalid, the empty string is returned.
    **/
    @:native("String") function string(): (String);
    /**
        Valid reports whether the cookie is valid.
    **/
    @:native("Valid") function valid(): (go.Error);

}