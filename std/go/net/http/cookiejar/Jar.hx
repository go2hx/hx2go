package go.net.http.cookiejar;

@:structInit
@:go.Type({ name: "Jar", instanceName: "cookiejar.Jar", imports: ["net/http/cookiejar"] })
extern class Jar {

    @:native("Cookies") function cookies(u: go.Pointer<go.net.url.URL>): go.Slice<go.Pointer<go.net.http.Cookie>>;
    @:native("SetCookies") function setCookies(u: go.Pointer<go.net.url.URL>, cookies: go.Slice<go.Pointer<go.net.http.Cookie>>): Void;

}