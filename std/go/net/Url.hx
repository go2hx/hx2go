package go.net;

@:go.Type({ name: "url", instanceName: "url.url", imports: ["net/url"] })
extern class Url {

    @:native("JoinPath") static function joinPath(base: String, elem: haxe.Rest<String>): go.Result<String>;
    @:native("Parse") static function parse(rawURL: String): go.Result<go.Pointer<go.net.url.URL>>;
    @:native("ParseQuery") static function parseQuery(query: String): go.Result<go.net.url.Values>;
    @:native("ParseRequestURI") static function parseRequestURI(rawURL: String): go.Result<go.Pointer<go.net.url.URL>>;
    @:native("PathEscape") static function pathEscape(s: String): String;
    @:native("PathUnescape") static function pathUnescape(s: String): go.Result<String>;
    @:native("QueryEscape") static function queryEscape(s: String): String;
    @:native("QueryUnescape") static function queryUnescape(s: String): go.Result<String>;
    @:native("User") static function user(username: String): go.Pointer<go.net.url.Userinfo>;
    @:native("UserPassword") static function userPassword(username: String, password: String): go.Pointer<go.net.url.Userinfo>;

}