package go.net;

/**
    DNSError represents a DNS lookup error.
**/
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

    function new(unwrapErr: go.Error=null, err: String="", name: String="", server: String="", isTimeout: Bool=false, isTemporary: Bool=false, isNotFound: Bool=false);

    @:native("Error") function error(): (String);
    /**
        Temporary reports whether the DNS error is known to be temporary.
        This is not always known; a DNS lookup may fail due to a temporary
        error and return a [DNSError] for which Temporary returns false.
    **/
    @:native("Temporary") function temporary(): (Bool);
    /**
        Timeout reports whether the DNS lookup is known to have timed out.
        This is not always known; a DNS lookup may fail due to a timeout
        and return a [DNSError] for which Timeout returns false.
    **/
    @:native("Timeout") function timeout(): (Bool);
    /**
        Unwrap returns e.UnwrapErr.
    **/
    @:native("Unwrap") function unwrap(): (go.Error);

}