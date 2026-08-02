package go.net.http.fcgi;

@:structInit
@:go.Type({ name: "conn", instanceName: "fcgi.conn", imports: ["net/http/fcgi"] })
extern class Conn {

    @:native("Close") function close(): (go.Error);

}