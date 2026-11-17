package go.net.http.cookiejar;

/**
    Jar implements the http.CookieJar interface from the net/http package.
**/
@:structInit
@:go.Type({ name: "Jar", instanceName: "cookiejar.Jar", imports: ["net/http/cookiejar"] })
extern class Jar {

    /**
        Cookies implements the Cookies method of the [http.CookieJar] interface.
        
        It returns an empty slice if the URL's scheme is not HTTP or HTTPS.
    **/
    @:native("Cookies") function cookies(u: go.Pointer<go.net.url.URL>): (go.Slice<go.Pointer<go.net.http.Cookie>>);
    /**
        SetCookies implements the SetCookies method of the [http.CookieJar] interface.
        
        It does nothing if the URL's scheme is not HTTP or HTTPS.
    **/
    @:native("SetCookies") function setCookies(u: go.Pointer<go.net.url.URL>, cookies: go.Slice<go.Pointer<go.net.http.Cookie>>): Void;

}