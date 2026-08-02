package go.net.http;

@:go.Type({ name: "cookiejar", instanceName: "cookiejar.cookiejar", imports: ["net/http/cookiejar"] })
extern class Cookiejar_ {

    @:native("New") static function _new(o: go.Pointer<go.net.http.cookiejar.Options>): (go.Result<go.Pointer<go.net.http.cookiejar.Jar>>);

}