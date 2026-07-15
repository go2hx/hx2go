package go.net.url;

@:structInit
@:go.Type({ name: "Userinfo", instanceName: "url.Userinfo", imports: ["net/url"] })
extern class Userinfo {

    @:go.Tuple("p0", "p1") @:native("Password") function password(): go.Tuple<{ p0: String, p1: Bool }>;
    @:native("String") function string(): String;
    @:native("Username") function username(): String;

}