package go.net.http;

@:go.Type({ name: "pprof", instanceName: "pprof.pprof", imports: ["net/http/pprof"] })
extern class Pprof {

    @:native("Cmdline") static function cmdline(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;
    @:native("Handler") static function handler(name: String): go.net.http.Handler;
    @:native("Index") static function index(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;
    @:native("Profile") static function profile(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;
    @:native("Symbol") static function symbol(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;
    @:native("Trace") static function trace(w: go.net.http.ResponseWriter, r: go.Pointer<go.net.http.Request>): Void;

}