package go.net.http;

/**
    Package cookiejar implements an in-memory RFC 6265-compliant http.CookieJar.
**/
@:go.Type({ name: "cookiejar", instanceName: "cookiejar.cookiejar", imports: ["net/http/cookiejar"] })
extern class Cookiejar_ {

    /**
        New returns a new cookie jar. A nil [*Options] is equivalent to a zero
        Options.
    **/
    @:native("New") static function _new(o: go.Pointer<go.net.http.cookiejar.Options>): (go.Result<go.Pointer<go.net.http.cookiejar.Jar>>);

}