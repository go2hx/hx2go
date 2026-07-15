package go.net;

@:structInit
@:go.Type({ name: "OpError", instanceName: "net.OpError", imports: ["net"] })
extern class OpError {

    @:native("Op") var op: String;
    @:native("Net") var net: String;
    @:native("Source") var source: go.net.Addr;
    @:native("Addr") var addr: go.net.Addr;
    @:native("Err") var err: go.Error;

function new(op: String, net: String, source: go.net.Addr, addr: go.net.Addr, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;
    @:native("Unwrap") function unwrap(): go.Error;

}