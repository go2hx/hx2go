package go.net.http;

@:go.Type({ name: "CookieJar", instanceName: "http.CookieJar", imports: ["net/http"] })
extern typedef CookieJar = {

    @:native("Cookies") function cookies(u: go.Pointer<go.net.url.URL>): go.Slice<go.Pointer<go.net.http.Cookie>>;
    @:native("SetCookies") function setCookies(u: go.Pointer<go.net.url.URL>, cookies: go.Slice<go.Pointer<go.net.http.Cookie>>): Void;

}