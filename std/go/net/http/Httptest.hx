package go.net.http;

@:go.Type({ name: "httptest", instanceName: "httptest.httptest", imports: ["net/http/httptest"] })
extern class Httptest {

    @:native("DefaultRemoteAddr") static var DefaultRemoteAddr: String;

    @:native("NewRecorder") static function newRecorder(): go.Pointer<go.net.http.httptest.ResponseRecorder>;
    @:native("NewRequest") static function newRequest(method: String, target: String, body: go.io.Reader): go.Pointer<go.net.http.Request>;
    @:native("NewRequestWithContext") static function newRequestWithContext(ctx: go.context.Context, method: String, target: String, body: go.io.Reader): go.Pointer<go.net.http.Request>;
    @:native("NewServer") static function newServer(handler: go.net.http.Handler): go.Pointer<go.net.http.httptest.Server>;
    @:native("NewTLSServer") static function newTLSServer(handler: go.net.http.Handler): go.Pointer<go.net.http.httptest.Server>;
    @:native("NewUnstartedServer") static function newUnstartedServer(handler: go.net.http.Handler): go.Pointer<go.net.http.httptest.Server>;

}