package go.net.http;

@:go.Type({ name: "fcgi", instanceName: "fcgi.fcgi", imports: ["net/http/fcgi"] })
extern class Fcgi {

    @:native("ProcessEnv") static function processEnv(r: go.Pointer<go.net.http.Request>): go.Map<String, String>;
    @:native("Serve") static function serve(l: go.net.Listener, handler: go.net.http.Handler): go.Error;

}