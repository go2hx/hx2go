package go.net.http;

@:go.Type({ name: "cgi", instanceName: "cgi.cgi", imports: ["net/http/cgi"] })
extern class Cgi {

    @:native("Request") static function request(): go.Result<go.Pointer<go.net.http.Request>>;
    @:native("RequestFromMap") static function requestFromMap(params: go.Map<String, String>): go.Result<go.Pointer<go.net.http.Request>>;
    @:native("Serve") static function serve(handler: go.net.http.Handler): go.Error;

}