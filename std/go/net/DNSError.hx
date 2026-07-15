package go.net;

@:structInit
@:go.Type({ name: "DNSError", instanceName: "net.DNSError", imports: ["net"] })
extern class DNSError {

    @:native("UnwrapErr") var unwrapErr: go.Error;
    @:native("Err") var err: String;
    @:native("Name") var name: String;
    @:native("Server") var server: String;
    @:native("IsTimeout") var isTimeout: Bool;
    @:native("IsTemporary") var isTemporary: Bool;
    @:native("IsNotFound") var isNotFound: Bool;

function new(unwrapErr: go.Error, err: String, name: String, server: String, isTimeout: Bool, isTemporary: Bool, isNotFound: Bool);

    @:native("Error") function error(): String;
    @:native("Temporary") function temporary(): Bool;
    @:native("Timeout") function timeout(): Bool;
    @:native("Unwrap") function unwrap(): go.Error;

}