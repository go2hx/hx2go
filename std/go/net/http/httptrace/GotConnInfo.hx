package go.net.http.httptrace;

@:structInit
@:go.Type({ name: "GotConnInfo", instanceName: "httptrace.GotConnInfo", imports: ["net/http/httptrace"] })
extern class GotConnInfo {

    @:native("Conn") var conn: go.net.Conn;
    @:native("Reused") var reused: Bool;
    @:native("WasIdle") var wasIdle: Bool;
    @:native("IdleTime") var idleTime: go.time.Duration;

function new(conn: go.net.Conn, reused: Bool, wasIdle: Bool, idleTime: go.time.Duration);

}