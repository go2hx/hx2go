package go.net;

@:structInit
@:go.Type({ name: "AddrError", instanceName: "net.AddrError", imports: ["net"] })
extern class AddrError {

    @:native("Err") var err: String;
    @:native("Addr") var addr: String;

function new(err: String, addr: String);

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;

}