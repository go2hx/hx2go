package go.net;

/**
    OpError is the error type usually returned by functions in the net
    package. It describes the operation, network type, and address of
    an error.
**/
@:structInit
@:go.Type({ name: "OpError", instanceName: "net.OpError", imports: ["net"] })
extern class OpError {

    @:native("Op") var op: String;
    @:native("Net") var net: String;
    @:native("Source") var source: go.net.Addr;
    @:native("Addr") var addr: go.net.Addr;
    @:native("Err") var err: go.Error;

    function new(op: String="", net: String="", source: go.net.Addr=null, addr: go.net.Addr=null, err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);
    @:native("Unwrap") function unwrap(): (go.Error);

}