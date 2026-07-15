package go.net.http;

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

function new(name: String, value: String, quoted: Bool, path: String, domain: String, expires: go.time.Time, rawExpires: String, maxAge: go.GoInt, secure: Bool, httpOnly: Bool, sameSite: go.net.http.SameSite, partitioned: Bool, raw: String, unparsed: go.Slice<String>);

    @:native("String") function string(): String;
    @:native("Valid") function valid(): go.Error;

}