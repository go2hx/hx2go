package go.net;

@:structInit
@:go.Type({ name: "DNSConfigError", instanceName: "net.DNSConfigError", imports: ["net"] })
extern class DNSConfigError {

    @:native("Err") var err: go.Error;

function new(err: go.Error);

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;
    @:native("Unwrap") function unwrap(): go.Error;

}